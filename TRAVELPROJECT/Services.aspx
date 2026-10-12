<%@ Page Title="Services - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="TRAVELPROJECT.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- CSS Styles -->
    <style>
        .service-content-inner {
            background: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.08);
            transition: all 0.4s ease;
            text-align: center;
            height: 100%;
        }

        .service-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px auto;
            border-radius: 50%;
            background: #13357B;
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            transition: all 0.4s ease;
        }

        .service-content-inner:hover {
            background: #13357B;
            transform: translateY(-8px);
        }

        .service-content-inner:hover .service-icon {
            background: #ffffff;
            color: #13357B;
        }

        .service-content-inner:hover .h5,
        .service-content-inner:hover .text-muted {
            color: #ffffff !important;
        }
    </style>

    <!-- Header Banner Section -->
    <asp:Panel ID="pnlHeader" runat="server" CssClass="container-fluid py-5 text-center mb-5" style="background: #13357B; color: white;">
        <asp:Label ID="lblPageTitle" runat="server" Text="Our Services" CssClass="display-4 text-white d-block fw-bold"></asp:Label>
        <asp:Label ID="lblSubtitle" runat="server" Text="Explore top-notch travel services provided by Travela." CssClass="text-white-50 d-block mt-2"></asp:Label>
    </asp:Panel>

    <!-- Main Content Section -->
    <asp:Panel ID="pnlMain" runat="server" CssClass="container py-4 mb-5">
        
        <!-- Section Heading -->
        <asp:Panel ID="pnlTitleBox" runat="server" CssClass="text-center mb-5">
            <asp:Label ID="lblCategory" runat="server" Text="OUR SERVICES" CssClass="text-primary text-uppercase d-block fw-bold" style="letter-spacing: 2px;"></asp:Label>
            <asp:Label ID="lblMainHeading" runat="server" Text="World Class Travel Services" CssClass="h1 mb-0 text-dark d-block fw-bold"></asp:Label>
        </asp:Panel>

        <!-- Services Grid with Pure ASP.NET Panels and Labels -->
        <asp:Panel ID="pnlGrid" runat="server" CssClass="row g-4">
            
            <!-- Service 1 -->
            <asp:Panel ID="pnlCol1" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard1" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon1" runat="server" CssClass="service-icon">
                        <i class="fa fa-globe"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS1Title" runat="server" Text="WorldWide Tours" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS1Desc" runat="server" Text="Explore breathtaking destinations globally with our curated international tour packages." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Service 2 -->
            <asp:Panel ID="pnlCol2" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard2" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon2" runat="server" CssClass="service-icon">
                        <i class="fa fa-hotel"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS2Title" runat="server" Text="Hotel Reservation" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS2Desc" runat="server" Text="Book luxury and budget-friendly 5-star hotels with exclusive discounts and top amenities." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Service 3 -->
            <asp:Panel ID="pnlCol3" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard3" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon3" runat="server" CssClass="service-icon">
                        <i class="fa fa-user-tie"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS3Title" runat="server" Text="Travel Guides" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS3Desc" runat="server" Text="Get expert local guides to give you an authentic and enriching sightseeing experience." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Service 4 -->
            <asp:Panel ID="pnlCol4" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard4" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon4" runat="server" CssClass="service-icon">
                        <i class="fa fa-map-marked-alt"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS4Title" runat="server" Text="Event Management" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS4Desc" runat="server" Text="Organize corporate trips, weddings, and private destination events seamlessly." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Service 5 -->
            <asp:Panel ID="pnlCol5" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard5" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon5" runat="server" CssClass="service-icon">
                        <i class="fa fa-plane"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS5Title" runat="server" Text="Flight Booking" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS5Desc" runat="server" Text="Hassle-free first class flight tickets and domestic air flight reservations." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

            <!-- Service 6 -->
            <asp:Panel ID="pnlCol6" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard6" runat="server" CssClass="service-content-inner">
                    <asp:Panel ID="pnlIcon6" runat="server" CssClass="service-icon">
                        <i class="fa fa-headset"></i>
                    </asp:Panel>
                    <asp:Label ID="lblS6Title" runat="server" Text="24/7 Support" CssClass="h5 mb-3 text-dark d-block fw-bold"></asp:Label>
                    <asp:Label ID="lblS6Desc" runat="server" Text="Our customer care support team is available round the clock to assist you on your journey." CssClass="text-muted d-block"></asp:Label>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>

    </asp:Panel>

</asp:Content>