using AppService;
using DCCMSNameSpace;
using EFDataLayer;
using MVC.ViewModels;
using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using GirasDatalayer;
namespace MVC.Controllers
{
    public class HomeController : Controller
    {
         const int CacheDuration = 0;//int.MaxValue
        GirasDbContext girasContext = new GirasDbContext();
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Index()
        {
            Languages lang = SiteSettings.GetCurrentLanguage();
            HomeViewModel homeModel = new HomeViewModel();
            //LatestVideos
            homeModel.LatestVideos = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Videos)
                .Where(e => e.LangID == (int)lang)
                .Where(e=> string.IsNullOrEmpty(e.YoutubeCode)==false)

                .OrderByDescending(e => e.ItemID)
                .Take(8).ToList();
            //LatestBooks
            homeModel.LatestBooks = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Books)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Where(e=> string.IsNullOrEmpty(e.FileExtension)==false)
                .Take(8).ToList();

            //LatestSoundTracks
            homeModel.LatestSoundTracks = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.SoundTracks)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Where(e=> string.IsNullOrEmpty(e.AudioExtension)==false)
                .Take(8).ToList();
            //LatestKabsolat
            homeModel.LatestKabsolat = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Advices)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Take(10).ToList();
            //LatestArticles
            homeModel.LatestArticles = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Articles)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Take(4).ToList();
            //LatestAlbums
            homeModel.LatestAlbums = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.PhotoGallery)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Where(e=> string.IsNullOrEmpty(e.PhotoExtension)==false)
                .Take(4).ToList();
            var albumsIDs = homeModel.LatestAlbums.Select(e => e.ItemID);
            //LatestAlbumsFiles
            homeModel.LatestAlbumsFiles = girasContext.vw_ItemFiles
                .Where(e => e.ModuleTypeID == (int)GirasModules.PhotoGallery)
                .Where(e =>  albumsIDs.Contains( e.ItemID) )
                .Where(e=> string.IsNullOrEmpty(e.FileExtension)==false)
                .ToList();

            //Occasions
            homeModel.LatestOccasions = girasContext.vw_ItemsBaseData
             .Where(e => e.ModuleTypeID == (int)GirasModules.Occasions)
             .Where(e => e.LangID == (int)lang)
             .OrderByDescending(e => e.ItemID)
             .Where(e => e.ItemDate.HasValue)
             .Take(4).ToList();

            return View(homeModel);
        }

        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View("~/Views/About_Us/index.cshtml");
        }


        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Module(int? id, string module)
        {
            //module
            ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(module);
            if (id.HasValue)
            {

                ViewBag.Message = "Your application description page.";
                FrontItemsModel currentItem = FrontItemsController.GetItemObject(id.Value, SiteSettings.GetCurrentLanguage());
                ViewData["CurrentItem"] = currentItem;
                ViewData["CurrentItemsModule"] = currentModule;
                ViewBag.BodyModuleClass = currentModule.Identifire;

                NavigationManager.Instance.BuilDetailsPathesLinks(currentModule, currentItem);
                return View("~/Views/" + module + "/details.cshtml", currentItem);
            }
            else
            {
                ViewBag.Message = "Your application description page.";
                NavigationManager.Instance.BuilDefaultPathesLinks(currentModule);
                ViewBag.Title = NavigationManager.Instance.PageTitle;
                return View("~/Views/" + module + "/index.cshtml");
            }
        }
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Message(int? id, string module)
        {
            //module
            MessagesModuleOptions currentModule = MessagesModuleOptions.GetType(module);
            if (id.HasValue)
            {
                ViewBag.Message = "Your application description page.";
                FrontItemsModel currentItem = FrontItemsController.GetItemObject(id.Value, SiteSettings.GetCurrentLanguage());
                ViewData["CurrentItem"] = currentItem;
                ViewData["CurrentMessagesModule"] = currentModule;
                ViewBag.BodyModuleClass = currentModule.Identifire;

               // NavigationManager.Instance.BuilDetailsPathesLinks(currentModule, currentItem);
                return View("~/Views/" + module + "/details.cshtml", currentItem);
            }
            else
            {
                ViewBag.Message = "Your application description page.";
                NavigationManager.Instance.BuilDefaultPathesLinks(currentModule);
                ViewBag.Title = NavigationManager.Instance.PageTitle;
                return View("~/Views/" + module + "/index.cshtml");
            }
        }

        public ActionResult Language(string id)
        {
            id = id.ToLower();
            Languages lang = (Languages)SiteSettings.Languages_DefaultLanguageID;
            switch (id)
            {
                case "ar":
                    lang = Languages.Ar;
                    break;
                case "en":
                    lang = Languages.En;
                    break;
                default:
                    break;
            }
            string cookie_name = SiteSettings.Site_CookieName;
            HttpCookie cookie=null;
            if (Request.Cookies[cookie_name] != null)
            {
                cookie = Response.Cookies[cookie_name];
                cookie["lang"] = lang.ToString();
               
            }
            else
            {
                cookie = new HttpCookie(cookie_name);
                cookie["lang"] = lang.ToString();
                cookie.Expires = DateTime.Now.AddYears(1);
                Response.SetCookie(cookie);
            }

            return RedirectToAction("Index");
        }
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Solutions()
        {
            ViewBag.Message = "Your application description page.";

            return View("~/Views/Solutions/index.cshtml");
        }
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Portfolio()
        {
            ViewBag.Message = "Your application description page.";

            return View("~/Views/Portfolio/index.cshtml");
        }
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View("~/Views/Portfolio/index.cshtml");
        }
        [HttpPost]
        public JsonResult ContactUs(ContactUsModel message)
        {
            string resultMessage = null;
            bool SendingResult = MessagesController.ContactUS(message, out resultMessage);
            return Json(new { Message = resultMessage }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult TrainingReginster(TrainingRegModel message)
        {
            if (message != null &&
                !string.IsNullOrEmpty(message.FirstName) &&
                !string.IsNullOrEmpty(message.LastName) &&
                !string.IsNullOrEmpty(message.Mobile) &&
                !string.IsNullOrEmpty(message.Email) &&
                message.RelatedItemID > 0 &&
                message.ModuleTypeID > 0
                )
            {
                if (string.IsNullOrEmpty(message.Tel))
                {
                    message.Tel = "";
                }
                string resultMessage = null;
                bool SendingResult = MessagesController.TrainingReginster(message, out resultMessage);
                return Json(new { Message = resultMessage }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                throw new Exception();
            }
            
        }
         
    }
}