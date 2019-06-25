using System;using DCCMSNameSpace;
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

public partial class AdminSitesUsers_Create : AdminMasterPage
{

    #region ---------------Page_Load---------------
	//-----------------------------------------------
	//Page_Load
	//-----------------------------------------------
	private void Page_Load(object sender, System.EventArgs e)
	{
        rfvNewRoleRequired.Text = "";
        lblResult.Text="";
        if (!IsPostBack)
        {
            LoadData();
        }
        
	}
	//-----------------------------------------------
	#endregion
    #region --------------LoadData--------------
    //---------------------------------------------------------
    //LoadData
    //---------------------------------------------------------
    private void LoadData()
    {
        string[] roles = Roles.GetAllRoles();
        List<RoleInfo> roleslist = new List<RoleInfo>();
        //Membership.ApplicationName
        foreach (string role in roles)
        {
            roleslist.Add(new RoleInfo(role) );
        }
        if (roleslist.Count > 0)
        {
            dgRoles.DataSource = roleslist;
            dgRoles.DataKeyField = "RoleName";
            dgRoles.AllowPaging = false;
            dgRoles.DataBind();
            dgRoles.Visible = true;
        }
        else
        {
            dgRoles.Visible = false;
            
        }

    }
    //--------------------------------------------------------
    #endregion


    protected void btnCreate_Click(object sender, EventArgs e)
    {
        try
        {
            Roles.CreateRole(txtNewRole.Text);
            LoadData();
            
            General.MakeAlertSucess(lblResult, Resources.AdminText.AddingOperationDone);
            txtNewRole.Text = "";

        }
        catch (Exception ex)
        {
            
            General.MakeAlertError(lblResult, ex.Message);
           
        }
    }
}


