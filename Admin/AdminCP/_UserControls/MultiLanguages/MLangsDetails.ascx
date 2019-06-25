<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MLangsDetails.ascx.cs"
    Inherits="UserControls_MLangsDetails" %>
 
    
<%@ Register Src="Details.ascx" TagName="Details" TagPrefix="uc1" %>
<script type="text/javascript">
function GetTabStyle(tab,tabContent,langID)
{
    var DefaultLanguageID = <%= (int)(Languages)SiteSettings.Languages_DefaultLanguageID  %> ;
    if (DefaultLanguageID == langID)
        {
            document.getElementById(tab).className="tabActive";
             document.getElementById(tabContent).style.display = 'block';
        }
        else
        {
            document.getElementById(tab).className="tab";
             document.getElementById(tabContent).style.display = 'none';
        }
}
 //----------------------------------------------
     function SwitchTabs(type) {
         if (type == 'ar') {
             document.getElementById("tabArabic").style.display = 'block';
             document.getElementById("tabEnglish").style.display = 'none';
             document.getElementById("<%= tbArabic.ClientID %>").className = "tabActive";
             document.getElementById("<%= tbEnglish.ClientID %>").className = "tab";
             currentLang = ar;
         }
         else {
             document.getElementById("tabArabic").style.display = 'none';
             document.getElementById("tabEnglish").style.display = 'block';
             document.getElementById("<%= tbArabic.ClientID %>").className = "tab";
             document.getElementById("<%= tbEnglish.ClientID %>").className = "tabActive";
             currentLang = en;
         }
     }
</script>

            

			
<% if (ViewTaps)
   { %>
    <ul class="nav nav-tabs" id="myTab">
			  <li class="active" runat="server" id="tbArabic"><a data-target="#Arabic" data-toggle="tab">عربي</a></li>
			  <li runat="server" id="tbEnglish"><a data-target="#English" data-toggle="tab" >English</a></li>
			</ul>
<% } %>


     <div class="tab-content">
			  <div class="tab-pane active" id="Arabic">
                  <%-- <% if (ViewTaps)
                            { %>
                            <div class="SubHeader2"><%= Resources.AdminText.LanguageDetails1 %></div>
                            <% } %>--%>
                  <uc1:Details ID="ucArDetails" Lang="Ar" runat="server" />


			  </div>
			  <div class="tab-pane" id="English">

                 <%--  <% if (ViewTaps)
                            { %>
                            <div class="SubHeader2"><%= Resources.AdminText.LanguageDetails2 %></div>
                            <% } %>--%>
                            <uc1:Details  ID="ucEnDetails" Lang="En" runat="server" />
			  </div>
			</div>


                     
