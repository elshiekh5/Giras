using DCCMSNameSpace;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class App_AdminMaster : System.Web.UI.MasterPage
{
    public string bodyModuleClass = "";
    //--------------------------------------------------
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (lblTitle != null)
                lblTitle.Text = Page.Title;
            Page.Title = "ادارة الموقع";
            ItemsModulesOptions currentModule = (ItemsModulesOptions)HttpContext.Current.Items["CurrentItemsModule"];
            MessagesModuleOptions CurrentMessagesModule = (MessagesModuleOptions)HttpContext.Current.Items["CurrentMessagesModule"];
            if (currentModule != null)
            {
                bodyModuleClass = currentModule.Identifire;
            }
            else if (CurrentMessagesModule != null)
            {
                bodyModuleClass = CurrentMessagesModule.Identifire;
            }

        }
    }
    //--------------------------------------------------
}
