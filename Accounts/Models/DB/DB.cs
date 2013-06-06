using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Accounts.Models
{
    public class DB
    {
        readonly static string connectionString = ConfigurationManager.ConnectionStrings["local"].ConnectionString;

        public static int StoredProcedure(string procedureName, List<SqlParameter> parameters)
        {
            int bytesRead = -1;

            using (var conn = new SqlConnection(connectionString))
            {
                var command = conn.CreateCommand();
                command.CommandText = procedureName;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Clear();

                foreach (SqlParameter parameter in parameters)
                {
                    command.Parameters.Add(parameter);
                }
                
                command.Parameters.Add(new SqlParameter("@Result", SqlDbType.Int) { Direction = ParameterDirection.Output, Value = bytesRead });

                using (command)
                {
                    conn.Open();
                    command.ExecuteNonQuery();

                    bytesRead = Convert.ToInt32(command.Parameters["@Result"].Value);
                    conn.Close();
                }
            }
            return bytesRead;
        }

        public static int StoredProcedure(string procedureName, string parameters)
        {
            int bytesRead = -1;

            using (var conn = new SqlConnection(connectionString))
            {
                var command = conn.CreateCommand();
                command.CommandText = procedureName;
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Clear();
                command.Parameters.AddWithValue("@Csv", parameters);
                command.Parameters.Add(new SqlParameter("@Result", SqlDbType.Int) { Direction = ParameterDirection.Output, Value = bytesRead });

                using (command)
                {
                    conn.Open();
                    command.ExecuteNonQuery();

                    bytesRead = Convert.ToInt32(command.Parameters["@Result"].Value);
                    conn.Close();
                }
            }
            return bytesRead;
        }
    }
}