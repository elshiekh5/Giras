using System;using DCCMSNameSpace;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Drawing;
public partial class Admin_Admin_ChangePass : AdminMasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
    {
        MembershipUser user=Membership.GetUser();

        bool result = user.ChangePassword(txtCurrentPassword.Text, txtNewPassword.Text);
        if (result)
        {

            General.MakeAlertSucess(lblResult, Resources.MemberShip.ChangingPasswordDone);
        }
        else
        {
            
            General.MakeAlertError(lblResult, Resources.MemberShip.ChangingPasswordFaild);
        }
    }
}


