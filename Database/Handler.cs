using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace Database {
    public class DBConnection {
        public string ConnectionString = "";

        public DBConnection(string connectionString) {
            ConnectionString = connectionString;
        }

        public T ReadSingle<T>(string query, Func<IDataRecord, T> selector, params SqlParameter[] parameters) {
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                using (var cmd = conn.CreateCommand()) {
                    cmd.CommandText = query;
                    cmd.Parameters.AddRange(parameters);
                    cmd.Connection.Open();
                    using (var r = cmd.ExecuteReader()) {
                        return r.Cast<IDataRecord>().Select(selector).FirstOrDefault();
                    }
                }
            }
        }

        public IEnumerable<T> ReadToList<T>(string query, Func<IDataRecord, T> selector, params SqlParameter[] parameters) {
            // Create a connection
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                // Open connection
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn)) {
                    cmd.Parameters.AddRange(parameters);
                    using (SqlDataReader reader = cmd.ExecuteReader()) {
                        // Cast internal type to IDataRecord, and run  the selector to convert to T
                        return reader.Cast<IDataRecord>().Select(selector).ToList();
                    }
                }
            }
        }

        public IEnumerable<T> ReadToListSP<T>(string query, Func<IDataRecord, T> selector, params SqlParameter[] parameters) {
            // Create a connection
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                // Open connection
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn)) {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);
                    using (SqlDataReader reader = cmd.ExecuteReader()) {
                        // Cast internal type to IDataRecord, and run  the selector to convert to T
                        return reader.Cast<IDataRecord>().Select(selector).ToList();
                    }
                }
            }
        }

        public IEnumerable<IDataRecord> ReadToList(string query, params SqlParameter[] parameters) {
            // Create a connection
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                // Open connection
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(query, conn)) {
                    cmd.Parameters.AddRange(parameters);
                    using (SqlDataReader reader = cmd.ExecuteReader()) {
                        return reader.Cast<IDataRecord>().ToList();
                    }
                }
            }
        }


        public void ExecuteCommand(string cmdtext, params SqlParameter[] parameters) {
            // Create a connection
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(cmdtext, conn)) {
                    // Add parameters
                    cmd.Parameters.AddRange(parameters);
                    // Execute command
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void ExecuteStoredProcedure(string proc, params SqlParameter[] parameters) {
            // Create a connection
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand(proc, conn)) {
                    // Set commandtype to stored procedure
                    cmd.CommandType = CommandType.StoredProcedure;
                    // Add parameters
                    cmd.Parameters.AddRange(parameters);
                    // Execute stored procedure
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public IEnumerable<T> ReadLazy<T>(string query, Func<IDataRecord, T> selector) {
            using (SqlConnection conn = new SqlConnection(ConnectionString)) {
                using (var cmd = conn.CreateCommand()) {
                    cmd.CommandText = query;
                    cmd.Connection.Open();
                    using (var r = cmd.ExecuteReader()) {
                        while (r.Read()) {
                            yield return selector(r);
                        }
                    }
                }
            }
        }
    }
}
