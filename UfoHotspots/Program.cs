using System;
using MySql.Data.MySqlClient;

namespace UfoHotspots
{
    class Program
    {
        static void Main(string[] args)
        {
            
            string cs = @"server=localhost;userid=test;password=test;database=test";

            using var con = new MySqlConnection(cs);
            con.Open();

            string sql = "Select * from UfoData";

            using var cmd = new MySqlCommand(sql, con);

            using MySqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                Console.WriteLine("{0} {1} {2}");
            }
        }
    }
}
