<%@ Page language="c#" MasterPageFile="~/AdminCP/ClearAdmin.master" CodeFile="Add.aspx.cs" Inherits="Admin_SiteDeparments_Organization_Create"  %>

 <%@ Register src="../../../AdminCP/_UserControls/SiteDeparments/Create.ascx" tagname="Create" tagprefix="uc1" %>

 <asp:Content id="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <uc1:Create ID="ucCreate" runat="server" />
</asp:Content>

