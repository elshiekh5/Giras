<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportStudents.aspx.cs" Inherits="GenevaAribitation_ImportStudents" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="page_h">استيراد المستشارين
        </h1>
        <div class="form">

            <h3>استيراد المستشارين
            </h3>
            <p class="frm_fld">
                <label class="lbl">
                    الملف</label>
                <span style="color: Green;">الامتدادات المسموحة : (.xlsx)،(.xls)</span>
                <br />
                <asp:FileUpload ID="fuFile" runat="server" />
                <asp:RequiredFieldValidator ID="rfvMobile" ControlToValidate="fuFile" runat="server"
                    Text="*" ErrorMessage="يجب ادخال ملف" ValidationGroup="AddEditContact"></asp:RequiredFieldValidator>
                <br />
            </p>

            <p class="frm_med_fld">
                <asp:Button ID="btnSave" runat="server" CssClass="btn b_orng_btn" Text="حفظ" ValidationGroup="AddEditContact"
                    OnClick="btnSave_Click" />
            </p>
        </div>
    </form>
</body>
</html>
