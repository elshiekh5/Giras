using System;using DCCMSNameSpace;using DCCMSNameSpace.Zecurity;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class App_Design_masters_AdminMenu : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public string BuildDynamicModulesLinks()
    {
        string links = "";
        links += BuildStaticPagesLinks();
        links += BuildStaticPageWithCommentsLinks();
        //------------------------------------------------------------------
        SiteModulesManager siteModules = SiteModulesManager.Instance;
        foreach (ItemsModulesOptions module in siteModules.SiteItemsModulesList)
        {
            if (module.IsAvailabe && module.AddInAdminMenuAutmaticly && module.ModuleType != ModuleTypes.Categories_Only && !module.HasOwnerID)
            {
                links += BuildItemsModuleLinks(module.ModuleTypeID);
            }
        }
        //------------------------------------------------------------------
        //------------------------------------------------------------------
        foreach (MessagesModuleOptions module in siteModules.SiteMessagesModulesList)
        {
            if (module.IsAvailabe && module.AddInAdminMenuAutmaticly && !module.HasOwnerID && module.ToItemModuleType <= 0)
            {
                links += BuildMessagesModuleLinks(module.ModuleTypeID);
            }
        }
        //------------------------------------------------------------------
        //------------------------------------------------------------------
        foreach (UsersDataGlobalOptions module in siteModules.SiteUsersDataModulesList)
        {
            if (module.IsAvailabe && module.AddInAdminMenuAutmaticly && !module.HasOwnerID)
            {
                links += BuildUserRegistrationsLinks(module.ModuleTypeID);
            }
        }
        //------------------------------------------------------------------
        //MailList
        if (SiteSettings.MailList_HasMaillist)
            links+=BuildEmailListLinks();
        //-------------------------------------------
        //Sms
        if (SiteSettings.Sms_HasSms)
            links += BuildSmsLinks();
        //-------------------------------------------
        //Advertisments
        if (SiteSettings.SpecialModules_AdvertismentsEnabled)
            links += BuildAdvertismentsLinks();
        //-------------------------------------------
        //Vote
        if (SiteSettings.Vote_Enabled)
            links += BuildVoteLinks();
        //-------------------------------------------
        //Citis
        if (SiteSettings.SpecialModules_CitisEnabled)
            links += BuildCitiesLinks();
        //-------------------------------------------
        //ShareLinks
        if (SiteSettings.SpecialModules_ShareLinksEnabled)
            links += BuildShareLinks();
        //-------------------------------------------
        //Admin Mails
        if (SiteSettings.Admininstration_HasAdminEmail)
            links += AdmininstrationMailsLinks();
        //-------------------------------------------
        
        //Security
        if (SiteSettings.SpecialModules_SecurityEnabled)
            links += BuildSecurityLinks();
        //-------------------------------------------
        //المستشارين

        links += BuildStudentsLinks();
        //-------------------------------------------
        return links;
    }
    //----------------------------------------------------------
    #region ----------------BuildItemsModuleLinks---------------
    //----------------------------------------------------------
    //BuildItemsModuleLinks
    //----------------------------------------------------------
    public string BuildItemsModuleLinks(int moduleType)
    {
        ItemsModulesOptions itemsModule = ItemsModulesOptions.GetType(moduleType);
        string moduleTitleText = itemsModule.GetModuleTitle();
        string categoriesAddText = Resources.Modules.Module_CategoriesAdd;
        string categoriesDefaultText = Resources.Modules.Module_CategoriesDefault;
        string itemsAddText = Resources.Modules.Module_ItemsAdd;
        string itemsDefaultText = Resources.Modules.Module_ItemsDefault;
        string itemsPhotosAddText = Resources.Modules.Module_ItemsPhotosAdd;
        //string Module_NewMessage = DynamicResource.GetText(itemsModule, "Module_NewMessage");
        //string Module_AllMessage = DynamicResource.GetText(itemsModule, "Module_AllMessage");
        string commentsInactiveText = Resources.Modules.Module_CommentsInactive;
        string newMessageText = Resources.Modules.Module_NewMessage;
        string allMessageText = Resources.Modules.Module_AllMessage;
        if (itemsModule.HasSpecialAdminText)
        {
            //moduleTitleText = itemsModule.GetModuleTitle();
            categoriesAddText = DynamicResource.GetText(itemsModule, "Module_CategoriesAdd");
            categoriesDefaultText = DynamicResource.GetText(itemsModule, "Module_CategoriesDefault");
            itemsAddText = DynamicResource.GetText(itemsModule, "Module_ItemsAdd");
            itemsDefaultText = DynamicResource.GetText(itemsModule, "Module_ItemsDefault");
            itemsPhotosAddText = DynamicResource.GetText(itemsModule, "Module_ItemsPhotosAdd");
            commentsInactiveText = DynamicResource.GetText(itemsModule, "Module_CommentsInactive");
            newMessageText = DynamicResource.GetText(itemsModule, "Module_NewMessage");
            allMessageText = DynamicResource.GetText(itemsModule, "Module_AllMessage");
        }
        string links = "";
        string folder = itemsModule.Identifire.ToString();
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Items/" + folder + "/"))
        {

            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Items/" + folder + "/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + itemsModule.GetModuleTitle() + "</span></a>";
            links += "<ul>";
            if (itemsModule.CategoryLevel != 0 && itemsModule.DisplayCategoriesInAdminMenue)
            {
                links += "<li " + AdditionalLinkClassIfActive("/Items/" + folder + "/Cats/Add.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Cats/Add.aspx\">" + categoriesAddText + "</a></li>";
                links += "<li " + AdditionalLinkClassIfActive("/Items/" + folder + "/Cats/default.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Cats/default.aspx\">" + categoriesDefaultText + "</a></li>";
            }

            links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Add.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Add.aspx\">" + itemsAddText + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/default.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/default.aspx\">" + itemsDefaultText + "</a></li>";
            if (itemsModule.HasMultiPhotos)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/AddPhoto.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/AddPhoto.aspx\">" + itemsPhotosAddText + "</a></li>";
            }
            if (itemsModule.MessagesModuleID > 0)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Messages/New.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Messages/New.aspx\">" + newMessageText + "</a></li>";
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Messages/default.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Messages/default.aspx\">" + DynamicResource.GetText(itemsModule, "Module_AllMessage") + "</a></li>";

            }
            if (itemsModule.HasComments)
            {
                int inactiveCommentsCount = ItemsCommentsFactory.GetCount(-1, Languages.Unknowen, itemsModule.ModuleTypeID, true, false, false, SitesHandler.GetOwnerIDAsGuid());
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Comments/InActive.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Comments/InActive.aspx\">" + commentsInactiveText + " -" + inactiveCommentsCount + "</a></li>";
                links += "    ";
            }
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion
    public string AdditionalLinkClassIfActive(string pathToCheck)
    {
        string url = Request.RawUrl;
        url = url.ToLower();
        pathToCheck = pathToCheck.ToLower();
        string dddd = Request.RawUrl;
        if (url.IndexOf(pathToCheck) > -1)
        {
            return "class=\"active\"";
        }
        else
        { return "";}
    }
    //public string AdditionalLinkClassIfActive(string path1ToCheck, string path2ToCheck)
    //{
    //    string url = Request.Url.AbsolutePath;
    //    url = url.ToLower();
    //    path1ToCheck = path1ToCheck.ToLower();
    //    path2ToCheck = path2ToCheck.ToLower();
    //    if (url.IndexOf(path1ToCheck) > -0 && url.IndexOf(path2ToCheck) > -0)
    //    {
    //        return "class=\"active\"";
    //    }
    //    else
    //    { return ""; }
    //}
    #region ----------------BuildStaticPagesLinks---------------
    //----------------------------------------------------------
    //BuildStaticPagesLinks
    //----------------------------------------------------------
    public string BuildStaticPagesLinks()
    {
         
        ItemsModulesOptions SitePagesModule = ItemsModulesOptions.GetType((int)StandardItemsModuleTypes.SitePages);

        string links = "";
        string folder = SitePagesModule.Identifire.ToString();
        if (SitePagesModule.IsAvailabe &&ZecurityManager.CheckFolderPermission("/AdminCP/Items/" + folder + "/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Items/" + folder + "/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.AdminText.StaticContents + "</span></a>";
            links += "<ul>";
            //-------------------------------------------------------------------
            SiteModulesManager siteModules = SiteModulesManager.Instance;
            foreach (SitePageOptions page in siteModules.SitePagesList)
            {
                if (page.IsAvailabe && page.AddInAdminMenuAutmaticly && !page.HasComments)
                {
                    links += "<li " + AdditionalLinkClassIfActive("/Items/" + folder + "/StaticContents.aspx?id=" + page.PageID ) + "><a href=\"/AdminCP/Items/" + folder + "/StaticContents.aspx?id=" + page.PageID + "\">" + page.Title + "</a></li>";
                }
            }
            //-------------------------------------------------------------------
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildStaticPageWithCommentsLinks---------------
    //----------------------------------------------------------
    //BuildStaticPageWithCommentsLinks
    //----------------------------------------------------------
    public string BuildStaticPageWithCommentsLinks()
    {
        string links = "";
        string folder = "SitePages";
        SiteModulesManager sitePages = SiteModulesManager.Instance;
        int inactiveCommentsCount = 0;
        int activeCommentsCount = 0;
        foreach (SitePageOptions page in sitePages.SitePagesList)
        {
            if (page.IsAvailabe && page.AddInAdminMenuAutmaticly && page.HasComments)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + page.Title + "</span></a>";
                links += "<ul>";
                //---------------------------------------------------
                inactiveCommentsCount = ItemsCommentsFactory.GetCount(page.PageID, Languages.Unknowen, page.ModuleTypeID, true, false, false, SitesHandler.GetOwnerIDAsGuid());
                activeCommentsCount = ItemsCommentsFactory.GetCount(page.PageID, Languages.Unknowen, page.ModuleTypeID, true, true, false, SitesHandler.GetOwnerIDAsGuid());
                //---------------------------------------------------
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/StaticContents.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/StaticContents.aspx?id=" + page.PageID + "\">" + page.Title + "</a></li>";
                //---------------------------------------------------
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Comments/ItemInActiveComments.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Comments/ItemInActiveComments.aspx?id=" + page.PageID + "\">" + Resources.Modules.Module_CommentsInactive + " -" + inactiveCommentsCount + "</a></li>";
                links += "<li "+ AdditionalLinkClassIfActive("/Items/" + folder + "/Comments/ItemActiveComments.aspx") + "><a href=\"/AdminCP/Items/" + folder + "/Comments/ItemActiveComments.aspx?id=" + page.PageID + "\">" + Resources.Modules.Module_CommentsActive + " -" + activeCommentsCount + "</a></li>";
                links += "    ";
                //---------------------------------------------------
                links += "</ul>";
            }
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildMessagesModuleLinks---------------
    //----------------------------------------------------------
    //BuildMessagesModuleLinks
    //----------------------------------------------------------
    public string BuildMessagesModuleLinks(int moduleType)
    {
        //------------------------------------------------------------------------------------------------
        MessagesModuleOptions msgsModule = MessagesModuleOptions.GetType(moduleType);
        //------------------------------------------------------------------------------------------------
        string moduleTitleText = msgsModule.GetModuleTitle();
        string categoriesAddText = Resources.Modules.Module_CategoriesAdd;
        string categoriesDefaultText = Resources.Modules.Module_CategoriesDefault;
        string exportData = Resources.Modules.Module_ExportData;
        string newMessageText = Resources.Modules.Module_NewMessage;
        string allMessageText = Resources.Modules.Module_AllMessage;
        //------------------------------------------------------------------------------------------------
        if (msgsModule.HasSpecialAdminText)
        {
            //moduleTitleText = itemsModule.GetModuleTitle();
            categoriesAddText = DynamicResource.GetMessageModuleText(msgsModule, "Module_CategoriesAdd");
            categoriesDefaultText = DynamicResource.GetMessageModuleText(msgsModule, "Module_CategoriesDefault");
            exportData = DynamicResource.GetMessageModuleText(msgsModule, "Module_ExportData");
            newMessageText = DynamicResource.GetMessageModuleText(msgsModule, "Module_NewMessage");
            allMessageText = DynamicResource.GetMessageModuleText(msgsModule, "Module_AllMessage");
        }
        //------------------------------------------------------------------------------------------------
        string links = "";
        string folder = msgsModule.Identifire.ToString();
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Messages/" + folder + "/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Messages/" + folder + "/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + moduleTitleText + "</span></a>";
            links += "<ul>";
            if (msgsModule.CategoryLevel != 0 && msgsModule.DisplayCategoriesInAdminMenue)
            {
                links += "<li " + AdditionalLinkClassIfActive("/Messages/" + folder + "/Cats/Add.aspx") + "><a href=\"/AdminCP/Messages/" + folder + "/Cats/Add.aspx\">" + categoriesAddText + "</a></li>";
                links += "<li " + AdditionalLinkClassIfActive("/Messages/" + folder + "/Cats/default.aspx") + "><a href=\"/AdminCP/Messages/" + folder + "/Cats/default.aspx\">" + categoriesDefaultText + "</a></li>";
            }
            links += "<li "+ AdditionalLinkClassIfActive("Messages/" + folder + "/New.aspx") + "><a href=\"/AdminCP/Messages/" + folder + "/New.aspx\">" + newMessageText + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("Messages/" + folder + "/default.aspx") + "><a href=\"/AdminCP/Messages/" + folder + "/default.aspx\">" + allMessageText + "</a></li>";
            if (msgsModule.HasExportData)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/Messages/" + folder + "/Export.aspx") + "><a href=\"/AdminCP/Messages/" + folder + "/Export.aspx\">" + exportData + "</a></li>";
            }
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildUserRegistrationsLinks---------------
    //----------------------------------------------------------
    //BuildUserRegistrationsLinks
    //----------------------------------------------------------
    public string BuildUserRegistrationsLinks(int moduleType)
    {
        //------------------------------------------------------------------------------------------------
        UsersDataGlobalOptions userdataModule = UsersDataGlobalOptions.GetType(moduleType);
        //------------------------------------------------------------------------------------------------
        string moduleTitleText = userdataModule.GetModuleTitle();
        string categoriesAddText = Resources.Modules.Module_CategoriesAdd;
        string categoriesDefaultText = Resources.Modules.Module_CategoriesDefault;
        string itemsAddText = Resources.Modules.Module_ItemsAdd;
        string itemsDefaultText = Resources.Modules.Module_ItemsDefault;
        //------------------------------------------------------------------------------------------------
        if (userdataModule.HasSpecialAdminText)
        {
            //moduleTitleText = itemsModule.GetModuleTitle();
            categoriesAddText = DynamicResource.GetUsersDataModuleText(userdataModule, "Module_CategoriesAdd");
            categoriesDefaultText = DynamicResource.GetUsersDataModuleText(userdataModule, "Module_CategoriesDefault");
            itemsAddText = DynamicResource.GetUsersDataModuleText(userdataModule, "Module_ItemsAdd");
            itemsDefaultText = DynamicResource.GetUsersDataModuleText(userdataModule, "Module_ItemsDefault");
        }
        //------------------------------------------------------------------------------------------------
        string folder = userdataModule.Identifire.ToString();
        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/UsersData/" + folder + "/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/UsersData/" + folder + "/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + userdataModule.GetModuleTitle() + "</span></a>";
            links += "<ul>";
            if (userdataModule.CategoryLevel != 0 && userdataModule.DisplayCategoriesInAdminMenue)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/UsersData/" + folder + "/Cats/Add.aspx") + "><a href=\"/AdminCP/UsersData/" + folder + "/Cats/Add.aspx\">" + categoriesAddText + "</a></li>";
                links += "<li "+ AdditionalLinkClassIfActive("/UsersData/" + folder + "/Cats/default.aspx") + "><a href=\"/AdminCP/UsersData/" + folder + "/Cats/default.aspx\">" + categoriesDefaultText + "</a></li>";
            }
            if (userdataModule.HasAddUserInAdmin)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/UsersData/" + folder + "/Add.aspx") + "><a href='/AdminCP/UsersData/" + folder + "/Add.aspx'>" + itemsAddText + "</a></li>";
            }
            links += "<li "+ AdditionalLinkClassIfActive("/UsersData/" + folder + "/default.aspx") + "><a href='/AdminCP/UsersData/" + folder + "/default.aspx'>" + itemsDefaultText + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildEmailListLinks---------------
    //----------------------------------------------------------
    //BuildEmailListLinks
    //----------------------------------------------------------
    public string BuildEmailListLinks()
    {

        string links = "";
        if (SiteSettings.MailList_HasMaillist)
        {
            if (ZecurityManager.CheckFolderPermission("/AdminCP/MailList/"))
            {

                links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/MailList/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.MailListAdmin.MailListTitle + "</span></a>";
                links += "<ul>";
                /******************************************************************************/
                if (SiteSettings.MailList_HasGroups)
                {
                    links += "<li "+ AdditionalLinkClassIfActive("/MailList/MailListGroups/Save.aspx") + "><a href='/AdminCP/MailList/MailListGroups/Save.aspx'>" + Resources.MailListAdmin.Page_AddGroup + "</a></li>";
                    links += "<li "+ AdditionalLinkClassIfActive("/MailList/MailListGroups/default.aspx") + "><a href='/AdminCP/MailList/MailListGroups/default.aspx'>" + Resources.MailListAdmin.Page_AllGroups + "</a></li>";
                }
                links += "<li "+ AdditionalLinkClassIfActive("/MailList/MailListUsers/Add.aspx") + "><a href='/AdminCP/MailList/MailListUsers/Add.aspx'>" + Resources.MailListAdmin.Page_AddUser + "</a></li>";
                links += "<li "+ AdditionalLinkClassIfActive("/MailList/MailListUsers/default.aspx") + "><a href='/AdminCP/MailList/MailListUsers/default.aspx'>" + Resources.MailListAdmin.Page_AllUsers + "</a></li>";
                if (SiteSettings.MailList_HasImportFromTxtFile)
                {
                    links += "<li "+ AdditionalLinkClassIfActive("/MailListUsers/Import-Export/ImportFromTextFile.aspx") + "><a href='/AdminCP/MailList/MailListUsers/Import-Export/ImportFromTextFile.aspx'>" + Resources.MailListAdmin.Page_ImportFromTxtFile + "</a></li>";
                }
                if (SiteSettings.MailList_HasImportFromExcellFile)
                {
                    links += "<li "+ AdditionalLinkClassIfActive("/MailListUsers/Import-Export/ImportFromExcelFile.aspx") + "><a href='/AdminCP/MailList/MailListUsers/Import-Export/ImportFromExcelFile.aspx'>" + Resources.MailListAdmin.Page_ImportFromExcellFile + "</a></li>";
                }
                if (SiteSettings.MailList_HasArchive)
                {
                    links += "<li "+ AdditionalLinkClassIfActive("/MailListArchive/default.aspx") + "><a href='/AdminCP/MailList/MailListArchive/default.aspx'>" + Resources.MailListAdmin.Page_Archive + "</a></li>";
                }
                links += "<li "+ AdditionalLinkClassIfActive("/MailList/SendMailToAll.aspx") + "><a href='/AdminCP/MailList/SendMailToAll.aspx'>" + Resources.MailListAdmin.Page_SendToAllMailList + "</a></li>";
                if (SiteSettings.MailList_HasGroups)
                {
                    links += "<li "+ AdditionalLinkClassIfActive("/MailList/SendMailToGroup.aspx") + "><a href='/AdminCP/MailList/SendMailToGroup.aspx'>" + Resources.MailListAdmin.Page_SendToGroup + "</a></li>";
                    links += "<li "+ AdditionalLinkClassIfActive("/MailList/SendMailToGroups.aspx") + "><a href='/AdminCP/MailList/SendMailToGroups.aspx'>" + Resources.MailListAdmin.Page_SendToMultiGroup + "</a></li>";
                    links += "<li "+ AdditionalLinkClassIfActive("/MailList/SendMailToGroupSelected.aspx") + "><a href='/AdminCP/MailList/SendMailToGroupSelected.aspx'>" + Resources.MailListAdmin.Page_SendToMultiUsersInGroup + "</a></li>";
                }
                links += "<li "+ AdditionalLinkClassIfActive("/MailList/SendMailToOne.aspx") + "><a href='/AdminCP/MailList/SendMailToOne.aspx'>" + Resources.MailListAdmin.Page_SendToUser + "</a></li>";
                links += "</ul>";
            }

            
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildSmsLinks---------------
    //----------------------------------------------------------
    //BuildSmsLinks
    //----------------------------------------------------------
    public string BuildSmsLinks()
    {
        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/SMS/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/SMS/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.SmsAdmin.SmsModuleTitle + "</span></a>";
            links += "<ul>";
            if (SiteSettings.Sms_HasGroups)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/SMS/Groups/Add.aspx") + "><a href='/AdminCP/SMS/Groups/Add.aspx'>" + Resources.SmsAdmin.Page_AddGroup + "</a></li>";
                links += "<li "+ AdditionalLinkClassIfActive("/SMS/Groups/default.aspx") + "><a href='/AdminCP/SMS/Groups/default.aspx'>" + Resources.SmsAdmin.Page_AllGroups + "</a></li>";
            }
            links += "<li "+ AdditionalLinkClassIfActive("/SMS/Users/add.aspx") + "><a href='/AdminCP/SMS/Users/add.aspx'>" + Resources.SmsAdmin.Page_AddUser + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/SMS/Users/default.aspx") + "><a href='/AdminCP/SMS/Users/default.aspx'>" + Resources.SmsAdmin.Page_AllUsers + "</a></li>";
            if (SiteSettings.Sms_HasImportFromTxtFile)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/SMS/Users/Import-Export/ImportFromTextFile.aspx") + "><a href='/AdminCP/SMS/Users/Import-Export/ImportFromTextFile.aspx'>" + Resources.SmsAdmin.Page_ImportFromTxtFile + "</a></li>";
            }
            if (SiteSettings.Sms_HasImportFromExcellFile)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/SMS/Users/Import-Export/ImportFromExcelFile.aspx") + "><a href='/AdminCP/SMS/Users/Import-Export/ImportFromExcelFile.aspx'>" + Resources.SmsAdmin.Page_ImportFromExcellFile + "</a></li>";
            }
            links += "<li "+ AdditionalLinkClassIfActive("/SMS/Send/ToAll.aspx") + "><a href='/AdminCP/SMS/Send/ToAll.aspx'>" + Resources.SmsAdmin.Page_SendToAllSmsList + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/SMS/Send/ToGroup.aspx") + "><a href='/AdminCP/SMS/Send/ToGroup.aspx'>" + Resources.SmsAdmin.Page_SendToGroup + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/SMS/Send/ToOne.aspx") + "><a href='/AdminCP/SMS/Send/ToOne.aspx'>" + Resources.SmsAdmin.Page_SendToUser + "</a></li>";
            if (SiteSettings.Sms_HasArchive)
            {
                links += "<li "+ AdditionalLinkClassIfActive("/SMS/SMSArchive/") + "><a href='/AdminCP/SMS/SMSArchive/'>" + Resources.SmsAdmin.Page_Archive + "</a></li>";
            }
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildAdvertismentsLinks---------------
    //----------------------------------------------------------
    //BuildAdvertismentsLinks
    //----------------------------------------------------------
    public string BuildAdvertismentsLinks()
    {
        string itemsAddText = Resources.Modules.Module_ItemsAdd;
        string itemsDefaultText = Resources.Modules.Module_ItemsDefault;
        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Adv/Advertisments/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Adv/Advertisments/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.AdminText.ModuleAdmin_AdvModules + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/Adv/Advertisments/Save.aspx") + "><a href='/AdminCP/Adv/Advertisments/Save.aspx'>" + itemsAddText + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Adv/Advertisments/default.aspx'") + "><a href='/AdminCP/Adv/Advertisments/default.aspx'>" + itemsDefaultText + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildVoteLinks---------------
    //----------------------------------------------------------
    //BuildVoteLinks
    //----------------------------------------------------------
    public string BuildVoteLinks()
    {

        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Voting/VoteQuestions/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Voting/VoteQuestions/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.Vote.VoteModuleTitle + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/Voting/VoteQuestions/add.aspx") + "><a href='/AdminCP/Voting/VoteQuestions/add.aspx'>" + Resources.Vote.AdminPageAdd + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Voting/VoteQuestions/default.aspx") + "><a href='/AdminCP/Voting/VoteQuestions/default.aspx'>" + Resources.Vote.AdminPageDefault + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildCitiesLinks---------------
    //----------------------------------------------------------
    //BuildCitiesLinks
    //----------------------------------------------------------
    public string BuildCitiesLinks()
    {

        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Cities/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Cities/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.Cities.CitiesModuleTitle + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/Cities/Add.aspx") + "><a href='/AdminCP/Cities/Add.aspx'>" + Resources.Cities.AdminPage_AddCity + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Cities/default.aspx") + "><a href='/AdminCP/Cities/default.aspx'>" + Resources.Cities.AdminPage_AllCities + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------AdmininstrationMailsLinks---------------
    //----------------------------------------------------------
    //AdmininstrationMailsLinks
    //----------------------------------------------------------
    public string AdmininstrationMailsLinks()
    {

        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/AdminData/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/AdminData/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.AdmininstrationData.Page_AdminEmails + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/AdminData/AdminEmail.aspx") + "><a href='/AdminCP/AdminData/AdminEmail.aspx'>" + Resources.AdmininstrationData.Page_AdminEmails + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildSecurityLinks---------------
    //----------------------------------------------------------
    //BuildSecurityLinks
    //----------------------------------------------------------
    public string BuildSecurityLinks()
    {
        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/Zecurity/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/Zecurity/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.AdminText.ModuleAdmin_SecurityModule + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/Zecurity/Groups/Add.aspx") + "><a href=\"/AdminCP/Zecurity/Groups/Add.aspx\">" + Resources.AdminText.ModuleAdmin_SecurityAddGroup + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Groups/Default.aspx") + "><a href=\"/AdminCP/Zecurity/Groups/Default.aspx\">" + Resources.AdminText.ModuleAdmin_SecurityAllGroups + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Zecurity/Users/Add.aspx") + "><a href=\"/AdminCP/Zecurity/Users/Add.aspx\">" + Resources.AdminText.ModuleAdmin_SecurityAddUser + "</a></li>";
            links += "<li "+ AdditionalLinkClassIfActive("/Zecurity/Users/Default.aspx") + "><a href=\"/AdminCP/Zecurity/Users/Default.aspx\">" + Resources.AdminText.ModuleAdmin_SecurityAllUsers + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildShareLinks---------------
    //----------------------------------------------------------
    //BuildShareLinks
    //----------------------------------------------------------
    public string BuildShareLinks()
    {

        string links = "";
        if (ZecurityManager.CheckFolderPermission("/AdminCP/ShareLinks/"))
        {
            links += "<li "+ AdditionalLinkClassIfActive("/AdminCP/ShareLinks/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>" + Resources.SocialLinks.SocialLinksModuleTitle + "</span></a>";
            links += "<ul>";
            links += "<li "+ AdditionalLinkClassIfActive("/ShareLinks/default.aspx") + "><a href='/AdminCP/ShareLinks/default.aspx'>" + Resources.SocialLinks.AdminPage_Default + "</a></li>";
            links += "</ul>";
        }
        return links;
    }
    //----------------------------------------------------------
    #endregion

    #region ----------------BuildStudentsLinks()---------------
    //----------------------------------------------------------
    //BuildStudentsLinks()
    //----------------------------------------------------------
    public string BuildStudentsLinks()
    {

        string links = "";

        links += "<li " + AdditionalLinkClassIfActive("/AdminCP/Students/") + "><a href=\"#\"><i class=\"icon-stack2\"></i><span>المستشارين</span></a>";
            links += "<ul>";
            links += "<li " + AdditionalLinkClassIfActive("/AdminCP/Students/Upload.aspx") + "><a href='/AdminCP/Students/Upload.aspx'>رفع ملف</a></li>";
            links += "<li " + AdditionalLinkClassIfActive("/AdminCP/Students/ViewData.aspx") + "><a href='/AdminCP/Students/ViewData.aspx'>بيانات الطلاب</a></li>";
            links += "</ul>";
        
        return links;
    }
    //----------------------------------------------------------
    #endregion

}
