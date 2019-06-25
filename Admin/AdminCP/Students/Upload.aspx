<%@ Page Language="c#" MasterPageFile="~/AdminCP/ClearAdmin.master" CodeFile="Upload.aspx.cs" ValidateRequest="false" Inherits="AdminStudentsUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

                        <div class="form-group">
                            <div class="col-lg-12">
                                <asp:Literal ID="lblResult" runat="server"></asp:Literal>
                            </div>
                        </div>

                        <div class="form-group" id="TrTitle" runat="server">
                            <label class="col-lg-3 control-label">
                                «”„ «·œ›⁄…:</label>
                            <div class="col-lg-9">
                                <asp:TextBox MaxLength="128" ID="txtTitle" runat="server" CssClass="form-control" ValidationGroup="ItemsFiles"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*" ControlToValidate="txtTitle" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" runat="server">
                            <label class="col-lg-3 control-label">
                                «·„·›<span class="RequiredField"><asp:Label ID="Label2" runat="server" Text="*" /></span>:</label>
                            <div class="col-lg-9">
                                <asp:FileUpload ID="fuFile" runat="server" CssClass="file-styled" />
                                <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPhotoExtension" runat="server"
                                    ErrorMessage="*" ControlToValidate="fuFile" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                                <asp:Button ID="btnSave" runat="server" ValidationGroup="ItemsFiles" OnClick="btnSave_Click" CssClass="fileuploadersave" />
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>

