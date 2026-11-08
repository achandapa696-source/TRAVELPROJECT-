<%@ Page Title="Login - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TRAVELPROJECT.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --brand-navy: #13357B;
            --brand-blue: #0d6efd;
            --border-color: #e2e8f0;
            --text-dark: #1e293b;
            --text-muted: #64748b;
        }

        /* 1. TOP HERO BREADCRUMB BANNER */
        .travela-breadcrumb-header {
            position: relative;
            background: linear-gradient(rgba(19, 53, 123, 0.65), rgba(19, 53, 123, 0.65)), url('img/breadcrumb-bg.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding: 85px 0 55px 0;
            text-align: center;
            color: #ffffff;
            margin-bottom: 0;
        }
        .travela-breadcrumb-header h1 {
            font-size: 50px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 12px 0;
            letter-spacing: -0.5px;
        }
        .travela-breadcrumb-nav {
            display: inline-flex;
            gap: 10px;
            font-size: 15px;
            color: rgba(255, 255, 255, 0.85);
            font-weight: 500;
        }
        .travela-breadcrumb-nav a {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.2s;
        }
        .travela-breadcrumb-nav a:hover {
            color: #0d6efd;
        }
        .travela-breadcrumb-nav span {
            color: rgba(255, 255, 255, 0.5);
        }

        /* 2. LOGIN CARD CONTAINER */
        .login-main-section {
            background-color: #f8fafc;
            padding: 60px 20px 90px 20px;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }
        .login-card-box {
            max-width: 460px;
            margin: 0 auto;
            background: #ffffff;
            border: 1.5px solid var(--border-color);
            border-radius: 20px;
            padding: 40px 35px;
            box-shadow: 0 10px 30px rgba(19, 53, 123, 0.08);
            text-align: left;
        }

        .login-header-text {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-icon-avatar {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #eff6ff;
            color: var(--brand-navy);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 16px auto;
            border: 2px solid #bfdbfe;
        }
        .login-header-text h2 {
            font-size: 28px;
            font-weight: 800;
            color: var(--brand-navy);
            margin: 0 0 6px 0;
        }
        .login-header-text p {
            font-size: 14px;
            color: var(--text-muted);
            margin: 0;
        }

        /* Form Group & Controls */
        .form-ctrl-group {
            margin-bottom: 20px;
        }
        .form-ctrl-label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 6px;
        }
        .input-with-icon {
            position: relative;
        }
        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            font-size: 15px;
        }
        .custom-asp-input {
            width: 100%;
            height: 48px;
            border: 1.5px solid var(--border-color);
            border-radius: 10px;
            padding: 0 16px 0 42px;
            font-size: 14px;
            color: var(--text-dark);
            outline: none;
            box-sizing: border-box;
            transition: all 0.2s ease;
            background-color: #ffffff;
        }
        .custom-asp-input:focus {
            border-color: var(--brand-navy);
            box-shadow: 0 0 0 3px rgba(19, 53, 123, 0.12);
        }

        /* Options Row: Remember Me & Forgot Pass */
        .login-options-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            margin-bottom: 24px;
            color: var(--text-muted);
        }
        .login-options-row a {
            color: var(--brand-blue);
            text-decoration: none;
            font-weight: 600;
        }
        .login-options-row a:hover {
            text-decoration: underline;
        }

        /* Pure ASP.NET Button */
        .btn-asp-login {
            width: 100%;
            height: 50px;
            background: linear-gradient(135deg, #13357B 0%, #0d6efd 100%);
            color: #ffffff;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(19, 53, 123, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .btn-asp-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(19, 53, 123, 0.4);
            background: linear-gradient(135deg, #0b2252 0%, #0b5ed7 100%);
        }

        /* Bottom Register Link */
        .login-bottom-text {
            text-align: center;
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px dashed var(--border-color);
            font-size: 14px;
            color: var(--text-muted);
        }
        .login-bottom-text a {
            color: var(--brand-navy);
            font-weight: 700;
            text-decoration: none;
        }
        .login-bottom-text a:hover {
            color: var(--brand-blue);
            text-decoration: underline;
        }

        /* Alert Box */
        .login-alert-box {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 20px;
            display: block;
        }
    </style>

    <!-- 1. Top Hero Breadcrumb Banner -->
    <div class="travela-breadcrumb-header">
        <h1>Login</h1>
        <div class="travela-breadcrumb-nav">
            <a href="Home.aspx">Home</a>
            <span>/</span>
            <a href="#">Pages</a>
            <span>/</span>
            <span style="color:#ffffff;">Login</span>
        </div>
    </div>

    <!-- 2. Main Login Form Section -->
    <div class="login-main-section">
        <div class="login-card-box">
            
            <div class="login-header-text">
                <div class="login-icon-avatar">
                    <i class="fa fa-user-lock"></i>
                </div>
                <h2>Welcome Back!</h2>
                <p>Login to access your bookings and travel dashboard.</p>
            </div>

            <!-- Error Message Label -->
            <asp:Label ID="lblMsg" runat="server" CssClass="login-alert-box" Visible="false"></asp:Label>

            <!-- Email Input -->
            <div class="form-ctrl-group">
                <label class="form-ctrl-label">Email Address *</label>
                <div class="input-with-icon">
                    <i class="fa fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="custom-asp-input" placeholder="Enter your Email Address"></asp:TextBox>
                </div>
            </div>

            <!-- Password Input -->
            <div class="form-ctrl-group">
                <label class="form-ctrl-label">Password *</label>
                <div class="input-with-icon">
                    <i class="fa fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="custom-asp-input" placeholder="Enter your password"></asp:TextBox>
                </div>
            </div>

            <!-- Options: Remember & Forgot -->
            <div class="login-options-row">
                <label style="cursor: pointer; display: flex; align-items: center; gap: 6px;">
                    <asp:CheckBox ID="chkRemember" runat="server" /> Remember me
                </label>
                <a href="#">Forgot Password?</a>
            </div>

            <!-- Pure ASP.NET Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login Now" CssClass="btn-asp-login" OnClick="btnLogin_Click" />

            <!-- Register Link -->
            <div class="login-bottom-text">
                Don't have an account? <a href="registration.aspx">Register Here</a>
            </div>

        </div>
    </div>
</asp:Content>