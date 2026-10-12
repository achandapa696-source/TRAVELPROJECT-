<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TRAVELPROJECT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Travela Tourism</title>

    <style>
        body {
            background-color: #f1f5f9;
        }

        .login-box {
            width: 400px;
            margin: 120px auto;
            background-color: white;
            border: 1px solid #ddd;
            text-align: center;
        }

        .login-header {
            background-color: #1a4086;
            color: white;
            padding: 25px;
        }

        .login-body {
            padding: 30px;
        }

        .txt {
            width: 280px;
            height: 35px;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #193d82;
            color: white;
            padding: 10px 35px;
            border: none;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-box">

            <div class="login-header">

                <asp:Label ID="lblTitle" runat="server"
                    Text="TRAVELA"
                    Font-Size="XX-Large">
                </asp:Label>

                <br />

                <asp:Label ID="lblSubTitle" runat="server"
                    Text="Login Here...">
                </asp:Label>

            </div>

            <div class="login-body">

                <asp:Label ID="lblUsername" runat="server"
                    Text="Username">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtUsername" runat="server"
                    CssClass="txt">
                </asp:TextBox>

                <br />

                <asp:Label ID="lblPassword" runat="server"
                    Text="Password">
                </asp:Label>

                <br />

                <asp:TextBox ID="txtPassword" runat="server"
                    TextMode="Password"
                    CssClass="txt">
                </asp:TextBox>

                <br />

                <asp:Button ID="btnLogin" runat="server"
                    Text="Login"
                    CssClass="btn" />

                <br /><br />

                <asp:Label ID="lblRegister" runat="server"
                    Text="Don't have an account? Register Here">
                </asp:Label>

            </div>

        </div>

    </form>

</body>
</html>--%>
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="TRAVELPROJECT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Login - Travela Tourism</title>

    <style>

        body {
            margin: 0;
            padding: 0;
            background: #f1f5f9;
            font-family: Arial, sans-serif;
        }

        .login-box {
            width: 400px;
            margin: 100px auto;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }

        .login-header {
            background: #193d82;
            color: white;
            padding: 28px;
            text-align: center;
        }

        .login-body {
            padding: 35px;
            text-align: center;
        }

        .label {
            display: block;
            text-align: left;
            font-weight: bold;
            color: #193d82;
            margin-bottom: 7px;
        }

        .txt {
            width: 100%;
            height: 40px;
            margin-bottom: 18px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            padding: 0 10px;
            box-sizing: border-box;
        }

        .txt:focus {
            outline: none;
            border-color: #193d82;
        }

        .btn {
            width: 100%;
            background: #193d82;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #102d65;
        }

        .message {
            display: block;
            margin-top: 18px;
            color: #d00000;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="login-box">

        <div class="login-header">

            <asp:Label
                ID="lblTitle"
                runat="server"
                Text="TRAVELA"
                Font-Size="XX-Large">
            </asp:Label>

            <br />

            <asp:Label
                ID="lblSubTitle"
                runat="server"
                Text="Welcome Back! Login to continue">
            </asp:Label>

        </div>


        <div class="login-body">

            <asp:Label
                ID="lblUsername"
                runat="server"
                Text="Email"
                CssClass="label">
            </asp:Label>

            <asp:TextBox
                ID="txtUsername"
                runat="server"
                CssClass="txt"
                placeholder="Enter your email">
            </asp:TextBox>


            <asp:Label
                ID="lblPassword"
                runat="server"
                Text="Password"
                CssClass="label">
            </asp:Label>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                TextMode="Password"
                CssClass="txt"
                placeholder="Enter your password">
            </asp:TextBox>


            <!-- IMPORTANT: OnClick added -->

            <asp:Button
                ID="btnLogin"
                runat="server"
                Text="Login"
                CssClass="btn"
                OnClick="btnLogin_Click" />


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </div>

</form>

</body>

</html>