<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Export.ascx.cs" Inherits="App_Controls_Messages_Admin_Export" %>

<div class="row">
    <div class="col-md-12">

        <div class="form-horizontal">
            <div class="panel panel-flat">
                <div class="panel-heading">
                    <h5 class="panel-title"></h5>
                    <div class="heading-elements">
                        <ul class="icons-list">
                            <li><a data-action="collapse"></a></li>
                            <li><a data-action="reload"></a></li>
                            <li><a data-action="close"></a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="form-group" id="trLanguages" runat="server">
                        <label class="col-lg-3 control-label"><%= Resources.AdminText.Language %><span class="RequiredField">*</span> :</label>
                        <div class="col-lg-9">
                           <asp:DropDownList ID="ddlLanguages" runat="server"  CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group" runat="server" id="trType">
                        <label class="col-lg-3 control-label">
                            <asp:Label ID="lblType" runat="server" />:</label>
                        <div class="col-lg-9">
                           <asp:DropDownList ID="ddlType" runat="server"  CssClass="form-control">
                        </asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group" id="trExport" runat="server">
                        <div class="col-lg-12">
                             <asp:Button ID="btnExport" runat="server" ValidationGroup="Messages" OnClick="btnExport_Click"
                            SkinID="btnExport" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-12">
                            <asp:Literal ID="lblResult" runat="server"></asp:Literal>
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-lg-12">
                            <div class="table-responsive">
							<asp:DataGrid AutoGenerateColumns="False" AllowSorting="false" ID="dgMessages" runat="server"
                            CssClass="table" SkinID="GridViewSkin2">
                            <Columns>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetName(Eval("Name"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("EMail")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("CountryName")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("CityName")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("UserCityName")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("Company")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetJobIDText(Eval("JobID"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("JobText")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("EmpNo")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        
                                            <%# Eval("JobTel")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetActivitiesIDText(Eval("ActivitiesID"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                        
                                            <%# Eval("Url")%>
                                        </div>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("Tel")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("Mobile")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("Fax")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("MailBox")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="left">
                                    <ItemTemplate>
                                        <div dir="ltr">
                                            <%# Eval("ZipCode")%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("Address")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetAgeText( Eval("AgeRang"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetGenderText(Eval("Gender"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("BirthDate")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetSocialStatusText(Eval("SocialStatus"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# GetEducationLevelText(Eval("EducationLevel"))%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                            <%# GetTypeText(Eval("Type"))%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <center>
                                             <img alt="<%# GetBooleanText(Eval("HasSmsService"))%>" src="<%# SiteSettings.Site_WebsiteDomain+General.GetBoleanPhoto(Eval("HasSmsService")) %>" />
                                        </center>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <center>
                                             <img alt="<%# GetBooleanText(Eval("HasEmailService"))%>" src="<%# SiteSettings.Site_WebsiteDomain+General.GetBoleanPhoto(Eval("HasEmailService")) %>" />
                                        </center>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        
                                            <%# Eval("Date_Added")%>
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <center>
                                             <img alt="<%# GetBooleanText(Eval("IsSeen"))%>" src="<%# SiteSettings.Site_WebsiteDomain+General.GetBoleanPhoto(Eval("IsSeen")) %>" />
                                        </center>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <center>
                                             <img alt="<%# GetBooleanText(Eval("IsReplied"))%>" src="<%# SiteSettings.Site_WebsiteDomain+General.GetBoleanPhoto(Eval("IsReplied")) %>" />
                                        </center>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-HorizontalAlign="center" HeaderStyle-HorizontalAlign="center">
                                    <ItemTemplate>
                                        <center>
                                             <img alt="<%# GetBooleanText(Eval("IsAvailable"))%>" src="<%# SiteSettings.Site_WebsiteDomain+General.GetBoleanPhoto(Eval("IsAvailable")) %>" />
                                        </center>
                                            
                                        
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
						</div>
                            
                        </div>
                    </div>


                    

                </div>
            </div>
        </div>
    </div>
</div>