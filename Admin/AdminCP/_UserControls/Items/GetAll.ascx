<%@ Control Language="c#" AutoEventWireup="true" CodeFile="GetAll.ascx.cs" Inherits="Items_GetAll" %>

<%@ Register Assembly="MoversFW" Namespace="MoversFW" TagPrefix="cc1" %>

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
                            <asp:DropDownList ID="ddlLanguages" runat="server" CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="ddlLanguages_SelectedIndexChanged" />
                        </div>
                    </div>
                    <div class="form-group" id="trCategoryID" runat="server">
                        <label class="col-lg-3 control-label">
                            <asp:Label ID="lblCategoryID" runat="server" />:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="ddlItemCategories" runat="server" CssClass="form-control" ValidationGroup="Items"
                                AutoPostBack="True" OnSelectedIndexChanged="ddlItemCategories_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="rfvCategoryID" runat="server" ErrorMessage="*"
                                ControlToValidate="ddlItemCategories" InitialValue="-1" ValidationGroup="Items"
                                Text="*"></asp:RequiredFieldValidator>
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
							<asp:DataGrid ID="dgItems" runat="server" CssClass="table" SkinID="GridViewSkin2" OnDeleteCommand="dgItems_DeleteCommand"
                                OnItemDataBound="dgItems_ItemDataBound">
                                		

                                <Columns>
                                    <asp:BoundColumn ItemStyle-Width="20"  HeaderText="<%$ Resources:AdminText,Index %>"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Title" ItemStyle-Width="100%" 
                                        HeaderText=""></asp:BoundColumn>
                                    <asp:TemplateColumn ItemStyle-Width="100%"  HeaderText="">
                                        <ItemTemplate>
                                            <a runat="server" id="a1" href='<%# ItemsFactory.GetItemsPhotoBigThumbnailPhysicaly(Eval("ItemID"),Eval("PhotoExtension"), Eval("OwnerName"),Eval("ModuleTypeID"),Eval("CategoryID")) %>'
                                                class="highslide" onclick="return hs.expand(this)">
                                                <img src='<%# ItemsFactory.GetItemsPhotoThumbnailPhysicaly(Eval("ItemID"),Eval("PhotoExtension"),Eval("OwnerName"),Eval("ModuleTypeID"),Eval("CategoryID")) %>'
                                                    class="GImage" alt='<%# Resources.AdminText.ClickToEnlage %>' /></a>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="<%$ Resources:AdminText,AdminGrid_AddedBy %>">
                                        <ItemTemplate>
                                            <%# Eval("InsertUserName")%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="<%$ Resources:AdminText,AdminGrid_ActivationStatus %>">
                                        <ItemTemplate>
                                            <center>
                                            <img src="<%# General.GetBoleanPhoto(Eval("IsAvailable")) %>" /></center>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn ItemStyle-Width="20px"  HeaderText="<%$ Resources:AdminText,AdminGrid_Photos %>">
                                        <ItemTemplate>
                                            <a href='<%# "AddPhoto.aspx?ID="+DataBinder.Eval(Container.DataItem, "ItemID") %>'>
                                                <img border="0" src='/Content/AdminDesign/global/images/Edit.gif' alt='<%# Resources.AdminText.AdminGrid_Photos %>' /></a>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="<%$ Resources:AdminText,AdminGrid_InActiveComments %>">
                                        <ItemTemplate>
                                            <center>
                                            <a href='Comments/ItemInActiveComments.aspx?id=<%# Eval("ItemID") %>'>
                                                <%# Eval("InactiveComments")%></a></center>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="<%$ Resources:AdminText,AdminGrid_ActiveComments %>">
                                        <ItemTemplate>
                                            <center>
                                            <a href='Comments/ItemActiveComments.aspx?id=<%# Eval("ItemID") %>'>
                                                <%# Eval("ActiveComments")%></a></center>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <center>
                                            <a href='Messages/default.aspx?id=<%# Eval("ItemID") %>'>
                                                <%# Eval("RequestTotalCount")%></a></center>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <center>
                                            <a href='Messages/New.aspx?id=<%# Eval("ItemID") %>'>
                                                <%# Eval("RequestNewCount")%></a></center>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="<%$ Resources:AdminText,AdminGrid_DateAdded %>">
                                        <ItemTemplate>
                                            <%# Eval("Date_Added")%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn ItemStyle-Width="20px"  HeaderText="<%$ Resources:AdminText,Update %>">
                                        <ItemTemplate>
                                            <a href='<%# "Edit.aspx?id="+DataBinder.Eval(Container.DataItem, "ItemID") %>' class='Link'>
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


                    <div class="form-group">
                        <div class="col-lg-12">
                            <cc1:OurPager ID="pager" runat="server" OnPageIndexChang="Pager_PageIndexChang"></cc1:OurPager>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>






