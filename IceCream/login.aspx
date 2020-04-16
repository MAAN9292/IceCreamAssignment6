<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
     <!-- Styles -->
    <link href="admin/assets/css/lib/font-awesome.min.css" rel="stylesheet"/>
    <link href="admin/assets/css/lib/themify-icons.css" rel="stylesheet"/>
    <link href="admin/assets/css/lib/bootstrap.min.css" rel="stylesheet"/>
    <link href="admin/assets/css/lib/helper.css" rel="stylesheet"/>
    <link href="admin/assets/css/style.css" rel="stylesheet"/>
</head>
<body class="bg-warning-dark">
    <form id="form1" runat="server">
     <div class="unix-login">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="login-content">
                        
                        <div class="login-logo">
                            <a href="index.html"><span>ICE CREAM PARLOUR</span></a>
                        </div>
                        <div class="login-form">
                            <h4>Login</h4>
                            <div>
                                <div class="form-group">
                                    <label>Username</label>
                                    <asp:TextBox ID="txtUserName" placeholder="Username" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPswd" placeholder="Password" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                               
                                <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-flat m-b-30 m-t-30" runat="server" Text="Sign In" OnClick="btnLogin_Click" />
                              <br />
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
