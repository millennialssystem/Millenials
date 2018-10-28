using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using millennialssystem.Models;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;

namespace millennialssystem.Controllers
{
    public class HomeController : Controller
    {
        public bool probarConexion()
        {
            
            //SqlConnection con;
            String servidor = "127.0.0.1";
            String puerto = "3306";
            String usuario = "usuario";
            String password = "root@localhost";
            String database = "base_datos";

            //Cadena de conexion
            //Session.cadenaConexion = String.Format("server={0};port={1};user id={2}; password={3}; database={4}", servidor, puerto, usuario, password, database);
            try
            {
                string connStr = "server=localhost;user=root;database=ms;port=3306;password=";
                MySqlConnection conn = new MySqlConnection(connStr);
                conn.Open();//se abre la conexion
            }
            catch (Exception)
            {

                    
            }
            return true ;

            //SqlConnection conexion = new SqlConnection("server="+ servidor+" ; database=base1 ; integrated security = true");
            //conexion.Open();           
            //conexion.Close();
        }
        [HttpGet]
        public ActionResult Index()
        {

            ViewBag.conecta = probarConexion();

            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";

            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
