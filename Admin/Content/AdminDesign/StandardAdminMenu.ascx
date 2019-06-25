<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StandardAdminMenu.ascx.cs"
    Inherits="App_Design_masters_AdminMenu" %>

<div class="sidebar-category sidebar-category-visible">
    <div class="category-content no-padding">
        <ul class="navigation navigation-main navigation-accordion">

            <!-- Main -->
           <%-- <li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>--%>
            <li><a href="/"><i class="icon-home4"></i><span><%= Resources.AdminText.ControlPanel %></span></a></li>
            <%= BuildDynamicModulesLinks()%>
            <!-- /page kits -->
        </ul>
    </div>
</div>
