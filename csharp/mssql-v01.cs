// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.csharp.mssql.v01 : 1.0.0

// # [ shell ]
// # : Ctrl + '

// # - : dotnet add package System.Data.SqlClient

// # [ csharp ]

// # : - vstudio
using System;
using System.Data.SqlClient;

namespace zrfisaac
{
	internal class Program
	{
		static void Main(string[] args)
		{
			try
			{
				// Define the connection string (update with your credentials)
				string connectionString = "Server=localhost;Database=DEBUG;User Id=debug;Password=ABcd!@34;";

				// Query to select information from INFORMATION_SCHEMA.TABLES
				string query = "SELECT TABLE_NAME, TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES";

                // Create a connection to the SQL Server database
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open(); // Open the connection

                    // Create a SqlCommand to execute the query
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Execute the command and use a SqlDataReader to read the results
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            // Read the data
                            while (reader.Read())
                            {
                                // Access data by column name or index
                                string tableName = reader["TABLE_NAME"].ToString();
                                string tableType = reader["TABLE_TYPE"].ToString();
                                Console.WriteLine($"Table Name: {tableName}, Table Type: {tableType}");
                            }
                        }
                    }
                }
			} catch (Exception e)
			{
				Console.WriteLine(e.Message);	
				throw;
			}
			Console.ReadKey();
		}
	}
}
