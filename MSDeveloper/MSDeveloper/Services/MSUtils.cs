using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using MSDeveloper.Models;
using MySql.Data.MySqlClient;

namespace MSDeveloper.Services
{
    public class MSUtils
    {
        /// <summary>
        /// Configuration Site
        /// </summary>
        public DataTable WebSettingConfiguration { get; set; }        
        public MSUtils()
        {
            try
            {            
            string connStr = "server=localhost;user=root;database=ms;port=3306;password=";
            //Beginmomentaneo
            WebSettingConfiguration = new DataTable();
                WebSettingConfiguration.Columns.Add("wse_id");
                WebSettingConfiguration.Columns.Add("wse_name");
                WebSettingConfiguration.Columns.Add("wse_value");
                //Endmomentaneo   
            }
            catch (Exception ex)
            {
                ConsoleLogError("MSUtils.cs;MSUtils", ex);
            }
        }
        /// <summary>
        /// Execute a Stop Procedure and return information
        /// </summary>
        /// <param name="connStr">Conection String</param>
        /// <param name="NameSP">Name Stop Procedure</param>
        /// <param name="parameters">Parameter for Stop Procedure</param>
        /// <param name="dt">DataTable for Template return</param>
        /// <returns></returns>
        public DataTable ExecuteStopProcedureSelect(string connStr, string NameSP,List<MSParameters> parameters, DataTable dt)
        {            
            try
            {
                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();
                string rtn = NameSP;
                MySqlCommand cmd = new MySqlCommand(rtn, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                    parameters.ForEach(item =>
                    {
                        cmd.Parameters.AddWithValue(item.Name, item.Value);
                    });
                MySqlDataReader rdr = cmd.ExecuteReader();
                DataRow row;                
                while (rdr.Read())
                {
                    //Console.WriteLine(rdr[0] + " -- " + rdr[3]);
                    row = dt.NewRow();
                    for (int i = 0; i < rdr.FieldCount; i++)
                    {
                        row[i] = rdr[i];
                    }                    
                    dt.Rows.Add(row);
                }
                rdr.Close();
                conn.Close();
            }
            catch (Exception ex)
            {
                dt = null;
                ConsoleLogError("MSUtils.cs;ExecuteStopProcedureSelect", ex);
            }
            return dt;
        }
        /// <summary>
        /// It allows to locate errors
        /// </summary>
        /// <param name="Metod">Method that causes the exception and its location</param>
        /// <param name="Error">exception generated</param>
        public void ConsoleLogError(string Metod, Exception Error)
        {
            try
            {
                Console.WriteLine(Metod + Error.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
    }
}
