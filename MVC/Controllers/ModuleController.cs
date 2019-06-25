using AppService;
using DCCMSNameSpace;
using EFDataLayer;
using MVC.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class ModuleController : Controller
    {
         //[OutputCache(Duration = int.MaxValue, VaryByParam = "*")]
        public ActionResult Defaule(int? pageId, string module)
        {
            int pageIndex = 1;
            if (pageId.HasValue) pageIndex = pageId.Value;
            ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(module);

            ViewBag.PageIndex = pageIndex;
            ViewBag.CurrentModule = currentModule;
            ViewBag.BodyModuleClass = currentModule.Identifire;

            //pageIndex = (int)ViewData["PageIndex"];
            NavigationManager.Instance.BuilDefaultPathesLinks(currentModule);
            ViewBag.Title = NavigationManager.Instance.PageTitle;
            return View("~/Views/" + module + "/index.cshtml");

        }
         //[OutputCache(Duration = int.MaxValue, VaryByParam = "*")]
        public ActionResult Category(int? categoryId, int? pageId, string module)
         {
             int categoryID = 0;
             int pageIndex = 1;

             if (pageId.HasValue) pageIndex = pageId.Value;
             if (categoryId.HasValue) categoryID = categoryId.Value;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(module);

             ViewBag.PageIndex = pageIndex;
             ViewBag.CategoryID = categoryID;
             ViewBag.CurrentModule = currentModule;
             ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.BodyModuleClass = currentModule.Identifire;
             //pageIndex = (int)ViewData["PageIndex"];
             NavigationManager.Instance.BuilDefaultPathesLinks(currentModule);
             ViewBag.Title = NavigationManager.Instance.PageTitle;
             return View("~/Views/" + module + "/Items.cshtml");

         }
        
        
         //[OutputCache(Duration = int.MaxValue, VaryByParam = "*")]
         public ActionResult Details(int? id, string module)
        {
            //module
            ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(module);
            if (id.HasValue)
            {
                ViewBag.Message = "Your application description page.";
                FrontItemsModel currentItem = FrontItemsController.GetItemObject(id.Value, SiteSettings.GetCurrentLanguage());
                ViewData["CurrentItem"] = currentItem;
                ViewData["CurrentItemsModule"] = currentModule;
                ViewBag.CurrentModule = currentModule;
                ViewBag.PageTitle = currentModule.GetModuleTitle();
                ViewBag.BodyModuleClass = currentModule.Identifire;

                NavigationManager.Instance.BuilDetailsPathesLinks(currentModule, currentItem);
                ViewBag.Title = NavigationManager.Instance.PageTitle;
                if (id.HasValue)
                {
                    ViewBag.ActiveID = id.Value;
                }
                switch (currentModule.ModuleTypeID)
                {
                    case 31://Branches
                        return View("~/Views/_ModuleDetails/Branche.cshtml", currentItem);
                    case 101://gallery
                        return View("~/Views/_ModuleDetails/Album.cshtml", currentItem);
                    default:
                        return View("~/Views/_ModuleDetails/Article.cshtml", currentItem); 
                        
                        //return View("~/Views/" + module + "/details.cshtml", currentItem);
                }
            }
            else
            {
                return HttpNotFound();
            }
        }

         public ActionResult DownloadAttachedFile(int? id)
         {
             //module
             //ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(module);
             if (id.HasValue)
             {
                 ViewBag.Message = "Your application description page.";
                 FrontItemsModel currentItem = FrontItemsController.GetItemObject(id.Value, SiteSettings.GetCurrentLanguage());
                 if (currentItem != null)
                 {
                     string fileaPath = currentItem.FilePath;
                     string physicalPath = Server.MapPath(fileaPath);
                     return File(physicalPath, "application/octet-stream", currentItem.File);
                  
                 }

                 return HttpNotFound();
             }
             else
             {
                 return HttpNotFound();
             }
         }
        /*
         public ActionResult Services()
         {
             this.ViewBag.ModuleTypeID = 21;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(21);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuServices;

             return View("~/Views/_ModuleLists/Services.cshtml");
         }
         public ActionResult Branches()
         {
             this.ViewBag.ModuleTypeID = 31;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(31);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuBraches;

             return View("~/Views/_ModuleLists/CustomList2.cshtml");
         }
         public ActionResult Training()
         {
             this.ViewBag.ModuleTypeID = 33;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(33);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuTraining;

             return View("~/Views/_ModuleLists/CustomList2.cshtml");
         }
         public ActionResult Studies()
         {
             this.ViewBag.ModuleTypeID = 35;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(35);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuStudies;

             return View("~/Views/_ModuleLists/CustomList2.cshtml");
         }
         public ActionResult NewsAndConferances()
         {
             this.ViewBag.ModuleTypeID = 12;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(12);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuConferences;

             return View("~/Views/_ModuleLists/CustomList2.cshtml");
         }
         public ActionResult Video()
         {
             this.ViewBag.ModuleTypeID = 53;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(53);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuVideos;

             return View("~/Views/_ModuleLists/Youtube.cshtml");
         }
         public ActionResult Books()
         {
             this.ViewBag.ModuleTypeID = 34;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(34);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;

             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuBooks;

             return View("~/Views/_ModuleLists/Files.cshtml");
         }
         public ActionResult Gallery()
         {
             this.ViewBag.ModuleTypeID = 101;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(101);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;
             
             //ViewBag.PageTitle = currentModule.GetModuleTitle();
             ViewBag.PageTitle = Resources.SiteText.MenuGallery;

             return View("~/Views/_ModuleLists/GalleryList.cshtml");
         }
         public ActionResult GalleryDetails()
         {
             this.ViewBag.ModuleTypeID = 101;
             ItemsModulesOptions currentModule = ItemsModulesOptions.GetType(101);
             ViewBag.CurrentModule = currentModule;
             ViewBag.BodyModuleClass = currentModule.Identifire;


             return View("~/Views/_ModuleLists/CustomList2.cshtml");
         }
        */
         

         public ActionResult ContactUs()
         {
             //module
             MessagesModuleOptions currentModule = MessagesModuleOptions.GetType(501);
                 ViewBag.Message = "Your application description page.";
                 FrontItemsModel currentItem = FrontItemsController.GetItemObject(501, SiteSettings.GetCurrentLanguage());
                 ViewData["CurrentItem"] = currentItem;
                 ViewData["CurrentMessagesModule"] = currentModule;
                 ViewBag.BodyModuleClass = currentModule.Identifire;

                 //ViewBag.PageTitle = currentModule.GetModuleTitle();
                 ViewBag.PageTitle = Resources.SiteText.MenuContactUs;

                 // NavigationManager.Instance.BuilDetailsPathesLinks(currentModule, currentItem);
                 return View("~/Views/_ModulePages/ContactUs.cshtml", currentItem);
         }
        //public FileResult DownloadFile(int fileID)
        //{
        //    string virtualFilePath = string.Format("{0}{1}", SiteCode.URLs.TimeTable_VirtualPath, fileName);
        //    return File(Server.MapPath(virtualFilePath), "application/xml", "timetable.xml");
        //}
        const int CacheDuration = 0;//int.MaxValue
        GirasDbContext girasContext = new GirasDbContext();
        //[OutputCache(Duration = CacheDuration, VaryByParam = "*")]
        public ActionResult PhotoGallery()
        {
            Languages lang = SiteSettings.GetCurrentLanguage();
            HomeViewModel homeModel = new HomeViewModel();

            homeModel.LatestAlbums = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.PhotoGallery)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Where(e=> string.IsNullOrEmpty(e.PhotoExtension)==false)
                .ToList();
            var albumsIDs = homeModel.LatestAlbums.Select(e => e.ItemID);

            homeModel.LatestAlbumsFiles = girasContext.vw_ItemFiles
                .Where(e => e.ModuleTypeID == (int)GirasModules.PhotoGallery)
                .ToList();


            return View("~/Views/PhotoGallery/index.cshtml", homeModel);
        }

        public ActionResult Library()
        {
            Languages lang = SiteSettings.GetCurrentLanguage();
            HomeViewModel homeModel = new HomeViewModel();
            homeModel.LatestVideos = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Videos)
                .Where(e => e.LangID == (int)lang)
                .Where(e=> string.IsNullOrEmpty(e.YoutubeCode)==false)
                .OrderByDescending(e => e.ItemID)
                .ToList();

            homeModel.LatestBooks = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Books)
                .Where(e => e.LangID == (int)lang)
                .OrderByDescending(e => e.ItemID)
                .Where(e=> string.IsNullOrEmpty(e.FileExtension)==false)
                .ToList();
            homeModel.LatestSoundTracks = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.SoundTracks)
                .Where(e => e.LangID == (int)lang)
                .Where(e=> string.IsNullOrEmpty(e.AudioExtension)==false)
                .OrderByDescending(e => e.ItemID)
                .ToList();

            return View("~/Views/Library/index.cshtml", homeModel);
        }

        public ActionResult Occasions()
        {
            Languages lang = SiteSettings.GetCurrentLanguage();
            HomeViewModel homeModel = new HomeViewModel();
            homeModel.LatestOccasions = girasContext.vw_ItemsBaseData
                .Where(e => e.ModuleTypeID == (int)GirasModules.Occasions)
                .Where(e => e.LangID == (int)lang)
                .Where(e => e.ItemDate.HasValue)
                .OrderByDescending(e => e.ItemID)
                .ToList();

            return View("~/Views/Occasions/index.cshtml", homeModel);
        }

    }
}