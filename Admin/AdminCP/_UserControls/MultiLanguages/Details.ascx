<%@ Control Language="c#" AutoEventWireup="true" CodeFile="Details.ascx.cs" Inherits="MLanguagesDetailsControls2" %>

<%@ Register TagPrefix="CE" Namespace="CuteEditor" Assembly="CuteEditor" %>

<%@ Register Assembly="ServerControl1" Namespace="DC" TagPrefix="cc1" %>
<div class="form-group">
    <label class="col-lg-3 control-label"></label>
    <div class="col-lg-9">
        <asp:Literal ID="ltrScript" runat="server"></asp:Literal>
    </div>
</div>

<div class="form-group" id="trTitle" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblTitle" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="128" ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CustomValidator ID="cvTitle" runat="server" ValidationGroup="Items" ErrorMessage="*"
            Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trAuthorName" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblAuthorName" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="128" ID="txtAuthorName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CustomValidator ID="cvAuthorName" ValidationGroup="Items" runat="server" ErrorMessage="*"
            Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trAddress" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblAddress" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="128" ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CustomValidator ID="cvAddress" ValidationGroup="Items" runat="server" ErrorMessage="*"
            Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trExtraText_1" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblExtraText_1" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="128" ID="txtExtraText_1" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CustomValidator ID="cvExtraText_1" ValidationGroup="Items" runat="server" ErrorMessage="*"
            Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trShortDescription" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblShortDescription" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="500" ID="txtShortDescription" runat="server" TextMode="MultiLine"
            CssClass="form-control" maxlengthS="500" onkeyup="return ismaxlength(this,document.forms[0].txtShortDescriptionLengthControler)"
            onfocus="return ismaxlength(this,document.forms[0].txtShortDescriptionLengthControler)"></asp:TextBox>
        <input type="text" runat="server" class="form-control" id="txtSDLengthControler" style="width: 40px;"
            disabled>
        <asp:CustomValidator ID="cvShortDescription" ValidationGroup="Items" runat="server"
            ErrorMessage="*" Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trDetailsText" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblDetails" runat="server" />
        :</label>
    <div class="col-lg-9">
    </div>
</div>
<div class="form-group" id="trDetailsControl" runat="server">
    <div class="col-lg-12">
				<asp:TextBox TextMode="MultiLine" ID="fckDescription"  CssClass="fckEditor" runat="server" ></asp:TextBox>
       <%-- <ce:editor id="fckDescription" height="500" width="1000" editorwysiwygmodecss="~/CuteSoft_Client/example.css" runat="server"></ce:editor>--%>
        <asp:TextBox TextMode="MultiLine" ID="txtDescription" runat="server"
            CssClass="Detailsform-control"></asp:TextBox>
        <asp:CustomValidator ID="cvDescription" ValidationGroup="Items" runat="server" ErrorMessage="*"
            Display="Dynamic" />
    </div>
</div>
<div class="form-group" id="trMetaKeyWords" runat="server">
    <label class="col-lg-3 control-label">
        <asp:Label ID="lblMetaKeyWords" runat="server" />
        :</label>
    <div class="col-lg-9">
        <asp:TextBox MaxLength="128" ID="txtMetaKeyWords" runat="server" CssClass="form-control"></asp:TextBox>
        <%--<asp:CustomValidator ID="cvMetaKeyWords" ValidationGroup="Items" runat="server" ErrorMessage="*"
                Display="Dynamic" />--%>
    </div>
</div>

<script>
    $(function() {
        $(".fckEditor").each(function (index, element) {
            var id = $(this).attr("id");
            // Full featured editor
            CKEDITOR.replace(id, {
                height: '400px',
                extraPlugins: 'forms'
            });
        });
    });
</script>