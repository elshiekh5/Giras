using DCCMSNameSpace;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test : System.Web.UI.Page
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

        }
    }
    //--------------------------------------------------
}