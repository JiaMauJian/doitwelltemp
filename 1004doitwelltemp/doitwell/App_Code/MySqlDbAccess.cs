using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Reflection;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;

/// <summary>
/// MySqlDbAccess 的摘要描述
/// </summary>

public static class MySqlDbAccess
{
    private const IsolationLevel _isolationLevel = IsolationLevel.ReadUncommitted;

    public static string GetConnString()
    {
        return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    }

    public static bool TestConnection(out string exceptionMessage)
    {
        exceptionMessage = string.Empty;
        bool success = false;

        try
        {
            try
            {
                using (var conn = new MySqlConnection(GetConnString()))
                {
                    // just attempt to open the connection to test if a DB is available.
                    conn.Open();
                }
            }
            catch (MySqlException ex)
            {
                exceptionMessage = "Unable to connect to the Database. Exception Message: " + ex.Message + " (" + ex.Number + ")";
                return false;
            }

            // success
            success = true;
        }
        catch (Exception x)
        {
            // unable to connect...
            exceptionMessage = x.Message;
        }

        return success;
    }

    public static DataTable ExcuteQueryData(string sql, bool transaction)
    {
        

        using (MySqlConnection conn = new MySqlConnection(GetConnString()))
        {
            using (MySqlCommand cmd = new MySqlCommand(sql))
            {
                cmd.Connection = conn;

                // see if an existing connection is present
                if (cmd.Connection == null)
                {
                    conn.Open();
                }
                else if (cmd.Connection != null && cmd.Connection.State != ConnectionState.Open)
                {
                    cmd.Connection.Open();
                }

                // create the adapters
                using (DataTable dt = new DataTable())
                {
                    using (MySqlDataAdapter da = new MySqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        da.SelectCommand.Connection = cmd.Connection;

                        // use a transaction
                        if (transaction)
                        {
                            using (MySqlTransaction trans = conn.BeginTransaction(_isolationLevel))
                            {
                                try
                                {
                                    da.SelectCommand.Transaction = trans;
                                    da.Fill(dt);
                                }
                                finally
                                {
                                    trans.Commit();
                                }
                            }
                        }
                        else
                        {
                            // no transaction
                            da.Fill(dt);
                        }

                        // return the dataset
                        return dt;
                    }
                }
            }            
        }
    }

    public static int ExecuteNonQueryInt(string sql, bool transaction)
    {
        using (MySqlConnection conn = new MySqlConnection(GetConnString()))
        {
            using (MySqlCommand cmd = new MySqlCommand(sql))
            {
                cmd.Connection = conn;

                // see if an existing connection is present
                if (cmd.Connection == null)
                {
                    conn.Open();                    
                }
                else if (cmd.Connection != null && cmd.Connection.State != ConnectionState.Open)
                {
                    cmd.Connection.Open();
                }

                if (transaction)
                {
                    // execute using a transaction
                    using (MySqlTransaction trans = conn.BeginTransaction(_isolationLevel))
                    {
                        int result = -1;
                        cmd.Transaction = trans;
                        result = cmd.ExecuteNonQuery();
                        trans.Commit();
                        return result;
                    }
                }
                else
                {
                    // don't use a transaction
                    return cmd.ExecuteNonQuery();
                }
            }
            
        }
    }
}