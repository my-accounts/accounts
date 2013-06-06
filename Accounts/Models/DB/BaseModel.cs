using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;

namespace Accounts.Models
{
    public abstract class BaseModel
    {
        public List<SqlParameter> ToSqlParameters()
        {
            return ToSqlParameters(null);
        }
        public List<SqlParameter> ToSqlParameters(string[] parameterNames)
        {
            var list = new List<SqlParameter>();

            Type type = GetType();
            //for each property of object of Item
            foreach (PropertyInfo propInfo in type.GetProperties())
            {

                //for each custom attribute on the property loop
                foreach (FieldAttribute attr in propInfo.GetCustomAttributes(typeof(FieldAttribute), false))
                {
                    if (attr != null)
                    {
                        if (parameterNames == null || parameterNames.Contains(attr.FieldName))
                        {
                            if (propInfo.PropertyType == typeof (DateTime) && ((DateTime) propInfo.GetValue(this, null)) == DateTime.MinValue)
                            {
                                var param = new SqlParameter("@" + attr.FieldName, DBNull.Value);
                                param.DbType = DbType.DateTime;
                                list.Add(param);
                            }
                            else
                            {
                                list.Add(new SqlParameter("@" + attr.FieldName, propInfo.GetValue(this, null)));
                            }
                        }
                    }
                }
            }
            /*
                        return new List<SqlParameter>
                            {
                                new SqlParameter("@FriendlyMessageID", message.FriendlyId),
                                new SqlParameter("@Type", message.Type),
                                new SqlParameter("@Title", message.Title),
                                new SqlParameter("@Tooltip", message.Tooltip),
                                new SqlParameter("@Body", message.Body),
                                new SqlParameter("@Weight", message.Weight),
                                new SqlParameter("@Start", message.Start),
                                new SqlParameter("@End", CommonHelper.DateTimeNull(message.End)),
                                new SqlParameter("@Active", message.Active),
                                new SqlParameter("@Deleted", message.Deleted),
                                new SqlParameter("@UseLocalTime", message.UseLocalTime),
                                new SqlParameter("@Created", message.Created),
                                new SqlParameter("@Activated", message.Activated),
                                new SqlParameter("@LastModified", CommonHelper.DateTimeNull(message.LastModified)),
                                new SqlParameter("@ReadCount", message.ReadCount)
                            };*/
            return list;
        }

        public void FromReader(SqlDataReader reader)
        {
            Type type = GetType();

            foreach (PropertyInfo propInfo in type.GetProperties())
            {
                foreach (FieldAttribute attr in propInfo.GetCustomAttributes(typeof(FieldAttribute), false))
                {
                    if (attr != null)
                    {
                        object obj = null;

                        if (propInfo.PropertyType == typeof(int))
                        {
                            if (reader[attr.FieldName] == DBNull.Value)
                            {
                                obj = -1;
                            }
                            else
                            {
                                obj = Convert.ToInt32(reader[attr.FieldName]);
                            }
                        }
                        else if (propInfo.PropertyType == typeof(long))
                        {
                            obj = Convert.ToInt64(reader[attr.FieldName]);
                        }
                        else if (propInfo.PropertyType == typeof(decimal))
                        {
                            obj = Convert.ToDecimal(reader[attr.FieldName]);
                        }
                        else if (propInfo.PropertyType == typeof(string))
                        {
                            obj = Convert.ToString(reader[attr.FieldName]);
                        }
                        else if (propInfo.PropertyType == typeof(DateTime))
                        {
                            obj = reader[attr.FieldName] == DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(reader[attr.FieldName]);
                        }
                        else if (propInfo.PropertyType == typeof(bool))
                        {
                            obj = Convert.ToBoolean(reader[attr.FieldName]);
                        }

                        // Finally, set the value
                        if (obj != null)
                        {
                            propInfo.SetValue(this, obj, null);
                        }
                    }
                }
            }
            //message.FriendlyId = Convert.ToInt32(reader["FriendlyMessageID"]);
            //message.Type = Convert.ToInt32(reader["Type"]);
            //message.Active = Convert.ToBoolean(reader["Active"]);
            //message.Created = Convert.ToDateTime(reader["Created"]);
            //message.Deleted = Convert.ToBoolean(reader["Deleted"]);
            //message.Activated = Convert.ToDateTime(reader["Activated"]);
            //message.LastModified = Convert.ToDateTime(reader["LastModified"]);
            //message.Start = Convert.ToDateTime(reader["Start"]);
            //message.UseLocalTime = Convert.ToBoolean(reader["LocalTime"]);
            //message.End = reader["End"] == DBNull.Value ? DateTime.MinValue : Convert.ToDateTime(reader["End"]);
            //message.ReadCount = Convert.ToInt32(reader["ReadCount"]);
            //message.Weight = Convert.ToInt32(reader["Weight"]);
            //message.Title = Convert.ToString(reader["Title"]);
            //message.Tooltip = Convert.ToString(reader["Tooltip"]);
            //message.Body = Convert.ToString(reader["Body"]);

            //return this;
        }
    }
}