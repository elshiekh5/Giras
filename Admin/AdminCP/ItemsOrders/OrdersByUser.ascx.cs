using System;using DCCMSNameSpace;using DCCMSNameSpace.Zecurity;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.IO;


public partial class Items_GetAll : System.Web.UI.UserControl
{

	#region ---------------Page_Load---------------
	//-----------------------------------------------
	//Page_Load
	//-----------------------------------------------
	private void Page_Load(object sender, System.EventArgs e)
    {

        lblResult.Text = "";
		if(!IsPostBack)
		{
			PagerManager.PrepareAdminPager(pager);
			pager.Visible = false;
            SetTexts();
            Load_ddlUsers();
        }
	}
	//-----------------------------------------------
	#endregion

    #region --------------OwnerID--------------
    private Guid _OwnerID = SitesHandler.GetOwnerIDAsGuid();
    public Guid OwnerID
    {
        get { return _OwnerID; }
        set { _OwnerID = value; }
    }
    //------------------------------------------
    #endregion
    
    

    #region ---------------SetTexts---------------
    //-----------------------------------------------
    //SetTexts
    //-----------------------------------------------
    private void SetTexts()
    {
        lblUser.Text = Resources.UsersData.Name;
        dgItems.Columns[1].HeaderText = Resources.ItemsOrders.CustomerName;
        dgItems.Columns[2].HeaderText = Resources.ItemsOrders.Status;
       
    }
    //-----------------------------------------------
    #endregion

    #region ---------------Load_ddlUsers---------------
    //-----------------------------------------------
    //Load_ddlUsers
    //-----------------------------------------------
    private void Load_ddlUsers()
    {
        List<UsersDataEntity> usersDataList;
        usersDataList = UsersDataFactory.GetAll(601, -1,Languages.Unknowen, OwnerID, false);
        if (usersDataList.Count > 0)
        {
            ddlUsers.DataTextField = "Name";
            ddlUsers.DataValueField = "UserID";
            ddlUsers.DataSource = usersDataList;
            ddlUsers.DataBind();
            ddlUsers.Items.Insert(0, new ListItem(Resources.AdminText.Choose, ""));
        }
        else {
            ddlUsers.Items.Insert(0, new ListItem(Resources.AdminText.ThereIsNoData, ""));
        
        }
    }
    //-----------------------------------------------
    #endregion

    //--------------------------------------------------------------------------
    protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGrid();
    }
    //--------------------------------------------------------------------------

    #region --------------LoadGrid--------------
    //---------------------------------------------------------
    //LoadGrid
	//---------------------------------------------------------
    private void LoadGrid()
    {
           string selectedValue = ddlUsers.SelectedValue;
           if (!string.IsNullOrEmpty(selectedValue))
           {
               Guid userId = new Guid(ddlUsers.SelectedValue);

               pager.PageSize = 25;
               int totalRecords = 0;
               //--------------------------------------------------------------------
               //Languages langID = Languages.Unknowen;
               //if (SiteSettings.Languages_HasMultiLanguages)
               //    langID = (Languages)Convert.ToInt32(ddlLanguages.SelectedValue);
               //--------------------------------------------------------------------
               List<ItemsOrdersModel> itemsList;
               itemsList = ItemsOrdersFactor.GetPageByPageForUser(userId, pager.CurrentPage, pager.PageSize, out totalRecords);
               if (itemsList != null && itemsList.Count > 0)
               {
                   dgItems.DataSource = itemsList;
                   dgItems.DataKeyField = "OrderID";
                   dgItems.AllowPaging = false;
                   pager.Visible = true;
                   pager.TotalRecords = totalRecords;
                   dgItems.DataBind();
                   dgItems.Visible = true;
                   //-------------------------------------------------------------------------------
                   //Security Premession
                   //--------------------------
                   ZecurityManager.HideGridColumn(dgItems, CommandName.Delete, dgItems.Columns.Count - 1);

                   ZecurityManager.HideGridColumn(dgItems, CommandName.Edit, dgItems.Columns.Count - 2);

                   /*if (currentModule.ModuleTypeID == 13)
                       dgItems.Columns[dgItems.Columns.Count - 1].Visible = false;*/
                   /*End Secu*/
                   //-------------------------------------------------------------------------------

               }
               else
               {
                   dgItems.Visible = false;
                   pager.Visible = false;
                   
                   General.MakeAlertError(lblResult, Resources.AdminText.ThereIsNoData);
               }
           }
           else
           {
               dgItems.Visible = false;
               pager.Visible = false;
               //
               //General.MakeAlertError(lblResult, Resources.AdminText.ThereIsNoData);
           }
    }
	//--------------------------------------------------------
	#endregion

    

    #region --------------dgItems_ItemDataBound--------------
	//---------------------------------------------------------
	//dgItems_ItemDataBound
	//---------------------------------------------------------
	protected void dgItems_ItemDataBound(object source, DataGridItemEventArgs e)
	{
		if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
		{
			ImageButton lbtnDelete = (ImageButton)e.Item.FindControl("lbtnDelete");
			lbtnDelete.Attributes.Add("onclick", "return confirm('"+Resources.AdminText.DeleteActivation+"')");
			lbtnDelete.AlternateText = Resources.AdminText.Delete;
            #region ---------Index-------
            //Set Index
            int previousRowsCount = (pager.CurrentPage - 1) * pager.PageSize;
            int currentRow = e.Item.ItemIndex + 1;
            e.Item.Cells[0].Text = (previousRowsCount + currentRow).ToString();
            #endregion
		}
	}
	//--------------------------------------------------------
	#endregion

    #region --------------Pager_PageIndexChang--------------
	//---------------------------------------------------------
	//Pager_PageIndexChang
	//---------------------------------------------------------
	protected void Pager_PageIndexChang()
	{
            LoadGrid();
        
	}
	//--------------------------------------------------------
	#endregion

    #region --------------dgItems_DeleteCommand--------------
	//---------------------------------------------------------
	//dgItems_DeleteCommand
	//---------------------------------------------------------
	protected void dgItems_DeleteCommand(object source, DataGridCommandEventArgs e)
	{
        int OrderID = Convert.ToInt32(dgItems.DataKeys[e.Item.ItemIndex]);
        if (ItemsOrdersFactor.Delete(OrderID))
        {

          
            General.MakeAlertSucess(lblResult, Resources.AdminText.DeletingOprationDone);
            //if one item in datagrid
            if (dgItems.Items.Count == 1)
            {
                --pager.CurrentPage;
            }
            LoadGrid();
        }
        else
        {
            
            General.MakeAlertError(lblResult, Resources.AdminText.DeletingOprationFaild);
        }
	}
	//--------------------------------------------------------
	#endregion

    //--------------------------------------------------------------------------
    //protected void ddlLanguages_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    LoadData();
    //}
    //--------------------------------------------------------------------------
    public string GetStatusText(object status)
    {
        int statusInt = Convert.ToInt32(status);
        switch (statusInt)
        {
            case 0 :
                return Resources.ItemsOrders.Status_0;
            case 1:
                return Resources.ItemsOrders.Status_1;
            case 2:
                return Resources.ItemsOrders.Status_2;
            case 3:
                return Resources.ItemsOrders.Status_3;
            default:
                return "";
        }   
    }
}

