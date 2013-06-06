using System;
using System.Linq;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace Accounts.Models
{
    // Two versions of Database class - one generic another not. Generic used to return typed models, nongeneric is for executing non-query procedures.

    public class DataBase<T> where T : BaseModel, new()
    {
        readonly static string connStr = ConfigurationManager.ConnectionStrings["local"].ConnectionString;

        public static List<T> GetModel<T>(string procedureName)
        {
            return GetModel<T>(procedureName, new SqlParameter[] {});
        }
        public static List<T> GetModel<T>(string procedureName, SqlParameter[] parameters)
        {
            var messages = new List<T>();

            using (var conn = new SqlConnection(connStr))
            {
                int timeout = int.Parse(ConfigurationManager.AppSettings["DatabaseTimeout"].Trim());
                var cmd = new SqlCommand
                {
                    CommandText = procedureName,
                    Connection = conn,
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = timeout
                };

                foreach (var parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                conn.Open();
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        var t = (T)Activator.CreateInstance(typeof(T));

                        MethodInfo method = typeof(T).GetMethod("FromReader");
                        method.Invoke(t, new object[]{dr});
                        messages.Add(t);
                    }
                }
            }
            return messages;
        }        
    }

    public class DataBase
    {
        readonly static string connStr = ConfigurationManager.ConnectionStrings["local"].ConnectionString;
        readonly static string prefix = ConfigurationManager.AppSettings["ReportingPrefix"];

        public static List<KeyValuePair<string, T[]>> Get<T>(string procedureName, SqlParameter[] parameters)
        {
            var result = new List<KeyValuePair<string, T[]>>();

            string str = String.Empty;
            
            using (var conn = new SqlConnection(connStr))
            {
                var cmd = new SqlCommand { CommandText = procedureName,Connection = conn, CommandType = CommandType.StoredProcedure };

                foreach (var parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                conn.Open();
                using (var dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        string name = dr.GetValue(0).ToString();

                        var values = new List<T>();
                        for(int i=1; i<dr.VisibleFieldCount; i++)
                        {
                            var value = (T)Convert.ChangeType(dr.GetValue(i), typeof(T));
                            values.Add(value);
                        }

                        result.Add(new KeyValuePair<string, T[]>(name, values.ToArray()));
                        str += dr.GetValue(0) + Environment.NewLine;
                    }
                }
            }
            return result;
        }

        public static string ExecuteNonQueryProc(string procedureName)
        {
            return ExecuteNonQueryProc(procedureName, new List<SqlParameter>());
        }
        public static string ExecuteNonQueryProc(string procedureName, List<SqlParameter> parameters)
        {
            try
            {
                using (var conn = new SqlConnection(connStr))
                {
                    int timeout = int.Parse(ConfigurationManager.AppSettings["DatabaseTimeout"].Trim());
                    var cmd = new SqlCommand
                                  {
                                      CommandText = procedureName,
                                      Connection = conn,
                                      CommandType = CommandType.StoredProcedure,
                                      CommandTimeout = timeout
                                  };

                    foreach (var parameter in parameters)
                    {
                        cmd.Parameters.Add(parameter);
                    }

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    if (cmd.Parameters.Contains("@Output"))
                    {
                        return Convert.ToString(cmd.Parameters["@Output"].Value);
                    }
                    return String.Empty;
                }
            }
            catch(Exception excp)
            {
                return "ERROR";
            }
        }

        public static List<List<KeyValuePair<string, string[]>>> GetMultipleRecordset(string procedureName)
        {
            return GetMultipleRecordset(procedureName, new SqlParameter[]{});
        }
        public static List<List<KeyValuePair<string, string[]>>> GetMultipleRecordset(string procedureName, SqlParameter[] parameters) 
        {
            var results = new List<List<KeyValuePair<string, string[]>>>();

            string str = String.Empty;
            
            using (var conn = new SqlConnection(connStr))
            {
                int timeout = int.Parse(ConfigurationManager.AppSettings["DatabaseTimeout"].Trim());
                var cmd = new SqlCommand
                {
                    CommandText = prefix + procedureName,
                    Connection = conn, 
                    CommandType = CommandType.StoredProcedure, CommandTimeout = timeout };

                foreach (var parameter in parameters)
                {
                    cmd.Parameters.Add(parameter);
                }

                conn.Open();
                using (var dr = cmd.ExecuteReader())
                {
                    do
                    {
                        var start = DateTime.Now.ToString("HH:mm:ss.ffffff");
                        var result = new List<KeyValuePair<string, string[]>>();

                        while (dr.Read())
                        {
                            // Prepare column headers
                            if (result.Count == 0)
                            {
                                var schema = dr.GetSchemaTable();
                                var _values = new List<string>();
                                for (int i = 1; i < dr.VisibleFieldCount; i++)
                                {
                                    _values.Add(schema.Rows[i][0].ToString());
                                }
                                result.Add(new KeyValuePair<string, string[]>(schema.Rows[0][0].ToString(), _values.ToArray()));
                            }

                            string name = dr.GetValue(0).ToString();
                            var values = new List<string>();
                            for (int i = 1; i < dr.VisibleFieldCount; i++)
                            {
                                values.Add(dr.GetValue(i).ToString());
                            }

                            result.Add(new KeyValuePair<string, string[]>(name, values.ToArray()));
                            str += dr.GetValue(0) + Environment.NewLine;
                        }

                        var end = DateTime.Now.ToString("HH:mm:ss.ffffff");

                        var csv = string.Format("{0};{1};{2}", (result.Count == 0 ? 0 : result.Count - 1), start, end);
                        var kv = new KeyValuePair<string, string[]>(csv, new[] { String.Empty, String.Empty });
                        result.Add(kv);

                        results.Add(result);
                    }
                    while (dr.NextResult());
                }
            }
            return results;
        }

        //public static List<List<KeyValuePair<string, string[]>>> ExecuteMultipleRecordset(string proc, string from, string to, string regions, string extraParams, string extraParamValues)
        //{
        //    var extraParameters = ExtraParameters(from, to, regions, extraParams, extraParamValues);

        //    var table = GetMultipleRecordset(proc, extraParameters);
        //    return table;
        //}
    }
}