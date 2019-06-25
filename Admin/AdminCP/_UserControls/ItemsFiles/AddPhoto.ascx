<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddPhoto.ascx.cs" Inherits="UserControls_Items_AddPhoto" %>
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
                    <%--<div class="form-group">
                        <div class="col-lg-12">
                            <asp:Label ID="lblItemTitle" runat="server" Text="<%$ Resources:ItemsFiles,PhotosAdded %>" />
                        </div>
                    </div>--%>
                         <div class="form-group" id="trItems" runat="server" >
					<label class="col-lg-3 control-label"><asp:Label ID="lblItems" runat="server" />:</label>
					<div class="col-lg-9">
						<asp:DropDownList id="ddlItems" runat="server" CssClass="Controls" 
                            AutoPostBack="True" onselectedindexchanged="ddlItems_SelectedIndexChanged" ></asp:DropDownList>
						<asp:RequiredFieldValidator  id="rfvCategoryID" ValidationGroup="ItemsFiles" ControlToValidate="ddlItems"  Display="Dynamic" runat="server" ErrorMessage="*" InitialValue="-1"  Text="*"></asp:RequiredFieldValidator>
					</div>
				</div>
				 <div class="form-group" id="TrTitle" runat=server>
                    <label class="col-lg-3 control-label"><asp:Label ID="Label1" Text="<%$ Resources:ItemsFiles,PhotoComment %>" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtTitle" runat="server" CssClass="Controls" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="*" ControlToValidate="txtNo" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" runat=server>
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblFileText" runat="server" Text="<%$ Resources:ItemsFiles,Photo %>" /><span class="RequiredField"><asp:Label ID="Label2" runat="server" Text="*" /></span>:</label>
                    <div class="col-lg-9">
                        <asp:FileUpload ID="fuPhoto" runat="server" CssClass="file-styled" />
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvPhotoExtension" runat="server"
                            ErrorMessage="*" ControlToValidate="fuPhoto" ValidationGroup="ItemsFiles" Text="*"></asp:RequiredFieldValidator>
                           <asp:Button ID="btnSave" runat="server" ValidationGroup="ItemsFiles" OnClick="btnSave_Click"  CssClass="fileuploadersave" />
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-lg-12">
                       <asp:Label ID="Label3" runat="server" Text="<%$ Resources:ItemsFiles,PhotosAdded %>" />
                    </div>
                </div>

                       
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="row">
<asp:Repeater ID="rPhotos" runat="server" OnItemCommand="rPhotos_ItemCommand" OnItemDataBound="rPhotos_ItemDataBound" >
    <ItemTemplate>
        <div class="col-lg-3 col-sm-6" >
			<div class="thumbnail" >
				<div class="thumb">
					<img alt="" src="<%# ItemsFilesEntity.GetPhotoPath(PhotoTypes.Thumb,Eval("FileID"),Eval("PhotoExtension"),Eval("OwnerName"),Eval("ModuleTypeID"),Eval("CategoryID"),Eval("ItemID")) %>">
					<div class="caption-overflow">
						<span>
							<a class="btn border-white text-white btn-flat btn-icon btn-rounded" data-popup="lightbox" href="<%# ItemsFilesEntity.GetPhotoPath(PhotoTypes.Big,Eval("FileID"),Eval("FileExtension"),Eval("OwnerName"),Eval("ModuleTypeID"),Eval("CategoryID"),Eval("ItemID"))%>"><i class="icon-plus3"></i></a>
							<a class="btn border-white text-white btn-flat btn-icon btn-rounded ml-5" href="#"><i class="icon-link2"></i></a>
						</span>
					</div>
				</div>

				<div class="caption">
					<h6 class="no-margin"><a class="text-default" href="#"><%# Eval("Title")%></a> <a class="text-muted" href="#"><i class="icon-three-bars pull-right"></i></a></h6>
                    <asp:Button  runat="server" ValidationGroup="Items" ID="lbtnDelete"  CommandName="Delete" CommandArgument='<%#Eval("FileID") %>'
                        CssClass="btnDeletePhoto"  Text="Delete"/>
				</div>
			</div>
		</div>
    </ItemTemplate>
</asp:Repeater>
</div>
                
               


                   


                
               


                   
