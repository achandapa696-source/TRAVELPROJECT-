<%@ Page Title="My Dashboard - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyDashboard.aspx.cs" Inherits="TRAVELPROJECT.MyDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --brand-navy: #13357B;
            --brand-blue: #0d6efd;
            --brand-light: #f8fafc;
            --border-color: #e2e8f0;
            --text-dark: #1e293b;
            --text-muted: #64748b;
        }

        .dash-container {
            max-width: 1220px;
            margin: 30px auto 70px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            color: var(--text-dark);
        }

        /* Top Welcome Header Banner */
        .dash-header-banner {
            background: linear-gradient(135deg, #13357B 0%, #1e40af 55%, #0d6efd 100%);
            border-radius: 20px;
            padding: 35px 30px;
            color: #ffffff;
            box-shadow: 0 10px 30px rgba(19, 53, 123, 0.2);
            margin-bottom: 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        .dash-welcome-text h1 {
            font-size: 32px;
            font-weight: 800;
            margin: 0 0 8px 0;
        }
        .dash-welcome-text p {
            margin: 0;
            color: #e0e7ff;
            font-size: 15px;
        }
        .btn-dash-logout {
            background: rgba(255, 255, 255, 0.18);
            border: 1px solid rgba(255, 255, 255, 0.35);
            color: #ffffff;
            padding: 10px 24px;
            border-radius: 25px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s;
            cursor: pointer;
        }
        .btn-dash-logout:hover {
            background: #ffffff;
            color: #dc2626;
        }

        /* Main 2-Column Layout (Sidebar + Tab Contents) */
        .dash-layout-grid {
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 30px;
            align-items: start;
        }
        @media (max-width: 900px) {
            .dash-layout-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Left Sidebar Menu Card */
        .dash-sidebar-card {
            background: #ffffff;
            border: 1.5px solid var(--border-color);
            border-radius: 18px;
            padding: 24px 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
        }
        .user-mini-badge {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border-color);
            margin-bottom: 16px;
        }
        .user-avatar-circle {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: var(--brand-navy);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin: 0 auto 10px auto;
        }
        .user-mini-badge h4 {
            margin: 0 0 4px 0;
            font-size: 17px;
            font-weight: 800;
            color: var(--brand-navy);
        }
        .user-mini-badge span {
            font-size: 12px;
            color: var(--text-muted);
        }

        /* Sidebar Navigation Pills */
        .dash-menu-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .dash-menu-btn {
            width: 100%;
            text-align: left;
            background: transparent;
            border: none;
            border-radius: 10px;
            padding: 12px 16px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
            cursor: pointer;
            transition: all 0.2s;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .dash-menu-btn i {
            width: 22px;
            color: var(--brand-navy);
            font-size: 16px;
        }
        .dash-menu-btn:hover {
            background-color: #f1f5f9;
            color: var(--brand-navy);
        }
        .dash-menu-btn.active {
            background-color: var(--brand-navy);
            color: #ffffff;
        }
        .dash-menu-btn.active i {
            color: #ffffff;
        }
        .badge-pill-count {
            background: #ef4444;
            color: #ffffff;
            font-size: 11px;
            font-weight: 800;
            padding: 2px 8px;
            border-radius: 20px;
        }

        /* Right Content Panels */
        .dash-tab-panel {
            display: none;
            background: #ffffff;
            border: 1.5px solid var(--border-color);
            border-radius: 18px;
            padding: 32px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
        }
        .dash-tab-panel.active {
            display: block;
        }
        .panel-headline {
            font-size: 22px;
            font-weight: 800;
            color: var(--brand-navy);
            margin: 0 0 20px 0;
            display: flex;
            align-items: center;
            gap: 10px;
            padding-bottom: 14px;
            border-bottom: 1px solid var(--border-color);
        }

        /* Table & Lists */
        .custom-grid-table {
            width: 100%;
            border-collapse: collapse;
        }
        .custom-grid-table th {
            background-color: #f8fafc;
            color: var(--brand-navy);
            padding: 12px 14px;
            font-size: 13px;
            font-weight: 700;
            border-bottom: 2px solid var(--border-color);
            text-align: left;
        }
        .custom-grid-table td {
            padding: 14px;
            font-size: 13px;
            border-bottom: 1px solid var(--border-color);
        }
        .status-badge-confirmed {
            background: #dcfce7;
            color: #16a34a;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 700;
        }

        /* Inbox Items */
        .inbox-msg-item {
            padding: 18px;
            border: 1px solid var(--border-color);
            border-radius: 12px;
            margin-bottom: 14px;
            background-color: #f8fafc;
            transition: all 0.2s;
        }
        .inbox-msg-item:hover {
            border-color: var(--brand-blue);
            background-color: #ffffff;
        }
        .inbox-head {
            display: flex;
            justify-content: space-between;
            margin-bottom: 6px;
        }
        .inbox-sender {
            font-weight: 700;
            color: var(--brand-navy);
            font-size: 14px;
        }
        .inbox-time {
            font-size: 12px;
            color: var(--text-muted);
        }

        /* Notification Items */
        .notif-card-item {
            display: flex;
            align-items: flex-start;
            gap: 16px;
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
        }
        .notif-card-item:last-child {
            border-bottom: none;
        }
        .notif-icon-circle {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #eff6ff;
            color: var(--brand-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }

        /* Settings Form */
        .form-row-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 18px;
        }
        .dash-input-ctrl {
            width: 100%;
            height: 46px;
            border: 1.5px solid var(--border-color);
            border-radius: 8px;
            padding: 0 14px;
            font-size: 14px;
            outline: none;
            box-sizing: border-box;
        }
        .dash-input-ctrl:focus {
            border-color: var(--brand-navy);
        }
        .btn-dash-save {
            background-color: var(--brand-navy);
            color: #ffffff;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }
        .btn-dash-save:hover {
            background-color: #0b2252;
        }
    </style>

    <div class="dash-container">

        <!-- Top Header Welcome Banner -->
        <div class="dash-header-banner">
            <div class="dash-welcome-text">
                <h1>Welcome, <asp:Label ID="lblBannerName" runat="server" Text="Traveler"></asp:Label>!</h1>
                <p>Manage your account profile, holiday bookings, messages, and settings.</p>
            </div>
            <a href="logout.aspx" class="btn-dash-logout"><i class="fa fa-power-off me-1"></i> Log Out</a>
        </div>

        <!-- Main 2-Column Grid -->
        <div class="dash-layout-grid">

            <!-- Left Sidebar Navigation -->
            <div class="dash-sidebar-card">
                <div class="user-mini-badge">
                    <div class="user-avatar-circle"><i class="fa fa-user"></i></div>
                    <h4><asp:Label ID="lblSideName" runat="server" Text="User"></asp:Label></h4>
                    <span><asp:Label ID="lblSideEmail" runat="server" Text="user@example.com"></asp:Label></span>
                </div>

                <ul class="dash-menu-list">
                    <li>
                        <button type="button" class="dash-menu-btn active" id="btnTabProfile" onclick="switchDashboardTab('tabProfile', this)">
                            <span><i class="fa fa-user me-2"></i> My Profile</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" class="dash-menu-btn" id="btnTabInbox" onclick="switchDashboardTab('tabInbox', this)">
                            <span><i class="fa fa-comment-dots me-2"></i> Inbox</span>
                            <span class="badge-pill-count">2</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" class="dash-menu-btn" id="btnTabNotif" onclick="switchDashboardTab('tabNotif', this)">
                            <span><i class="fa fa-bell me-2"></i> Notifications</span>
                            <span class="badge-pill-count">3</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" class="dash-menu-btn" id="btnTabSettings" onclick="switchDashboardTab('tabSettings', this)">
                            <span><i class="fa fa-cog me-2"></i> Account Settings</span>
                        </button>
                    </li>
                    <li>
                        <a href="logout.aspx" class="dash-menu-btn text-danger">
                            <span><i class="fa fa-power-off me-2 text-danger"></i> Log Out</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Right Content Panels -->
            <div class="dash-content-area">

                <!-- 1. TAB: MY PROFILE & BOOKINGS (Active by default) -->
                <div id="tabProfile" class="dash-tab-panel active">
                    <h2 class="panel-headline"><i class="fa fa-user text-primary"></i> My Profile & Tour Bookings</h2>

                    <!-- Profile Details -->
                    <div style="background:#f8fafc; border-radius:12px; padding:20px; margin-bottom:25px; border:1px solid #e2e8f0;">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <span style="font-size:12px; color:#64748b; font-weight:700; text-transform:uppercase;">Full Name:</span>
                                <h5 style="margin:2px 0 0 0; color:#13357B; font-weight:700;"><asp:Label ID="lblProfileName" runat="server" Text="Traveler Name"></asp:Label></h5>
                            </div>
                            <div class="col-md-6">
                                <span style="font-size:12px; color:#64748b; font-weight:700; text-transform:uppercase;">Registered Email:</span>
                                <h5 style="margin:2px 0 0 0; color:#13357B; font-weight:700;"><asp:Label ID="lblProfileEmail" runat="server" Text="email@example.com"></asp:Label></h5>
                            </div>
                        </div>
                    </div>

                    <!-- Bookings History Table -->
                    <h4 style="font-size:18px; font-weight:800; color:#13357B; margin:0 0 15px 0;">
                        <i class="fa fa-suitcase-rolling me-1"></i> Booked Packages
                    </h4>
                    <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="custom-grid-table" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="PackageName" HeaderText="Package" />
                            <asp:BoundField DataField="TravelDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="Travelers" HeaderText="Travelers" />
                            <asp:TemplateField HeaderText="Total Price">
                                <ItemTemplate>
                                    <strong style="color:#13357B;">₹<%# Eval("TotalPrice") %></strong>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class="status-badge-confirmed">Confirmed</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="text-align:center; padding: 30px; color:#64748b;">
                                <i class="fa fa-suitcase-rolling" style="font-size:36px; margin-bottom:10px; display:block; color:#cbd5e1;"></i>
                                No tour bookings yet. <a href="Packages.aspx" style="color:#0d6efd; font-weight:700;">Explore our packages!</a>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <!-- 2. TAB: INBOX -->
                <div id="tabInbox" class="dash-tab-panel">
                    <h2 class="panel-headline"><i class="fa fa-comment-dots text-primary"></i> Support Inbox</h2>

                    <div class="inbox-msg-item">
                        <div class="inbox-head">
                            <span class="inbox-sender"><i class="fa fa-shield-alt text-primary me-1"></i> Travela Support Team</span>
                            <span class="inbox-time">Today, 10:30 AM</span>
                        </div>
                        <h6 style="margin:0 0 6px 0; font-weight:700; color:#1e293b;">Booking Confirmation & Welcome Kit</h6>
                        <p style="margin:0; font-size:13px; color:#64748b;">
                            Welcome to Travela! Your vacation booking is confirmed. Your tour manager will contact you 24 hours prior to travel.
                        </p>
                    </div>

                    <div class="inbox-msg-item">
                        <div class="inbox-head">
                            <span class="inbox-sender"><i class="fa fa-tag text-primary me-1"></i> Travela Offers</span>
                            <span class="inbox-time">Yesterday, 04:15 PM</span>
                        </div>
                        <h6 style="margin:0 0 6px 0; font-weight:700; color:#1e293b;">Flat ₹5,000 Off on Bali Packages</h6>
                        <p style="margin:0; font-size:13px; color:#64748b;">
                            Use coupon code <strong>BALI5000</strong> during your next holiday reservation to claim exclusive member discounts.
                        </p>
                    </div>
                </div>

                <!-- 3. TAB: NOTIFICATIONS -->
                <div id="tabNotif" class="dash-tab-panel">
                    <h2 class="panel-headline"><i class="fa fa-bell text-primary"></i> Notifications</h2>

                    <div class="notif-card-item">
                        <div class="notif-icon-circle"><i class="fa fa-check-circle text-success"></i></div>
                        <div>
                            <h6 style="margin:0 0 4px 0; font-weight:700; color:#1e293b;">Account Registered Successfully</h6>
                            <p style="margin:0; font-size:13px; color:#64748b;">Your Travela account is fully verified. Enjoy browsing handpicked packages.</p>
                        </div>
                    </div>

                    <div class="notif-card-item">
                        <div class="notif-icon-circle"><i class="fa fa-plane-departure text-primary"></i></div>
                        <div>
                            <h6 style="margin:0 0 4px 0; font-weight:700; color:#1e293b;">Itinerary Ready for Download</h6>
                            <p style="margin:0; font-size:13px; color:#64748b;">Your Day-by-Day travel itinerary PDF is now ready in your booking details.</p>
                        </div>
                    </div>

                    <div class="notif-card-item">
                        <div class="notif-icon-circle"><i class="fa fa-percentage text-warning"></i></div>
                        <div>
                            <h6 style="margin:0 0 4px 0; font-weight:700; color:#1e293b;">Summer Holiday Flash Sale</h6>
                            <p style="margin:0; font-size:13px; color:#64748b;">Limited period discounts on Europe & Dubai trips ending this Sunday!</p>
                        </div>
                    </div>
                </div>

                <!-- 4. TAB: ACCOUNT SETTINGS -->
                <div id="tabSettings" class="dash-tab-panel">
                    <h2 class="panel-headline"><i class="fa fa-cog text-primary"></i> Account Settings</h2>

                    <asp:Label ID="lblSettingsMsg" runat="server" Visible="false" CssClass="alert alert-success d-block mb-3"></asp:Label>

                    <div class="form-row-2">
                        <div>
                            <label style="font-size:13px; font-weight:700; margin-bottom:6px; display:block;">Your Full Name</label>
                            <asp:TextBox ID="txtSettingsName" runat="server" CssClass="dash-input-ctrl"></asp:TextBox>
                        </div>
                        <div>
                            <label style="font-size:13px; font-weight:700; margin-bottom:6px; display:block;">Phone / Mobile</label>
                            <asp:TextBox ID="txtSettingsPhone" runat="server" CssClass="dash-input-ctrl" placeholder="+91 9876543210"></asp:TextBox>
                        </div>
                    </div>

                    <h5 style="font-size:16px; font-weight:800; color:#13357B; margin:25px 0 15px 0;">Change Password</h5>
                    <div class="form-row-2">
                        <div>
                            <label style="font-size:13px; font-weight:700; margin-bottom:6px; display:block;">New Password</label>
                            <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="dash-input-ctrl" placeholder="••••••••"></asp:TextBox>
                        </div>
                        <div>
                            <label style="font-size:13px; font-weight:700; margin-bottom:6px; display:block;">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" CssClass="dash-input-ctrl" placeholder="••••••••"></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="btnSaveSettings" runat="server" Text="Save Changes" CssClass="btn-dash-save" OnClick="btnSaveSettings_Click" />
                </div>

            </div>

        </div>

    </div>

    <!-- JavaScript For Hash/URL Based Tab Switching -->
    <script type="text/javascript">
        function switchDashboardTab(tabId, btnElem) {
            // Hide all tab panels
            var panels = document.querySelectorAll('.dash-tab-panel');
            panels.forEach(function (p) { p.classList.remove('active'); });

            // Remove active from all sidebar buttons
            var buttons = document.querySelectorAll('.dash-menu-btn');
            buttons.forEach(function (b) { b.classList.remove('active'); });

            // Show selected panel & activate button
            var selectedPanel = document.getElementById(tabId);
            if (selectedPanel) selectedPanel.classList.add('active');
            if (btnElem) btnElem.classList.add('active');
        }

        // Handle URL Hash (When clicked from top dropdown)
        window.addEventListener('load', function () {
            var hash = window.location.hash.toLowerCase();
            if (hash === '#inbox') {
                switchDashboardTab('tabInbox', document.getElementById('btnTabInbox'));
            } else if (hash === '#notifications') {
                switchDashboardTab('tabNotif', document.getElementById('btnTabNotif'));
            } else if (hash === '#settings') {
                switchDashboardTab('tabSettings', document.getElementById('btnTabSettings'));
            } else {
                switchDashboardTab('tabProfile', document.getElementById('btnTabProfile'));
            }
        });
    </script>
</asp:Content>