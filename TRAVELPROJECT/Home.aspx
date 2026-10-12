<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TRAVELPROJECT.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        /* 1. Hero Banner */
        .hero-banner-blue {
            background: linear-gradient(rgba(19, 53, 123, 0.65), rgba(11, 37, 69, 0.8)), url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=1600&auto=format&fit=crop') center/cover no-repeat;
            padding: 80px 20px 95px 20px;
            text-align: center;
            color: #ffffff;
            border-radius: 0 0 16px 16px;
        }

        /* 2. Floating Search Box */
        .search-float-wrap {
            max-width: 1050px;
            margin: -45px auto 40px auto;
            padding: 0 20px;
            position: relative;
            z-index: 10;
        }

        .search-box-card {
            background: #ffffff;
            border-radius: 14px;
            padding: 20px 25px;
            box-shadow: 0 12px 30px rgba(19, 53, 123, 0.12);
            border: 1px solid #e2e8f0;
            display: grid;
            grid-template-columns: 1.5fr 1fr 1fr 1fr 1.2fr;
            gap: 15px;
            align-items: center;
        }

        .search-item label {
            display: block;
            font-size: 12px;
            font-weight: 700;
            color: #13357B;
            margin-bottom: 5px;
        }

        .input-ctrl {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            font-size: 13.5px;
            outline: none;
            background-color: #f8fafc;
        }

        .btn-search-act {
            background: #13357B;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: 700;
            font-size: 14px;
            cursor: pointer;
            width: 100%;
            transition: background 0.2s;
        }

        .btn-search-act:hover {
            background: #0b2545;
        }

        /* 3. Tour Cards (4 Columns) */
        .tour-wrap {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .card-box {
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            position: relative;
            margin: 10px;
            text-align: left;
        }

        .card-box:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 28px rgba(19, 53, 123, 0.16);
            border-color: #13357B;
        }

        .card-img-holder {
            position: relative;
            height: 160px;
            overflow: hidden;
        }

        .card-img-holder img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .card-box:hover .card-img-holder img {
            transform: scale(1.04);
        }

        .loc-pill {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #13357B;
            color: #ffffff;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 700;
        }

        .card-details {
            padding: 14px 16px;
        }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #0b2545;
            margin-bottom: 5px;
            display: block;
        }

        .card-days {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 12px;
            display: block;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 10px;
            border-top: 1px solid #f1f5f9;
        }

        .card-price-txt {
            font-size: 18px;
            font-weight: 800;
            color: #13357B;
        }

        .btn-view-link {
            background: #13357B;
            color: #ffffff !important;
            padding: 7px 15px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-view-link:hover {
            background: #0b2545;
        }
    </style>

    <!-- 1. Hero Banner Section -->
    <div class="hero-banner-blue">
        <div style="font-size: 13px; font-weight: 700; letter-spacing: 2px; text-transform: uppercase; margin-bottom: 8px;">WELCOME TO TRAVELA</div>
        <h1 style="font-size: 44px; font-weight: 800; margin-bottom: 12px;">Explore The World</h1>
        <p style="font-size: 16px; opacity: 0.95;">Discover amazing destinations and create unforgettable memories with Travela.</p>
    </div>

    <!-- 2. Floating Search Bar (ASP.NET Controls) -->
    <div class="search-float-wrap">
        <div class="search-box-card">
            <div class="search-item">
                <label>📍 Destination</label>
                <asp:TextBox ID="txtDest" runat="server" CssClass="input-ctrl" placeholder="Where do you want to go?"></asp:TextBox>
            </div>
            <div class="search-item">
                <label>📅 Check In</label>
                <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" CssClass="input-ctrl"></asp:TextBox>
            </div>
            <div class="search-item">
                <label>📅 Check Out</label>
                <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" CssClass="input-ctrl"></asp:TextBox>
            </div>
            <div class="search-item">
                <label>🏙️ City</label>
                <asp:DropDownList ID="ddlCities" runat="server" CssClass="input-ctrl">
                    <asp:ListItem Value="-1">All Cities</asp:ListItem>
                    <asp:ListItem Value="Paris">Paris</asp:ListItem>
                    <asp:ListItem Value="Bali">Bali</asp:ListItem>
                    <asp:ListItem Value="Dubai">Dubai</asp:ListItem>
                    <asp:ListItem Value="London">London</asp:ListItem>
                    <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                    <asp:ListItem Value="Maldives">Maldives</asp:ListItem>
                    <asp:ListItem Value="Singapore">Singapore</asp:ListItem>
                    <asp:ListItem Value="New York">New York</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="search-item" style="margin-top: 18px;">
                <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" OnClick="btnSearch_Click" CssClass="btn-search-act" />
            </div>
        </div>
    </div>

    <!-- 3. Popular Tour Packages (DataList) -->
    <div class="tour-wrap">
        <div style="display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 20px;">
            <div>
                <span style="font-size: 13px; font-weight: 700; color: #13357B; text-transform: uppercase; letter-spacing: 1px;">FEATURED PACKAGES</span>
                <h2 style="font-size: 28px; font-weight: 800; color: #0b2545; margin-top: 4px;">Popular Tour Packages</h2>
            </div>
            <asp:LinkButton ID="lnkViewAll" runat="server" ForeColor="#13357B" Font-Bold="True" Font-Size="14px" OnClick="lnkViewAll_Click">View All Packages →</asp:LinkButton>
        </div>

        <!-- Pure ASP.NET DataList with OnItemCommand -->
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="card-box">
                    <div class="card-img-holder">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PackageImage") %>' />
                        <span class="loc-pill">📍 <%# Eval("Location") %></span>
                    </div>
                    <div class="card-details">
                        <asp:Label ID="Label1" runat="server" CssClass="card-title" Text='<%# Eval("PackageName") %>'></asp:Label>
                        <span class="card-days">⏱️ 5 Days / 4 Nights</span>
                        
                        <div class="card-footer">
                            <span class="card-price-txt">₹<%# Eval("Price") %></span>
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-view-link" CommandName="cmd_pkgid" CommandArgument='<%# Eval("PackageId") %>' Text="View Details"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>