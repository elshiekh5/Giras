<%@ Control Language="c#" AutoEventWireup="true" CodeFile="Update.ascx.cs" Inherits="Messages_Update" %>
<%@ Register Src="../Date.ascx" TagName="Date" TagPrefix="uc1" %>
<%@ Register Src="../HijriDate.ascx" TagName="HijriDate" TagPrefix="uc2" %>
<%@ Register TagPrefix="CE" Namespace="CuteEditor" Assembly="CuteEditor" %>



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
                        <asp:Literal ID="lblAdminNote" runat="server"></asp:Literal>
                   </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-12">
                        <asp:Literal ID="lblResult" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="form-group" id="trCategoryID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblCategoryID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlCategoryID" runat="server" CssClass="form-control" ValidationGroup="Messages" />
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="*" ControlToValidate="ddlCategoryID" ValidationGroup="Messages"
                            Text="*" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trSendingDate" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblSendingDate" runat="server" />:</label>
                        
                    <div class="col-lg-9">
                        <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="form-group" id="trName" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblName" runat="server" />:</label>
                       
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtName" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvName"
                            runat="server" ErrorMessage="*" ControlToValidate="txtName" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trNameSeparated" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblNameSeparated" runat="server" />:</label>
                    <div class="col-lg-3">
                         <asp:TextBox MaxLength="128" ID="txtLName" Text="Last" runat="server" CssClass="form-control"
                                        Width="100px" ValidationGroup="Messages"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="Xourvalidation" InitialValue="Last" Display="Dynamic"
                                        ID="rfvLName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtLName"
                                        ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox MaxLength="128" ID="txtMname" Text="Middle" runat="server" CssClass="form-control"
                                        Width="100px" ValidationGroup="Messages"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="Xourvalidation" InitialValue="Middle" Display="Dynamic"
                                        ID="rfvMName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtMname"
                                        ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox MaxLength="128" ID="txtFName" Text="First" runat="server" CssClass="form-control"
                                        Width="100px" ValidationGroup="Messages"></asp:TextBox>
                                    <asp:RequiredFieldValidator CssClass="Xourvalidation" InitialValue="First" Display="Dynamic"
                                        ID="rfvFName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtFName"
                                        ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                       
                </div>
                <div class="form-group" id="trJobID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblJobID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtJobID" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvJobID"
                            runat="server" ErrorMessage="*" ControlToValidate="txtJobID" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trJobText" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblJobText" runat="server" />:</label>
                        
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtJobText" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvJobText"
                            runat="server" ErrorMessage="*" ControlToValidate="txtJobText" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trCompany" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblCompany" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtCompany" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvCompany"
                            runat="server" ErrorMessage="*" ControlToValidate="txtCompany" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trActivitiesID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblActivitiesID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlActivitiesID" runat="server" CssClass="form-control" ValidationGroup="Messages">
                            <asp:ListItem Selected="True" Value="-1" Text="<%$ Resources:User,Choose %>"></asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$ Resources:Messages,ActivitiesID_1 %>"></asp:ListItem>
                            <asp:ListItem Value="2" Text="<%$ Resources:Messages,ActivitiesID_2 %>"></asp:ListItem>
                            <asp:ListItem Value="3" Text="<%$ Resources:Messages,ActivitiesID_3 %>"></asp:ListItem>
                            <asp:ListItem Value="4" Text="<%$ Resources:Messages,ActivitiesID_4 %>"></asp:ListItem>
                            <asp:ListItem Value="5" Text="<%$ Resources:Messages,ActivitiesID_5 %>"></asp:ListItem>
                            <asp:ListItem Value="6" Text="<%$ Resources:Messages,ActivitiesID_6 %>"></asp:ListItem>
                            <asp:ListItem Value="7" Text="<%$ Resources:Messages,ActivitiesID_7 %>"></asp:ListItem>
                            <asp:ListItem Value="8" Text="<%$ Resources:Messages,ActivitiesID_8 %>"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvActivitiesID"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlActivitiesID" InitialValue="-1"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trNationalityID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblNationalityID" runat="server" />:</label>
                        
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlNationalityID" runat="server" CssClass="form-control" ValidationGroup="Messages" />
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvNationalityID"
                            runat="server" ErrorMessage="<%$ Resources:User,RequiredField %>" ControlToValidate="ddlNationalityID"
                            ValidationGroup="Messages" Text="<%$ Resources:User,RequiredField %>" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trCountryID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblCountryID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlCountries" runat="server" CssClass="form-control" ValidationGroup="Messages" />
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvCountryID"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlCountries" ValidationGroup="Messages"
                            Text="*" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trEmpNo" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblEmpNo" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="8" ID="txtEmpNo" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvEmpNo"
                            runat="server" ErrorMessage="*" ControlToValidate="txtEmpNo" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator CssClass="ourvalidation" Display="Dynamic" ID="revDaysCount"
                            runat="server" ControlToValidate="txtEmpNo" ErrorMessage="<%$ Resources:Messages,EmpNoError %>"
                            ValidationGroup="Messages" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trCityID" runat="server" visible="false">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblCityID" runat="server" />:</label>
                        
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlCities" runat="server" CssClass="form-control" ValidationGroup="Messages">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Visible="false" Display="Dynamic"
                            ID="rfvCityID" runat="server" ErrorMessage="*" ControlToValidate="ddlCities"
                            InitialValue="-1" ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trUserCityName" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblUserCityName" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="32" ID="txtUserCityName" runat="server" CssClass="form-control"
                            ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Visible="false" Display="Dynamic"
                            ID="rfvUserCityName" runat="server" ErrorMessage="*" ControlToValidate="txtUserCityName"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trEMail" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblEmail" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtEMail" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RegularExpressionValidator CssClass="ourvalidation" Display="Dynamic" ID="revEMail"
                            runat="server" ControlToValidate="txtEMail" ErrorMessage="" Text="<%$ Resources:MemberShip,InvalidEmail %>"
                            ValidationGroup="Messages" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvEMail"
                            runat="server" ErrorMessage="*" ControlToValidate="txtEMail" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trPhotoExtension" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblPhotoExtension" runat="server" />:</label>
                <div class="col-lg-9">
                    <div class="media no-margin-top">
                        <div class="media-left" id="trPhotoPreview" runat="server">
                            <a runat="server" id="aPhotoPreview" >
                                <asp:Image runat="server" ID="imgPhoto" CssClass="img-rounded" ImageUrl="/Layout2/RTL/assets/images/placeholder.jpg"  style="width: 58px; height: 58px;" />
                            </a>
                                <asp:Button ID="btnDeletePhoto" runat="server" ValidationGroup="DeletePhoto" OnClick="btnDeletePhoto_Click"
                                        CssClass="btnDeletePhoto" />
                        </div>

                        <div class="media-body">
                            <asp:FileUpload ID="fuPhoto" runat="server" CssClass="file-styled" />
                            <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvPhoto" ControlToValidate="fuPhoto"
                                Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                            <asp:CheckBox ID="cbPublishPhoto" CssClass="form-control" runat="server" ValidationGroup="Items"></asp:CheckBox>
                            <asp:RegularExpressionValidator ValidationGroup="Items" ID="rxpPhoto" Display="Dynamic"
                                runat="server" ControlToValidate="fuPhoto"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblPhotoAvailableExtension" CssClass="help-block" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-group" id="trPhoto2Extension" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblPhoto2Extension" runat="server" />:</label>
                <div class="col-lg-9">
                    <div class="media no-margin-top">
                        <div class="media-left"  id="trPhoto2Preview" runat="server" >
                            <a runat="server" id="aPhoto2Preview" >
                                <asp:Image runat="server" ID="imgPhoto2" CssClass="img-rounded" ImageUrl="/Layout2/RTL/assets/images/placeholder.jpg"  style="width: 58px; height: 58px;" />
                            </a>
                            <asp:Button ID="btnDeletePhoto2" runat="server" ValidationGroup="DeletePhoto2" OnClick="btnDeletePhoto2_Click"
                                        CssClass="btnDeletePhoto" />
                        </div>

                        <div class="media-body">
                            <asp:FileUpload ID="fuPhoto2" runat="server" CssClass="file-styled" />
                            <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvPhoto2" ControlToValidate="fuPhoto2"
                                Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                            <asp:CheckBox ID="cbPublishPhoto2" CssClass="form-control" runat="server"
                                ValidationGroup="Items"></asp:CheckBox>

                            <asp:RegularExpressionValidator ValidationGroup="Items" Display="Dynamic" ID="rxpPhoto2"
                                runat="server" ControlToValidate="fuPhoto2"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblPhoto2AvailableExtension" CssClass="help-block" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

                <div class="form-group" id="trFileExtension" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblFileExtension" runat="server" />:</label>
                <div class="col-lg-9">
                    <div class="media no-margin-top">
                        <div class="media-left" id="trFilePreview" runat="server">
                            <a id="hlFile" target="_blank" runat="server">
                            <img src='/Content/AdminDesign/Ar/css/images/buttons/download.gif' border="0" /></a>
                        <asp:ImageButton ID="ibtnDeleteFile" runat="server" ValidationGroup="DeleteFile"
                            OnClick="ibtnDeleteFile_Click" ImageUrl="/Content/AdminDesign/Ar/css/images/buttons/delete.gif" />
                        <br />
                        <%--<%=Banner %>--%>
                        </div>

                        <div class="media-body">
                            <asp:FileUpload ID="fuFile" runat="server" CssClass="file-styled" />
                            <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvFile" ControlToValidate="fuFile"
                                Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                            <asp:CheckBox ID="cbPublishFile" CssClass="form-control" runat="server" ValidationGroup="Items"></asp:CheckBox>
                            <asp:RegularExpressionValidator ValidationGroup="Items" Display="Dynamic" ID="rxpFile"
                                runat="server" ControlToValidate="fuFile"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblFileAvailableExtension" CssClass="help-block" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

                <div class="form-group" id="trWidth" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblWidth" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="3" ID="txtWidth" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Messages" ID="rfvWidth" ControlToValidate="txtWidth"
                            Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Messages" Display="Dynamic" ID="rxpWidth"
                            ValidationExpression="\d*" runat="server" ControlToValidate="txtWidth" ErrorMessage="<%= Resources.AdminText.InvalidNumericalData %>"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trHeight" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblHeight" runat="server" />:</label>
                        
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="3" ID="txtHeight" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Messages" ID="rfvHeight" ControlToValidate="txtHeight"
                            Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Messages" Display="Dynamic" ID="rxpHeight"
                            ValidationExpression="\d*" runat="server" ControlToValidate="txtHeight" ErrorMessage="<%= Resources.AdminText.InvalidNumericalData %>"></asp:RegularExpressionValidator>
                    </div>
                </div>
                
               
                 <div class="form-group" id="trVideoExtension" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblVideoExtension" runat="server" />
                    :</label>
                <div class="col-lg-9">
                    <div class="media no-margin-top">
                     <div class="media-left" id="trVideoPreview" runat="server">
                         <a id="hlVideo" target="_blank" runat="server">
                            <img src='/Content/AdminDesign/Ar/css/images/buttons/download.gif' border="0" /></a>
                        <asp:ImageButton ID="ibtnDeleteVideo" runat="server" ValidationGroup="DeleteVideo"
                            OnClick="ibtnDeleteVideo_Click" ImageUrl="/Content/AdminDesign/Ar/css/images/buttons/delete.gif" />
                          </div>
                    <div class="media-body">
                        <asp:FileUpload ID="fuVideo" runat="server" CssClass="file-styled" />
                        <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvVideo" ControlToValidate="fuVideo"
                            Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                        <asp:CheckBox ID="cbPublishVideo" CssClass="form-control" runat="server" ValidationGroup="Items"></asp:CheckBox>
                        <asp:RegularExpressionValidator ValidationGroup="Items" Display="Dynamic" ID="rxpVideo"
                            runat="server" ControlToValidate="fuVideo"></asp:RegularExpressionValidator>
                        <asp:Label ID="lblVideoAvailableExtension" CssClass="help-block" runat="server"></asp:Label>
                    </div>
                </div>
                </div>
            </div>
            <div class="form-group" id="trYoutubeCode" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblYoutubeCode" runat="server" />
                    :</label>
                <div class="col-lg-9">
                    <asp:TextBox MaxLength="16" ID="txtYoutubeCode" runat="server" CssClass="form-control"
                        ValidationGroup="Items"></asp:TextBox>
                    <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvYoutubeCode" ControlToValidate="txtYoutubeCode"
                        Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                    <asp:CheckBox ID="cbPublishYoutbe" CssClass="form-control" runat="server"
                        ValidationGroup="Items"></asp:CheckBox>
                     <a runat="server" id="aYoutube" onclick="return hs.htmlExpand(this, { objectType: 'iframe', minHeight:'457' , height: '457' , width: '577' } )">
                                        <img hspace="0" class="youtubeviewer" src="/Content/images/spacer.gif"
                                            border="0" alt="" /></a>
                </div>
            </div>
            <div class="form-group" id="trAudioExtension" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblAudioExtension" runat="server" />
                    :</label>
                <div class="col-lg-9">
                    <div class="media no-margin-top">
                        <div class="media-left" id="trAudioPreview" runat="server">
                           <a id="hlAudio" target="_blank" runat="server">
                            <img src='/Content/AdminDesign/Ar/css/images/buttons/download.gif' border="0" /></a>
                        <asp:ImageButton ID="ibtnDeleteAudio" runat="server" ValidationGroup="DeleteAudio"
                            OnClick="ibtnDeleteAudio_Click" ImageUrl="/Content/AdminDesign/Ar/css/images/buttons/delete.gif" />
                        </div>

                        <div class="media-body">
                              <asp:FileUpload ID="fuAudio" runat="server" CssClass="file-styled" />
                    <asp:RequiredFieldValidator ValidationGroup="Items" ID="rfvAudio" ControlToValidate="fuAudio"
                        Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                    <asp:CheckBox ID="cbPublishAudio" CssClass="form-control" runat="server" ValidationGroup="Items"></asp:CheckBox>
                    <asp:RegularExpressionValidator ValidationGroup="Items" Display="Dynamic" ID="rxpAudio"
                        runat="server" ControlToValidate="fuAudio"></asp:RegularExpressionValidator>
                    <asp:Label ID="lblAudioAvailableExtension" CssClass="help-block" runat="server"></asp:Label>
                        </div>
                    </div>

                  
                </div>
                </div>
               
                <div class="form-group" id="trItemDate" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblItemDate" runat="server" />:</label>
                    <div class="col-lg-9">
                        <uc1:Date ID="ucItemDate" runat="server" ValidationGroup="Messages" />
                    </div>
                </div>
                <div class="form-group" id="trUrl" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblUrl" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtUrl" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvUrl"
                            runat="server" ErrorMessage="*" ControlToValidate="txtUrl" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trTel" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblTel" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="13" ID="txtTel" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvTel"
                            runat="server" ErrorMessage="*" ControlToValidate="txtTel" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rxvTel" runat="server" ValidationGroup="Messages"
                            ControlToValidate="txtTel" ErrorMessage="<%$ Resources:User,InvalidNumericalData %>"
                            Display="Dynamic" CssClass="ourvalidation" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" runat="server" id="trMobile">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblMobile" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="32" ID="txtMobile" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvMobile"
                            runat="server" ErrorMessage="*" ControlToValidate="txtMobile" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rxvMobile" runat="server" ValidationGroup="Messages"
                            ControlToValidate="txtMobile" ErrorMessage="<%$ Resources:User,InvalidNumericalData %>"
                            Display="Dynamic" CssClass="ourvalidation" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trFax" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblFax" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtFax" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvFax"
                            runat="server" ErrorMessage="*" ControlToValidate="txtFax" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rxvFax" runat="server" ValidationGroup="Messages"
                            ControlToValidate="txtFax" ErrorMessage="<%$ Resources:User,InvalidNumericalData %>"
                            Display="Dynamic" CssClass="ourvalidation" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trMailBox" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblMailBox" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtMailBox" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvMailBox"
                            runat="server" ErrorMessage="*" ControlToValidate="txtMailBox" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rxvMailBox" runat="server" ValidationGroup="Messages"
                            ControlToValidate="txtMailBox" ErrorMessage="<%$ Resources:User,InvalidNumericalData %>"
                            Display="Dynamic" CssClass="ourvalidation" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trZipCode" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblZipCode" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtZipCode" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvZipCode"
                            runat="server" ErrorMessage="*" ControlToValidate="txtZipCode" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rxvZipCode" runat="server" ValidationGroup="Messages"
                            ControlToValidate="txtZipCode" ErrorMessage="<%$ Resources:User,InvalidNumericalData %>"
                            Display="Dynamic" CssClass="ourvalidation" ValidationExpression="\d*"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trHasSmsService" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblHasSmsService" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:CheckBox ID="cbHasSmsService" runat="server" ValidationGroup="Messages"></asp:CheckBox>
                    </div>
                </div>
                <div class="form-group" id="trHasEmailService" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblHasEmailService" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:CheckBox ID="cbHasEmailService" runat="server" ValidationGroup="Messages"></asp:CheckBox>
                    </div>
                </div>
                <div class="form-group" id="trAgeRang" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblAgeRang" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlAgeRang" runat="server" CssClass="form-control" ValidationGroup="Messages">
                            <asp:ListItem Selected="True" Value="-1" Text="<%$ Resources:User,Choose %>"></asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$ Resources:Messages,AgeRang_1 %>"></asp:ListItem>
                            <asp:ListItem Value="2" Text="<%$ Resources:Messages,AgeRang_2 %>"></asp:ListItem>
                            <asp:ListItem Value="3" Text="<%$ Resources:Messages,AgeRang_3 %>"></asp:ListItem>
                            <asp:ListItem Value="4" Text="<%$ Resources:Messages,AgeRang_4 %>"></asp:ListItem>
                            <asp:ListItem Value="5" Text="<%$ Resources:Messages,AgeRang_5 %>"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvAgeRang"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlAgeRang" InitialValue="-1"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trGender" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblGender" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" ValidationGroup="Messages">
                            <asp:ListItem Selected="True" Value="-1" Text="<%$ Resources:User,Choose %>"></asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$ Resources:Messages,Gender_1 %>"></asp:ListItem>
                            <asp:ListItem Value="2" Text="<%$ Resources:Messages,Gender_2 %>"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvGender"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlGender" InitialValue="-1"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trBirthDate" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblBirthDate" runat="server" />:</label>
                    <div class="col-lg-9">
                        <uc1:Date ID="ucDateBirthDate" runat="server" ValidationGroup="Messages" />
                    </div>
                </div>
                <div class="form-group" id="trSocialStatus" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblSocialStatus" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlSocialStatus" runat="server" CssClass="form-control" ValidationGroup="Messages">
                            <asp:ListItem Selected="True" Value="-1" Text="<%$ Resources:User,Choose %>"></asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$ Resources:Messages,SocialStatus_1 %>"></asp:ListItem>
                            <asp:ListItem Value="2" Text="<%$ Resources:Messages,SocialStatus_2 %>"></asp:ListItem>
                            <asp:ListItem Value="3" Text="<%$ Resources:Messages,SocialStatus_3 %>"></asp:ListItem>
                            <asp:ListItem Value="4" Text="<%$ Resources:Messages,SocialStatus_4 %>"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvSocialStatus"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlSocialStatus" InitialValue="-1"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="form-group" runat="server" id="trAddress">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblAddress" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="256" ID="txtAddress" runat="server" TextMode="MultiLine"
                            CssClass="form-control" ValidationGroup="Messages" maxlengthS="256" onkeyup="return ismaxlength(this,document.forms[0].txtAddressLengthControler)"
                            onfocus="return ismaxlength(this,document.forms[0].txtAddressLengthControler)"></asp:TextBox>
                        <input type="text" class="Controls" name="txtAddressLengthControler" id="txtAddressLengthControler"
                            style="width: 40px;" disabled>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvAddress"
                            runat="server" ErrorMessage="*" ControlToValidate="txtAddress" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" runat="server" id="trJobTel">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblJobTel" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="32" ID="txtJobTel" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvJobTel"
                            runat="server" ErrorMessage="*" ControlToValidate="txtJobTel" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trPrice" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblPrice" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Messages" ID="rfvPrice" ControlToValidate="txtPrice"
                            Display="Dynamic" runat="server" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trGoogleLatitude" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblGoogleLatitude" runat="server" />
                    :</label>
                <div class="col-lg-9">
                    <div style="float: right">
                        <asp:TextBox CssClass="form-control" MaxLength="64" ID="txtGoogleLatitude" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGoogleLatitude" runat="server" ErrorMessage="*"
                            ControlToValidate="txtGoogleLatitude" ValidationGroup="Items"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Items" ControlToValidate="txtGoogleLatitude"
                            ID="RegularExpressionValidator2" ValidationExpression="[0-9]*\.?[0-9]*" Display="Dynamic"
                            runat="server" ErrorMessage="<%$ Resources:AdminText,InvalidEnteredValue %>"></asp:RegularExpressionValidator>
                    </div>
                    <div style="float: right">
                        <a runat="server" href="/PopUps/GoogleMap.aspx" onclick="return hs.htmlExpand(this, { objectType: 'iframe', minHeight:'510' , height: '510' , width: '520' } )">
                            <img hspace="0" class='googleIcon' src="/Content/images/spacer.gif" alt="<%= Resources.AdminText.GoogleMapShow %>" /></a>
                    </div>
                </div>
            </div>
            <div class="form-group" id="trGoogleLongitude" runat="server">
                <label class="col-lg-3 control-label">
                    <asp:Label ID="lblGoogleLongitude" runat="server" />
                    :</label>
                <div class="col-lg-9">
                    <div style="float: right">
                        <asp:TextBox CssClass="form-control" MaxLength="64" ID="txtGoogleLongitude" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvGoogleLongitude" runat="server" ErrorMessage="*"
                            ControlToValidate="txtGoogleLongitude" ValidationGroup="Items"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="Items" ID="RegularExpressionValidator1"
                            ControlToValidate="txtGoogleLongitude" ValidationExpression="[0-9]*\.?[0-9]*"
                            Display="Dynamic" runat="server" ErrorMessage="<%$ Resources:AdminText,InvalidEnteredValue %>"></asp:RegularExpressionValidator>
                    </div>
                    <div style="float: right">
                        <a runat="server" href="/PopUps/GoogleMap.aspx" onclick="return hs.htmlExpand(this, { objectType: 'iframe', minHeight:'510' , height: '510' , width: '520' } )">
                            <img hspace="0" class='googleIcon' src="/Content/images/spacer.gif" alt="<%= Resources.AdminText.GoogleMapShow %>" /></a>
                    </div>
                </div>
            </div>
                <div class="form-group" runat="server" id="trType">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblType" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvType"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlType" ValidationGroup="Messages"
                            Text="*" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trEducationLevel" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblEducationLevel" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlEducationLevel" runat="server" CssClass="form-control" ValidationGroup="Messages">
                            <asp:ListItem Selected="True" Value="-1" Text="<%$ Resources:User,Choose %>"></asp:ListItem>
                            <asp:ListItem Value="1" Text=""></asp:ListItem>
                            <asp:ListItem Value="2" Text=""></asp:ListItem>
                            <asp:ListItem Value="3" Text=""></asp:ListItem>
                            <%--<asp:ListItem Value="4" Text="<%$ Resources:Messages,EducationLevel_4 %>"></asp:ListItem>
                            <asp:ListItem Value="5" Text="<%$ Resources:Messages,EducationLevel_5 %>"></asp:ListItem>--%>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvEducationLevel"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlEducationLevel" InitialValue="-1"
                            ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trToItemID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblToItemID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlItems" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvToItemID"
                            runat="server" ErrorMessage="*" ControlToValidate="ddlItems" ValidationGroup="Messages"
                            Text="*" InitialValue="-1"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trToUserID" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblToUserID" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlToUserID" runat="server" CssClass="form-control" ValidationGroup="Messages" />
                    </div>
                </div>
                <div class="form-group" runat="server" id="trTitle">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblTitle" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtTitle" runat="server" CssClass="form-control" ValidationGroup="Messages"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="ourvalidation" Display="Dynamic" ID="rfvTitle"
                            runat="server" ErrorMessage="*" ControlToValidate="txtTitle" ValidationGroup="Messages"
                            Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group" id="trShortDescription" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblShortDescription" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="500" ID="txtShortDescription" runat="server" TextMode="MultiLine"
                            CssClass="form-control" maxlengthS="500" onkeyup="return ismaxlength(this,document.forms[0].txtShortDescriptionLengthControler)"
                            onfocus="return ismaxlength(this,document.forms[0].txtShortDescriptionLengthControler)"></asp:TextBox>
                        <input type="text" runat="server" class="Controls" id="txtSDLengthControler" style="width: 40px;"
                            disabled>
                        <asp:RequiredFieldValidator ID="rfvShortDescription" ControlToValidate="txtShortDescription"
                            CssClass="ourvalidation" ValidationGroup="Messages" runat="server" ErrorMessage="*"
                            Text="*" Display="Dynamic" />
                    </div>
                </div>
                <div class="form-group" id="trDetailsText" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblDetails" runat="server" />:</label>
                    <div class="col-lg-9" id="trDetailsControl" runat="server">
                        <asp:TextBox ReadOnly="true" ID="txtDetails" runat="server" TextMode="MultiLine"
                            CssClass="form-control" ValidationGroup="Messages" maxlengthS="1024" onkeyup="return ismaxlength(this,document.forms[0].txtDetailsLengthControler)"
                            onfocus="return ismaxlength(this,document.forms[0].txtDetailsLengthControler)" Rows="10"></asp:TextBox>
                        <CE:Editor ID="fckDetails" Height="500" Width="1000" EditorWysiwygModeCss="~/CuteSoft_Client/example.css"
                            runat="server">
                        </CE:Editor>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="rfvDetails" runat="server" ErrorMessage="*"
                            ControlToValidate="txtDetails" ValidationGroup="Messages" Text="*"></asp:RequiredFieldValidator>
                    </div>
                </div>
              
                <div class="form-group" id="trPriority" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblPriority" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group" id="trHasIsMain" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblIsMain" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:CheckBox ID="CbIsMain" Checked="true" CssClass="form-control" runat="server"></asp:CheckBox>
                    </div>
                </div>
                <div class="form-group" id="trIsAvailable" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="lblIsAvailable" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:CheckBox ID="cbIsAvailable" Checked="true" CssClass="form-control" runat="server"
                            ValidationGroup="Messages"></asp:CheckBox>
                    </div>
                </div>
                <div class="form-group" id="trOnlyForRegisered" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblOnlyForRegisered" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:CheckBox ID="cbOnlyForRegisered" Checked="false" CssClass="form-control" runat="server">
                        </asp:CheckBox>
                    </div>
                </div>
                <div class="form-group" id="trReply" runat="server">
                    <label class="col-lg-3 control-label" id="trReplyText" runat="server"><asp:Label ID="lblReply" runat="server" />:</label>
                   <div class="col-lg-9">
                        <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="10"
                            ValidationGroup="Messages"></asp:TextBox>
                        <CE:Editor ID="fckReply" Height="500" Width="1000" EditorWysiwygModeCss="~/CuteSoft_Client/example.css"
                            runat="server">
                        </CE:Editor>
                    </div>
                </div>
                <div class="form-group" id="trAttatch1" runat="server">
                    <label class="col-lg-3 control-label"> <asp:Label ID="Label1s" Text="<%$ Resources:MailListAdmin,EmailAttatchFile1 %>" runat="server" />:</label>
                       
                    <div class="col-lg-9">
                        <asp:FileUpload ID="fuAttach1" runat="server" CssClass="form-control" ValidationGroup="MailListEmails" />
                        <asp:RegularExpressionValidator ID="regAttach1" runat="server" ControlToValidate="fuAttach1"
                            ValidationGroup="MailListEmails" ErrorMessage='<%$ Resources:MailListAdmin,EmailAttatchFileAvialableExtebtions %>'
                            ValidationExpression="(.*\.([pP][dD][fF])$)|(.*\.([dD][oO][cC])$)|(.*\.([dD][oO][cC][xX])$)|(.*\.([tT][xX][tT])$)|(.*\.([pP][nN][gG])$)|(.*\.([jJ][pP][gG])$)|(.*\.([gG][iI][fF])$)"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trAttatch2" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="Label3" Text="<%$ Resources:MailListAdmin,EmailAttatchFile2 %>" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:FileUpload ID="fuAttach2" runat="server" CssClass="form-control" ValidationGroup="MailListEmails" />
                        <asp:RegularExpressionValidator ID="regAttach2" runat="server" ControlToValidate="fuAttach2"
                            ErrorMessage='<%$ Resources:MailListAdmin,EmailAttatchFileAvialableExtebtions %>'
                            ValidationGroup="MailListEmails" ValidationExpression="(.*\.([pP][dD][fF])$)|(.*\.([dD][oO][cC])$)|(.*\.([dD][oO][cC][xX])$)|(.*\.([tT][xX][tT])$)|(.*\.([pP][nN][gG])$)|(.*\.([jJ][pP][gG])$)|(.*\.([gG][iI][fF])$)"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trAttatch3" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="Label5" Text="<%$ Resources:MailListAdmin,EmailAttatchFile3 %>" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:FileUpload ID="fuAttach3" runat="server" CssClass="form-control" ValidationGroup="MailListEmails" />
                        <asp:RegularExpressionValidator ID="regAttach3" runat="server" ControlToValidate="fuAttach3"
                            ValidationGroup="MailListEmails" ErrorMessage='<%$ Resources:MailListAdmin,EmailAttatchFileAvialableExtebtions %>'
                            ValidationExpression="(.*\.([pP][dD][fF])$)|(.*\.([dD][oO][cC])$)|(.*\.([dD][oO][cC][xX])$)|(.*\.([tT][xX][tT])$)|(.*\.([pP][nN][gG])$)|(.*\.([jJ][pP][gG])$)|(.*\.([gG][iI][fF])$)"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group" id="trMetaKeyWords" runat="server">
                    <label class="col-lg-3 control-label"><asp:Label ID="lblMetaKeyWords" runat="server" />:</label>
                    <div class="col-lg-9">
                        <asp:TextBox MaxLength="128" ID="txtMetaKeyWords" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="text-right">
                           <asp:Button ID="btnSave" runat="server" ValidationGroup="Messages" OnClick="btnSave_Click"
                            SkinID="btnSave" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>








