using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MSDeveloper.Models;
using MSDeveloper.Services;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace MSDeveloper.Controllers
{
    public class HomeController : Controller
    {
        MSUtils mSUtil;
        public IActionResult Index()
        {
            try
            {            
            mSUtil = new MSUtils();            
            var webSetting = new WebSettings(mSUtil.WebSettingConfiguration);
            return View(webSetting);
            }
            catch (Exception ex)
            {               
                mSUtil.ConsoleLogError("HomeController.cs;Index", ex);
                return View();
            }
        }
    
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
