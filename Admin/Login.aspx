<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl" xml:lang="pl">
<head runat="server">
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="author" content="Paweł 'kilab' Balicki - kilab.pl" />
<title>AdminCP Login</title>
<link rel="stylesheet" type="text/css" href="css/login.css" media="screen" />
</head>
<body>

<div class="wrap">
	<div id="content">
		<div id="main">
			<div class="full_w">
				<form id="form1" runat="server">
                
					<label for="login">Email:</label>
                    <asp:TextBox ID="txtEmail" class="text" runat="server" Font-Size="Small" 
                        Height="20px" ></asp:TextBox>
					<label for="pass">Password:</label>
					<asp:TextBox ID="txtPass" class="text" runat="server" Font-Size="Small" 
                        Height="20px" TextMode="Password" ></asp:TextBox>

                    <asp:Label ID="lblMsg" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
					<div class="sep"></div>
                    
					<asp:Button ID="btnOK" class="ok" runat="server" Text="Login" Height="29px" 
                        onclick="btnOK_Click" Width="80px" Font-Bold="True" /> <a class="button" href="">Forgotten password?</a>
				</form>
			</div>
			<div class="footer">&raquo; <a href="">Thế Giới Di Động</a> | Admin Panel</div>
		</div>
	</div>
</div>

</body>
</html>

