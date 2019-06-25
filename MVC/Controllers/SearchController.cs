using AppService;
using DCCMSNameSpace;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class SearchController : Controller
    {
        //[OutputCache(Duration = int.MaxValue, VaryByParam = "*")]
        public ActionResult Index(string s)
        {
            DataTable dt = new DataTable();
            if (!string.IsNullOrEmpty(s))
            {
                string command = string.Format("Select * from [dbo].[StudentsData] Where [No] ='{0}' Order By Name ASC", s);
                using (SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Connectionstring"].ToString()))
                {
                    SqlCommand myCommand = new SqlCommand(command, myConnection);
                    myCommand.CommandType = CommandType.Text;
                    SqlDataAdapter da = new SqlDataAdapter(myCommand);
                    myConnection.Open();
                    da.Fill(dt);
                    myConnection.Close();

                }

            }
            else
            { 
                s = "";
            }
            ViewBag.S = s;
            ViewBag.SearchResult = dt;
            ViewBag.PageTitle = Resources.SiteText.Advisers;
            return View();

        }

    }
}