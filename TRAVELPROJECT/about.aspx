<%@ Page Title="About Us - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="TRAVELPROJECT.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- CSS Styles -->
    <style>
        /* Guide Card Styling */
        .guide-item {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.4s ease;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            position: relative;
        }

        .guide-img-box {
            position: relative;
            width: 100%;
            height: 320px;
        }

        .guide-img-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        /* Floating Social Icons Overlay */
        .guide-icon-wrapper {
            position: absolute;
            top: 295px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 10;
        }

        .guide-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            background: #ffffff;
            padding: 8px 16px;
            border-radius: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .guide-icon a {
            width: 32px;
            height: 32px;
            margin: 0 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #13357B;
            color: #ffffff;
            border-radius: 50%;
            font-size: 13px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .guide-icon a:hover {
            background: #011233;
            color: #ffffff;
        }

        /* Title Box Details */
        .guide-title {
            padding: 35px 15px 25px 15px;
            text-align: center;
            background-color: #f8f9fa;
            transition: all 0.4s ease;
        }

        .guide-title h4, .guide-title p {
            transition: color 0.4s ease;
        }

        /* --- HOVER EFFECTS --- */
        .guide-item:hover {
            transform: translateY(-5px);
        }

        .guide-item:hover .guide-img-box img {
            transform: scale(1.08);
        }

        .guide-item:hover .guide-title {
            background-color: #13357B !important;
        }

        .guide-item:hover .guide-title h4,
        .guide-item:hover .guide-title p {
            color: #ffffff !important;
        }
    </style>

    <!-- Header Banner Section -->
    <div class="container-fluid bg-breadcrumb py-5 text-center mb-5" style="background: #13357B; color: white;">
        <h1 class="display-4 text-white"><asp:Label ID="lblPageTitle" runat="server" Text="About Us"></asp:Label></h1>
        <p class="text-white-50"><asp:Label ID="lblSubtitle" runat="server" Text="Learn more about Travela Tourism and our travel services."></asp:Label></p>
    </div>

    <!-- Main Content Container -->
    <div class="container py-4">
        
        <!-- About Section -->
        <div class="row g-5 align-items-center mb-5">
            <!-- Left Column: Image -->
            <div class="col-lg-6">
                <asp:Image ID="imgAboutBanner" runat="server" ImageUrl="~/img/destination-1.jpg" CssClass="img-fluid rounded w-100" Style="height: 400px; object-fit: cover;" />
            </div>

            <!-- Right Column: Text Content -->
            <div class="col-lg-6">
                <h5 class="section-about-title text-primary"><asp:Label ID="lblWelcome" runat="server" Text="ABOUT US"></asp:Label></h5>
                <h1 class="mb-4"><asp:Label ID="lblHeading" runat="server" Text="Welcome to Travela Tourism Agency"></asp:Label></h1>
                <p class="mb-4">
                    <asp:Label ID="lblDescription" runat="server" Text="Travela is dedicated to offering the best holiday packages, flight reservations, and local travel guides to make your trips hassle-free and memorable."></asp:Label>
                </p>
                <asp:BulletedList ID="blFeatures" runat="server" CssClass="list-unstyled fw-bold text-dark mb-4">
                    <asp:ListItem>First Class Flights</asp:ListItem>
                    <asp:ListItem>Handpicked Hotels</asp:ListItem>
                    <asp:ListItem>5 Star Accommodations</asp:ListItem>
                    <asp:ListItem>24/7 Dedicated Support</asp:ListItem>
                </asp:BulletedList>
                <asp:Button ID="btnExplore" runat="server" Text="Explore Packages" OnClick="btnExplore_Click" CssClass="btn btn-primary rounded-pill py-3 px-5" />
            </div>
        </div>

        <hr class="my-5" />

        <!-- Guides Section Title -->
        <div class="text-center mb-5">
            <h5 class="text-primary text-uppercase" style="letter-spacing: 2px;">TRAVEL GUIDE</h5>
            <h1 class="mb-0"><asp:Label ID="lblGuideHeading" runat="server" Text="Meet Our Guide"></asp:Label></h1>
        </div>

        <!-- DataList Grid -->
        <asp:DataList ID="dlGuides" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="100%">
            <ItemStyle Width="25%" CssClass="px-2" />
            <ItemTemplate>
                <div class="guide-item">
                    <!-- Image Box -->
                    <div class="guide-img-box">
                        <asp:Image ID="imgGuide" runat="server" ImageUrl='<%# Eval("GuideImage") %>' />
                    </div>

                    <!-- Social Icons Overlay -->
                    <div class="guide-icon-wrapper">
                        <div class="guide-icon">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>

                    <!-- Details Box -->
                    <div class="guide-title">
                        <h4 class="mb-1 text-dark">
                            <asp:Label ID="lblGuideName" runat="server" Text='<%# Eval("GuideName") %>'></asp:Label>
                        </h4>
                        <p class="mb-0 text-muted">
                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

    </div>

</asp:Content>