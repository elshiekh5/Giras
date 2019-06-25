<%@ Page Language="c#" MasterPageFile="~/AdminCP/ClearAdmin.master" CodeFile="ViewData.aspx.cs" ValidateRequest="false" Inherits="AdminStudentsViewData" %>

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
                                <asp:DropDownList ID="ddlStudentsFiles" runat="server" CssClass="form-control" ValidationGroup="ItemsFiles"
                                    AutoPostBack="True" OnSelectedIndexChanged="StudentsFiles_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCategoryID" ValidationGroup="ItemsFiles" ControlToValidate="ddlStudentsFiles" Display="Dynamic" runat="server" ErrorMessage="*" InitialValue="-1" Text="*"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                       <div class="form-group">
                        <div class="col-lg-12">
                            <div class="table-responsive">
							<asp:DataGrid ID="dgStudents" runat="server" CssClass="table" SkinID="GridViewSkin2" 
                                OnItemDataBound="dgStudents_ItemDataBound" OnDeleteCommand="dgStudents_DeleteCommand">
                                <Columns>
                                    <asp:BoundColumn ItemStyle-Width="20"  HeaderText="<%$ Resources:AdminText,Index %>"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Name" ItemStyle-Width="60%" HeaderText="«·«”„"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="No" ItemStyle-Width="20%" HeaderText="—ﬁ„ «·‘Â«œ…"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Title" ItemStyle-Width="20%" HeaderText="«·„”„Ï"></asp:BoundColumn>
                                    <asp:TemplateColumn ItemStyle-Width="20px"  HeaderText="<%$ Resources:AdminText,Update %>">
                                        <ItemTemplate>
                                            <a href='<%# "Edit.aspx?id="+DataBinder.Eval(Container.DataItem, "ID") %>' class='Link'>
                                                <img src="/Content/AdminDesign/global/images/Edit.gif" style="border-width: 0px" alt="<%#Resources.AdminText.Update%>" /></a>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn ItemStyle-Width="20px"  HeaderText="<%$ Resources:AdminText,Delete %>">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="lbtnDelete" SkinID="ibtnGridDelete" CommandName="Delete" runat="server"></asp:ImageButton>
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




</asp:Content>

