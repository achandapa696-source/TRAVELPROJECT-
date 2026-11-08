<%@ Page Title="Tour Packages - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="TRAVELPROJECT.Packages" %>

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
            padding: 90px 0 60px 0;
            text-align: center;
            color: #ffffff;
            margin-bottom: 0;
        }
        .travela-breadcrumb-header h1 {
            font-size: 52px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 15px 0;
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

        /* 2. PACKAGES SECTION */
        .packages-main-wrap {
            background-color: #f8fafc;
            padding: 70px 0 90px 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }
        .packages-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }

        /* Title with Lines */
        .section-title-wrap {
            text-align: center;
            margin-bottom: 50px;
        }
        .section-tag-lines {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            color: var(--brand-navy);
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .section-tag-lines::before,
        .section-tag-lines::after {
            content: "";
            width: 50px;
            height: 2px;
            background-color: var(--brand-navy);
            display: inline-block;
        }
        .section-main-heading {
            font-size: 42px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0;
        }

        /* 3-Column Responsive Grid */
        .packages-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }
        @media (max-width: 991px) {
            .packages-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 650px) {
            .packages-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Package Card Item (Screenshot Exact Match) */
        .packages-item-box {
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
            transition: all 0.35s ease;
            display: flex;
            flex-direction: column;
        }
        .packages-item-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 14px 30px rgba(19, 53, 123, 0.15);
        }

        /* Image & Info Overlay */
        .packages-img-wrap {
            position: relative;
            height: 240px;
            overflow: hidden;
        }
        .packages-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }
        .packages-item-box:hover .packages-img-wrap img {
            transform: scale(1.08);
        }

        /* Floating Top-Right Price Badge */
        .packages-price-badge {
            position: absolute;
            top: 0;
            right: 35px;
            background: var(--brand-navy);
            color: #ffffff;
            padding: 8px 18px;
            font-weight: 700;
            font-size: 15px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            z-index: 6;
        }

        /* Bottom Image Info Strip */
        .packages-info-strip {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(19, 53, 123, 0.85);
            backdrop-filter: blur(4px);
            display: flex;
            color: #ffffff;
            font-size: 12px;
            font-weight: 600;
            z-index: 5;
        }
        .info-strip-col {
            flex: 1;
            text-align: center;
            padding: 8px 4px;
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        .info-strip-col:last-child {
            border-right: none;
        }

        /* Card Content */
        .packages-content-area {
            padding: 24px 22px 0 22px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .pkg-name-title {
            font-size: 20px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0 0 4px 0;
        }
        .pkg-hotel-deal {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 8px;
            display: block;
        }
        .pkg-stars-row {
            color: var(--brand-navy);
            font-size: 13px;
            margin-bottom: 12px;
        }
        .pkg-desc-text {
            font-size: 13px;
            color: var(--text-muted);
            line-height: 1.6;
            margin: 0 0 20px 0;
        }

        /* Bottom Solid Navy Button Bar */
        .packages-bottom-bar {
            background-color: var(--brand-navy);
            display: flex;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            overflow: hidden;
            margin-top: auto;
        }
        .btn-card-action {
            flex: 1;
            text-align: center;
            color: #ffffff;
            padding: 13px 8px;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s ease;
            display: block;
            border: none;
            background: transparent;
            cursor: pointer;
        }
        .btn-card-action:first-child {
            border-right: 1px solid rgba(255, 255, 255, 0.15);
        }
        .btn-card-action:hover {
            background-color: #0d285e;
            color: #60a5fa;
        }
    </style>

    <div class="travela-breadcrumb-header">
        <h1>Travel Packages</h1>
        <div class="travela-breadcrumb-nav">
            <a href="Home.aspx">Home</a>
            <span>/</span>
            <a href="#">Pages</a>
            <span>/</span>
            <span style="color:#ffffff;">Packages</span>
        </div>
    </div>

    <div class="packages-main-wrap">
        <div class="packages-container">

            <div class="section-title-wrap">
                <div class="section-tag-lines">Packages</div>
                <h2 class="section-main-heading">Awesome Packages</h2>
            </div>

            <asp:DataList ID="dlPackages" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnItemCommand="dlPackages_ItemCommand">
                <HeaderTemplate>
                    <div class="packages-grid">
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="packages-item-box">
                        <div class="packages-img-wrap">
                            <asp:Image ID="imgPkg" runat="server" ImageUrl='<%# Eval("PackageImage") %>' AlternateText='<%# Eval("PackageName") %>' />
                            
                            <div class="packages-price-badge">
                                ₹<%# Eval("Price") %>
                            </div>

                            <div class="packages-info-strip">
                                <div class="info-strip-col">
                                    <i class="fa fa-map-marker-alt"></i> <%# Eval("Location") %>
                                </div>
                                <div class="info-strip-col">
                                    <i class="fa fa-calendar-alt"></i> 5 Days
                                </div>
                                <div class="info-strip-col">
                                    <i class="fa fa-user"></i> 2 Person
                                </div>
                            </div>
                        </div>

                        <div class="packages-content-area">
                            <h3 class="pkg-name-title"><%# Eval("PackageName") %></h3>
                            <span class="pkg-hotel-deal">HOTEL DEALS</span>
                            
                            <div class="pkg-stars-row">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>

                            <p class="pkg-desc-text">
                                Enjoy luxury accommodation, private airport transfers, complimentary buffet breakfast, and guided sightseeing.
                            </p>
                        </div>

                        <div class="packages-bottom-bar">
                            <asp:LinkButton ID="btnReadMore" runat="server" 
                                CommandName="cmd_pkgid" 
                                CommandArgument='<%# Eval("PackageId") %>' 
                                CssClass="btn-card-action">
                                View Details
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnBookNow" runat="server" 
                                CommandName="cmd_book" 
                                CommandArgument='<%# Eval("PackageId") %>' 
                                CssClass="btn-card-action">
                                Book Now
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:DataList>

        </div>
    </div>
</asp:Content>