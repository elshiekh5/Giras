﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>
<%@ Register Src="~/Content/AdminDesign/StandardAdminMenu.ascx" TagName="AdminMenu" TagPrefix="uc1" %>
<!DOCTYPE html>
<html lang="en" dir="rtl">
<head runat="server">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><%= Resources.AdminText.ControlPanel%></title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/colors.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
    <script type="text/javascript" src="/Layout2/RTL/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/forms/selects/select2.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/forms/styling/uniform.min.js"></script>

	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/app.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/pages/form_layouts.js"></script>
	<%--<script type="text/javascript" src="/Layout2/RTL/assets/js/pages/editor_ckeditor.js"></script>--%>
	<!-- /theme JS files -->
</head>
<body class="<%= bodyModuleClass %>">
    <form id="form1" runat="server">
        <!-- Main navbar -->
	<div class="navbar navbar-default header-highlight">
		<div class="navbar-header">
			<a class="navbar-brand" href="/"><%--<img src="/Layout2/RTL/assets/images/logo_light.png" alt="">--%></a>

			<ul class="nav navbar-nav visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>

				<li class="dropdown">
					
					
					
				</li>
			</ul>

			<%--<p class="navbar-text">
				<span class="label bg-success">Online</span>
			</p>--%>

			<div class="navbar-right">
				<ul class="nav navbar-nav">
					

					

					<li class="dropdown dropdown-user">
						<a class="dropdown-toggle" data-toggle="dropdown">
							<img src="/Layout2/RTL/assets/images/placeholder.jpg" alt="">
							<span><%= Page.User.Identity.Name %></span>
							<i class="caret"></i>
						</a>

						<ul class="dropdown-menu dropdown-menu-right">
							<%--<li><a href="#"><i class="icon-user-plus"></i> My profile</a></li>
							<li><a href="#"><i class="icon-coins"></i> My balance</a></li>
							<li><a href="#"><span class="badge bg-blue pull-right">58</span> <i class="icon-comment-discussion"></i> Messages</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="icon-cog5"></i> Account settings</a></li>--%>
							<li><a href="/LogOut.aspx"><i class="icon-switch2"></i> <%= Resources.AdminText.Logout %></a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main sidebar -->
			<div class="sidebar sidebar-main">
				<div class="sidebar-content">

					<!-- User menu -->
					
					<!-- /user menu -->


					<!-- Main navigation -->
					<uc1:AdminMenu ID="AdminMenu1" runat="server" />
					<!-- /main navigation -->

				</div>
			</div>
			<!-- /main sidebar -->


			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Page header -->
				<div class="page-header">
					<div class="page-header-content">
						<div class="page-title">
							<h4><i class="icon-arrow-right6 position-left"></i> <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h4>
						</div>

						
					</div>

					
				</div>
				<!-- /page header -->


				<!-- Content area -->
				<div class="content">


					 XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


					<!-- Footer -->
					<%--<div class="footer text-muted">
						&copy; 2015. <a href="#">Limitless Web App Kit</a> by <a href="http://themeforest.net/user/Kopyov" target="_blank">Eugene Kopyov</a>
					</div>--%>
					<!-- /footer -->

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->
    <div>
        
    </div>
    </form>
    <script>
        $(document).ready(function () {

            $(":file").change(function () {
                $('.fileuploadersave').trigger('click');
            })

        });

    </script>
</body>
</html>
