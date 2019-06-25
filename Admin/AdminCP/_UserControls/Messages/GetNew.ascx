<%@ Control Language="c#" AutoEventWireup="true" CodeFile="GetNew.ascx.cs" Inherits="Messages_GetNew" %>

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
                    <div class="form-group" runat="server" id="trType">
                        <label class="col-lg-3 control-label">
                            <asp:Label ID="lblType" runat="server" />:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="ddlType" AutoPostBack="true" runat="server" CssClass="form-control"
                            OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
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
							<asp:DataGrid ID="dgMessages" runat="server" CssClass="table" SkinID="GridViewSkin2" OnDeleteCommand="dgMessages_DeleteCommand"
                            OnItemDataBound="dgMessages_ItemDataBound">
                            <Columns>
                                <asp:BoundColumn ItemStyle-Width="20"  HeaderText="<%$ Resources:AdminText,Index %>">
                                </asp:BoundColumn>
                                 <asp:TemplateColumn ItemStyle-Width="40%" HeaderText="">
                                    <ItemTemplate>
                                            <%#  DataBinder.Eval(Container, "DataItem.Title")%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-Width="40%" HeaderText="">
                                    <ItemTemplate>
                                            <%#  DataBinder.Eval(Container, "DataItem.Email")%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-Width="40%"  HeaderText="">
                                    <ItemTemplate>
                                            <%#  DataBinder.Eval(Container, "DataItem.Name")%>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <img alt="<%# Eval("IsSeen") %>" src="<%# General.GetBoleanPhoto(Eval("IsSeen")) %>" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <img alt="<%# Eval("IsReplied") %>" src="<%# General.GetBoleanPhoto(Eval("IsReplied")) %>" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                            <img  alt="<%# Eval("IsAvailable") %>" src="<%# General.GetBoleanPhoto(Eval("IsAvailable")) %>" />
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <center>
                                            <a href='Comments/ItemInActiveComments.aspx?id=<%# Eval("MessageID") %>'>
                                                <%# Eval("InactiveComments")%></a></center>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <center>
                                            <a href='Comments/ItemActiveComments.aspx?id=<%# Eval("MessageID") %>'>
                                                <%# Eval("ActiveComments")%></a></center>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn >
                                    <ItemTemplate>
                                        <%# Eval("Date_Added")%></ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-Width="20px"  HeaderText="<%$ Resources:AdminText,AdminGrid_View %>">
                                    <ItemTemplate>
                                        <a href='<%# "Edit.aspx?id="+DataBinder.Eval(Container.DataItem, "MessageID") %>'
                                            class='Link'>
                                            <img src="/Content/AdminDesign/global/images/Edit.gif" style="border-width: 0px" alt="<%#Resources.AdminText.Update%>" /></a>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:TemplateColumn ItemStyle-Width="20px" HeaderText="<%$ Resources:AdminText,Delete %>">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lbtnDelete" SkinID="ibtnGridDelete" CommandName="Delete" runat="server">
                                        </asp:ImageButton>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                            </Columns>
                        </asp:DataGrid>
						</div>
                            
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-lg-12">
                            <cc1:OurPager ID="pager" runat="server" OnPageIndexChang="Pager_PageIndexChang">
                        </cc1:OurPager>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
