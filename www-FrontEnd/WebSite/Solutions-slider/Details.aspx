﻿<%@ Page Language="C#" Title="" MasterPageFile="~/WebSite/_Masters/ClearMaster.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="WebSite_Solutions_Slider_Details" %>
<%@ Register src="../_SharedControls/Intro.ascx" tagname="Intro" tagprefix="uc3" %>
<%@ Register src="../_SharedControls/Clients.ascx" tagname="Clients" tagprefix="uc5" %>
<%@ Register src="Controls/details.ascx" tagname="details" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="css" runat="Server">
    <link rel="stylesheet" href="/WebSite/_Assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="/WebSite/_Assets/css/pages/blog.css">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <!--=== Content Part ===-->
    <div class="container content">
        <div class="row margin-bottom-20">
            <div class="col-md-12">
               <p>We can get a solutions for every business branch, trust in us we have a greate experience and grate portfolio</p>
            </div>
        </div>
      <uc2:details ID="ucItemDetails" runat="server" />
        <uc5:Clients ID="Clients2" runat="server" RequiredModule="Clients" />

    </div>
    <!--/container-->

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="Server">
    <!-- JS Implementing Plugins -->
    <script type="text/javascript" src="/WebSite/_Assets/plugins/flexslider/jquery.flexslider-min.js"></script>
    <!-- JS Page Level -->
    <script type="text/javascript" src="/WebSite/_Assets/js/app.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            App.init();
            App.initSliders();
        });
    </script>
</asp:Content>
