﻿using MSDeveloper.Services;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace MSDeveloper.Models
{
    public struct WebSettings
    {
        /// <summary>
        /// Template of the loaded view
        /// </summary>
        public string Template { get; set; }
        /// <summary>
        /// Class Useful
        /// </summary>
        private MSUtils mSUtil;
        /// <summary>
        /// load the structure of the page configuration
        /// </summary>
        /// <param name="configuration">structure of the page configuration</param>
        public WebSettings(DataTable configuration)
        {
            mSUtil = new MSUtils();
            try
            {                        
            string connStr = "server=localhost;user=root;database=ms;port=3306;password=";
            List<MSParameters> parametros = new List<MSParameters>();
            MSParameters MSParameter = new MSParameters("@tipoCliente",1);
            parametros.Add(MSParameter);
            DataTable dt = mSUtil.ExecuteStopProcedureSelect(connStr, "test3", parametros, configuration);
            DataRow row = dt.Rows[0];
            Template = row["Template"].ToString();
            }
            catch (Exception ex)
            {
                Template = "Vitality";
                mSUtil.ConsoleLogError("WebSettings.cs;WebSettings", ex);
            }
        }
    }
}
