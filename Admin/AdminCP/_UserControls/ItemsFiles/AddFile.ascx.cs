using System;using DCCMSNameSpace;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Drawing;
using DCCMSNameSpace.Zecurity;


public partial class UserControls_Items_AddFile : System.Web.UI.UserControl
{
    public ItemFileTypes FileType
    {
        get
        {
            if (ViewState["FileType"] != null)
                return (ItemFileTypes)ViewState["FileType"];
            else
                return ItemFileTypes.Video;
        }
        set { ViewState["FileType"] = value; }
    }
    #region --------------OwnerID--------------
    private Guid _OwnerID = SitesHandler.GetOwnerIDAsGuid();
    public Guid OwnerID
    {
        get { return _OwnerID; }
        set { _OwnerID = value; }
    }
    //------------------------------------------
    #endregion
    #region ---------------Page_Load---------------
    //-----------------------------------------------
    //Page_Load
    //-----------------------------------------------
    private void Page_Load(object sender, System.EventArgs e)
    {
        lblResult.Text = "";
        if (!IsPostBack)
        {
            #region ---------------lblFileText---------------
            switch (FileType)
            {
                case ItemFileTypes.Photo:
                    lblFileText.Text = Resources.ItemsFiles.ItemFileType_Photo;
                    break;
                case ItemFileTypes.File:
                    lblFileText.Text = Resources.ItemsFiles.ItemFileType_File;
                    break;
                case ItemFileTypes.Audio:
                    lblFileText.Text = Resources.ItemsFiles.ItemFileType_Audio;
                    break;
                case ItemFileTypes.Video:
                    lblFileText.Text = Resources.ItemsFiles.ItemFileType_Video;
                    break;
                default:
                    lblFileText.Text = Resources.ItemsFiles.ItemFileType_File;
                    break;
            }
            //----------------------------------------
            #endregion

            LoadData();
        }
    }
    //-----------------------------------------------
    #endregion
    #region ---------------LoadData---------------
    //-----------------------------------------------
    //LoadData
    //-----------------------------------------------
    protected void LoadData()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {

            int itemID = Convert.ToInt32(Request.QueryString["ID"]);
            ItemsEntity item = ItemsFactory.GetObject(itemID, Languages.Unknowen, UsersTypes.Admin, OwnerID);
            lblItemTitle.Text = item.Title;
            LoadList();
        }
    }
    #endregion
    #region ---------------btnSave_Click---------------
    //-----------------------------------------------
    //btnSave_Click
    //-----------------------------------------------
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            if (!Page.IsValid)
            {
                return;
            }
            int itemID = Convert.ToInt32(Request.QueryString["ID"]);
            ItemsEntity item = ItemsFactory.GetObject(itemID, Languages.Unknowen, UsersTypes.Admin, OwnerID);
            ItemsFilesEntity ItemsFiles = new ItemsFilesEntity();
            ItemsFiles.ItemID = itemID;
            //-------------
            ItemsFiles.FileExtension = Path.GetExtension(fuPhoto.FileName);
            //-----------------------------------------------------------------
            ItemsFiles.FileType = FileType;
            //-----------------------------------------------------------------
            ItemsFiles.CategoryID = item.CategoryID;
            ItemsFiles.ModuleTypeID = item.ModuleTypeID;
            ItemsFiles.OwnerName = item.OwnerName;
            ItemsFiles.OwnerID = OwnerID;
            //-----------------------------------------------------------------
            bool status = ItemsFilesFactory.Create(ItemsFiles);
            if (status)
            {
                //Photo-----------------------------
                if (fuPhoto.HasFile)
                {
                    string filesPath = DCSiteUrls.GetPath_ItemsFiles(ItemsFiles.OwnerName, ItemsFiles.ModuleTypeID, ItemsFiles.CategoryID, ItemsFiles.ItemID);

                        fuPhoto.SaveAs(DCServer.MapPath(filesPath + ItemsFiles.Photo));
                }
                General.MakeAlertSucess(lblResult, Resources.AdminText.SavingDataSuccessfuly);
                LoadList();
                //ClearControls();
            }
            else
            {
                
                General.MakeAlertError(lblResult, Resources.AdminText.SavingDataFaild);
            }
        }
    }
    //-----------------------------------------------
    #endregion

    

    #region --------------LoadList--------------
    //---------------------------------------------------------
    //LoadList
    //---------------------------------------------------------
    protected void LoadList()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            int itemID = Convert.ToInt32(Request.QueryString["ID"]);

            List<ItemsFilesEntity> photosList = ItemsFilesFactory.GetAll(itemID, FileType);
            if (photosList != null && photosList.Count > 0)
            {
                rPhotos.DataSource = photosList;
                //rPhotos.DataKeyField = "FileID";
                rPhotos.DataBind();
                rPhotos.Visible = true;
            }
            else
            {
                rPhotos.Visible = false;

            }
        }
        else
        {
                Response.Redirect("/Admin/");
        }
    }
    //--------------------------------------------------------
    #endregion
    #region --------------ClearControls()--------------
    //---------------------------------------------------------
    //ClearControls()
    //---------------------------------------------------------
    private void ClearControls()
    {
       
    }
    //--------------------------------------------------------
    #endregion

    protected void ddlItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        int itemID = Convert.ToInt32(ddlItems.SelectedValue);
        LoadList();
    }
    protected void rPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            bool result = ItemsFilesFactory.Delete(id);
            if (result)
            {
                LoadList();
            }
            else
            {
                
                General.MakeAlertError(lblResult, Resources.AdminText.DeletingOprationFaild);
            }
        }
    }
    protected void rPhotos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Button lbtnDelete = (Button)e.Item.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('" + Resources.AdminText.DeleteActivation + "')");
            if (!ZecurityManager.UserCanExecuteCommand(CommandName.Delete))
                lbtnDelete.Visible = false;
        }
    }
}
