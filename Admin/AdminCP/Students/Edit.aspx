<%@ Page Language="c#" MasterPageFile="~/AdminCP/ClearAdmin.master" CodeFile="Edit.aspx.cs" ValidateRequest="false" Inherits="AdminStudentsUpload" %>

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

                        <div class="form-group" id="TrName" runat="server">
                            <label class="col-lg-3 control-label">
                                «·«”„:</label>
                            <div class="col-lg-9">
                                <asp:TextBox MaxLength="128" ID="txtName" runat="server" CssClass="form-control" ValidationGroup="ItemsFiles"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*" ControlToValidate="txtName" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        

                        <div class="form-group" id="TrNo" runat="server">
                            <label class="col-lg-3 control-label">
                                	—ﬁ„ «·‘Â«œ…:</label>
                            <div class="col-lg-9">
                                <asp:TextBox MaxLength="128" ID="txtNo" runat="server" CssClass="form-control" ValidationGroup="ItemsFiles"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="*" ControlToValidate="txtNo" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group" id="Div1" runat="server">
                            <label class="col-lg-3 control-label">
                                «·„”„Ï:</label>
                            <div class="col-lg-9">
                                <asp:TextBox MaxLength="128" ID="txtTitle" runat="server" CssClass="form-control" ValidationGroup="ItemsFiles"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="*" ControlToValidate="txtTitle" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="text-right">
                        <%--<button type="submit" class="btn btn-primary">Submit form <i class="icon-arrow-left13 position-right"></i></button>--%>
                        <%--<button runat="server" OnClick="btnSave_Click" ValidationGroup="Items" type="submit" class="btn btn-primary">Submit form <i class="icon-arrow-left13 position-right"></i></button>--%>
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" ValidationGroup="Items" OnClick="btnSave_Click"
                            SkinID="btnSave" />


                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>

