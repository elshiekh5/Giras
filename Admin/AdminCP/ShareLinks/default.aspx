<%@ Page Language="c#" MasterPageFile="~/AdminCP/ClearAdmin.master" CodeFile="default.aspx.cs"
    Inherits="AdminSiteSettings_OtherLinks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Horizontal form options -->
    <div class="row">
        <div class="col-md-12">

            <!-- Basic layout-->
            <asp:Literal ID="lblAdminNote" runat="server"></asp:Literal>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <!-- /basic layout -->

        </div>


    </div>
    <div class="row">
        <div class="col-md-12">

            <div class="form-horizontal">
                <div class="panel panel-flat">
                    <div class="panel-heading">
                        <%--<h5 class="panel-title">Static mode</h5>--%>
                        <div class="heading-elements">
                            <ul class="icons-list">
                                <li><a data-action="collapse"></a></li>
                                <li><a data-action="reload"></a></li>
                                <li><a data-action="close"></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="form-group">
                            <div class="col-lg-12">
                                <asp:Literal ID="lblResult" runat="server"></asp:Literal>
                            </div>
                        </div>

                        <div class="form-group" id="Tr1" runat="server" visible="true">
                            <label class="col-lg-3 control-label">Facebook:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtOtherLinks_Facebook" runat="server" CssClass="form-control"
                                    ValidationGroup="SiteSettings"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator25" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtOtherLinks_Facebook" ValidationGroup="SiteSettings" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" runat="server" visible="true">
                            <label class="col-lg-3 control-label">Twitter:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtOtherLinks_Twitter" runat="server" CssClass="form-control"
                                    ValidationGroup="SiteSettings"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvValue" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtOtherLinks_Twitter" ValidationGroup="SiteSettings" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" runat="server" visible="true">
                            <label class="col-lg-3 control-label">YouTube:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtOtherLinks_YouTube" runat="server" CssClass="form-control"
                                    ValidationGroup="SiteSettings"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*" ControlToValidate="txtOtherLinks_YouTube" ValidationGroup="SiteSettings"
                                    Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" id="TrLinkedIn" runat="server" visible="false">
                            <label class="col-lg-3 control-label">LinkedIn:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtOtherLinks_LinkedIn" runat="server" CssClass="form-control"
                                    ValidationGroup="SiteSettings"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtOtherLinks_LinkedIn" ValidationGroup="SiteSettings" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" id="TrGooglePlus" runat="server" visible="true">
                            <label class="col-lg-3 control-label">Google Plus:</label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="txtOtherLinks_GooglePlus" runat="server" CssClass="form-control"
                                    ValidationGroup="SiteSettings"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtOtherLinks_GooglePlus" ValidationGroup="SiteSettings" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>

                        <div class="text-right">
                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" ValidationGroup="SiteSettings" OnClick="btnSave_Click"
                                SkinID="btnSave" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>

