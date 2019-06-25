using AppService;
using DCCMSNameSpace;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class StaticContentsController : Controller
    {
         const int CacheDuration = 0;//int.MaxValue

        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult About()
        {
            this.ViewBag.PageID = 2;
            return View("~/Views/_StaticContents/Index.cshtml");
        }
        public ActionResult GenevaClup()
        {
            this.ViewBag.PageID = 6;
            return View("~/Views/_StaticContents/Index.cshtml");
        }
        public ActionResult TeamWork()
        {
            this.ViewBag.PageID = 7;
            return View("~/Views/_StaticContents/Index.cshtml");
        }
        public ActionResult Trustees()
        {
            this.ViewBag.PageID = 23;
            return View("~/Views/_StaticContents/Index.cshtml");
        }
    }
}