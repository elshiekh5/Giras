<%@ Page Language="C#" %>
<%@ Register src="~/AdminCP/_UserControls/Security/login.ascx" tagname="login" tagprefix="uc2" %>
<!DOCTYPE html>

<script runat="server">
protected void Page_Load(object sender, EventArgs e)
    {
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
      new ScriptResourceDefinition
      {
          Path = "~/scripts/jquery-1.7.2.min.js",
          DebugPath = "~/scripts/jquery-1.7.2.min.js",
          CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.min.js",
          CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.4.1.js"
      });

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><%= Resources.AdminText.ControlPanel %></title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="/Layout2/RTL/assets/css/colors.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/loaders/blockui.min.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/forms/validation/validate.min.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/plugins/forms/styling/uniform.min.js"></script>

	<script type="text/javascript" src="/Layout2/RTL/assets/js/core/app.js"></script>
	<script type="text/javascript" src="/Layout2/RTL/assets/js/pages/login_validation.js"></script>
	<!-- /theme JS files -->
</head>
<body class="login-cover">
    
    <form id="form1" runat="server"><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <uc2:login ID="login2" runat="server" />  
   </form>
</body>
</html>