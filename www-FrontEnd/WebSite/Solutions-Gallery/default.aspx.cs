﻿using AppService;
using DCCMSNameSpace;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite_Solutions_Gallery_Default : DynamicInnerMasterPage
{
    //=============================================================================== 
    //Server side start 
    //===============================================================================
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            NavigationManager.Instance.BuilDefaultPathesLinks();
        }
    }
    //=============================================================================== 
}