<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="UserControls_login" %>
<div class="page-container login-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Content area -->
				<div class="content">

					<!-- Form with validation -->
					<div class="form-validate">
						<div class="panel panel-body login-form">
							<div class="text-center">
								<div class="icon-object border-slate-300 text-slate-300"><i class="icon-reading"></i></div>
								<h5 class="content-group">Login to your account <small class="display-block">Your credentials</small></h5>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<%--<input type="text" class=""  name="username" required="required">--%>
                                <asp:TextBox ID="txtUserName" placeholder="Username" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtUserName"
                        ForeColor="White" ValidationGroup="Login">*</asp:RequiredFieldValidator>
								<div class="form-control-feedback">
									<i class="icon-user text-muted"></i>
								</div>
							</div>

							<div class="form-group has-feedback has-feedback-left">
								<%--<input type="text" class=""  name="password" required="required">--%>
                                <asp:TextBox ID="txtPassword" placeholder="Password" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword"
                        ForeColor="White" ValidationGroup="Login">*</asp:RequiredFieldValidator>
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
							</div>

							<%--<div class="form-group login-options">
								<div class="row">
									<div class="col-sm-6">
										<label class="checkbox-inline">
											<input type="checkbox" class="styled" checked="checked">
											Remember
										</label>
									</div>

									<div class="col-sm-6 text-right">
										<a href="login_password_recover.html">Forgot password?</a>
									</div>
								</div>
							</div>--%>

							<div class="form-group">
								<%--<button runat="server" id="btnLogin" type="submit" class=""> </button>--%>
                                 <asp:Button ID="btnLogin" runat="server" CssClass="btn bg-blue btn-block" ValidationGroup="Login"
                        OnClick="btnLogin_Click" Text="Login" />
                                <asp:Literal ID="ltrFailureText" runat="server" EnableViewState="False"></asp:Literal>
							</div>

							
						</div>
					</div>
					<!-- /form with validation -->


					<%--<!-- Footer -->
					<div class="footer text-white">
						&copy; 2015. <a href="#" class="text-white">Limitless Web App Kit</a> by <a href="http://themeforest.net/user/Kopyov" class="text-white" target="_blank">Eugene Kopyov</a>
					</div>--%>
					<!-- /footer -->

				</div>
				<!-- /content area -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>



 
<%-- <b><%= Resources.AdminText.Welcome %></b><br />
                <%= Resources.AdminText.LoginBox_Note%>--%>


