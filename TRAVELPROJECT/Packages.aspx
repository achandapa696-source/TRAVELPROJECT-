<%@ Page Title="Packages - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="TRAVELPROJECT.Packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Custom CSS matching Travela Template -->
    <style>
        /* Header Banner Style */
        .bg-breadcrumb {
            background: linear-gradient(rgba(19, 53, 123, 0.7), rgba(19, 53, 123, 0.7)), url('img/breadcrumb-bg.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            padding: 80px 0 50px 0;
        }

        /* Package Card Styles */
        .packages-item {
            border-radius: 10px;
            overflow: hidden;
            background: #ffffff;
            transition: 0.5s;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        .packages-item:hover {
            box-shadow: 0 0 25px rgba(0,0,0,0.2);
            transform: translateY(-5px);
        }

        .packages-img {
            position: relative;
            overflow: hidden;
        }

        .packages-img img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: 0.5s;
        }

        .packages-item:hover .packages-img img {
            transform: scale(1.1);
        }

        .packages-price {
            position: absolute;
            top: 15px;
            right: 15px;
            background: #13357B;
            color: #ffffff;
            padding: 4px 15px;
            border-radius: 5px;
            font-weight: 600;
            z-index: 2;
        }

        .packages-info-strip {
            background: #8e8d8a;
            color: #ffffff;
            font-size: 13px;
        }

        .packages-info-strip i {
            color: #ffffff;
        }

        .star-rating {
            color: #13357B;
        }

        /* Online Booking Section Styles */
        .booking-section {
            background: linear-gradient(rgba(19, 53, 123, 0.85), rgba(19, 53, 123, 0.85)), url('img/booking-bg.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            color: #ffffff;
            padding: 80px 0;
            border-radius: 10px;
        }

        .booking-form .form-control, 
        .booking-form .form-select {
            height: 50px;
            border-radius: 8px;
            border: none;
            padding: 10px 15px;
        }

        .booking-form textarea.form-control {
            height: 100px;
        }

        .btn-book-submit {
            background-color: #011233;
            color: #ffffff;
            font-weight: 600;
            height: 50px;
            border-radius: 8px;
            border: none;
            transition: 0.3s;
        }

        .btn-book-submit:hover {
            background-color: #ffffff;
            color: #13357B;
        }
    </style>

    <!-- Header Banner -->
    <asp:Panel ID="pnlHeader" runat="server" CssClass="container-fluid bg-breadcrumb text-center mb-5">
        <asp:Label ID="lblPageTitle" runat="server" Text="Packages" CssClass="display-4 text-white fw-bold d-block"></asp:Label>
        <asp:Label ID="lblSubtitle" runat="server" Text="Awesome Packages For Your Travel & Holidays" CssClass="text-white-50 d-block mt-2 fs-5"></asp:Label>
    </asp:Panel>

    <!-- Packages Section -->
    <asp:Panel ID="pnlPackages" runat="server" CssClass="container py-4 mb-5">
        
        <!-- Title Box -->
        <asp:Panel ID="pnlTitle" runat="server" CssClass="text-center mb-5">
            <asp:Label ID="lblSubHeader" runat="server" Text="PACKAGES" CssClass="text-primary text-uppercase fw-bold d-block" style="letter-spacing: 2px;"></asp:Label>
            <asp:Label ID="lblMainHeader" runat="server" Text="Awesome Packages" CssClass="display-5 fw-bold text-dark d-block"></asp:Label>
        </asp:Panel>

        <!-- Cards Row -->
        <asp:Panel ID="pnlCardsRow" runat="server" CssClass="row g-4">
            
            <!-- Package 1: Discover Japan -->
            <asp:Panel ID="pnlCol1" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard1" runat="server" CssClass="packages-item">
                    <asp:Panel ID="pnlImgBox1" runat="server" CssClass="packages-img">
                        <asp:Image ID="img1" runat="server" ImageUrl="~/img/destination-1.jpg" AlternateText="Venice Italy" />
                        <asp:Label ID="lblPrice1" runat="server" Text="$549.00" CssClass="packages-price"></asp:Label>
                    </asp:Panel>
                    
                    <!-- Location / Days / Persons Strip -->
                    <asp:Panel ID="pnlStrip1" runat="server" CssClass="packages-info-strip py-2 px-3 d-flex justify-content-between align-items-center">
                        <asp:Label ID="lblLoc1" runat="server" Text="<i class='fa fa-map-marker-alt me-1'></i> Venice - Italy"></asp:Label>
                        <asp:Label ID="lblDays1" runat="server" Text="<i class='fa fa-calendar-alt me-1'></i> 3 days"></asp:Label>
                        <asp:Label ID="lblPerson1" runat="server" Text="<i class='fa fa-user me-1'></i> 2 Person"></asp:Label>
                    </asp:Panel>

                    <!-- Card Body -->
                    <asp:Panel ID="pnlBody1" runat="server" CssClass="p-4">
                        <asp:Label ID="lblCardTitle1" runat="server" Text="Discover Japan" CssClass="h4 fw-bold text-dark d-block mb-1"></asp:Label>
                        <asp:Label ID="lblCategory1" runat="server" Text="HOTEL DEALS" CssClass="text-uppercase small text-muted fw-bold d-block mb-2"></asp:Label>
                        <asp:Panel ID="pnlStars1" runat="server" CssClass="star-rating mb-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </asp:Panel>
                        <asp:Label ID="lblDesc1" runat="server" Text="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt nemo quis quos illum aperiam fugiat." CssClass="text-muted d-block small mb-0"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

            <!-- Package 2: Thayland Trip -->
            <asp:Panel ID="pnlCol2" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard2" runat="server" CssClass="packages-item">
                    <asp:Panel ID="pnlImgBox2" runat="server" CssClass="packages-img">
                        <asp:Image ID="img2" runat="server" ImageUrl="~/img/destination-2.jpg" AlternateText="Thayland" />
                        <asp:Label ID="lblPrice2" runat="server" Text="$649.00" CssClass="packages-price"></asp:Label>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlStrip2" runat="server" CssClass="packages-info-strip py-2 px-3 d-flex justify-content-between align-items-center">
                        <asp:Label ID="lblLoc2" runat="server" Text="<i class='fa fa-map-marker-alt me-1'></i> Thayland"></asp:Label>
                        <asp:Label ID="lblDays2" runat="server" Text="<i class='fa fa-calendar-alt me-1'></i> 3 days"></asp:Label>
                        <asp:Label ID="lblPerson2" runat="server" Text="<i class='fa fa-user me-1'></i> 2 Person"></asp:Label>
                    </asp:Panel>

                    <asp:Panel ID="pnlBody2" runat="server" CssClass="p-4">
                        <asp:Label ID="lblCardTitle2" runat="server" Text="Thayland Trip" CssClass="h4 fw-bold text-dark d-block mb-1"></asp:Label>
                        <asp:Label ID="lblCategory2" runat="server" Text="HOTEL DEALS" CssClass="text-uppercase small text-muted fw-bold d-block mb-2"></asp:Label>
                        <asp:Panel ID="pnlStars2" runat="server" CssClass="star-rating mb-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </asp:Panel>
                        <asp:Label ID="lblDesc2" runat="server" Text="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt nemo quis quos illum aperiam fugiat." CssClass="text-muted d-block small mb-0"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

            <!-- Package 3: Venice - Italy -->
            <asp:Panel ID="pnlCol3" runat="server" CssClass="col-lg-4 col-md-6">
                <asp:Panel ID="pnlCard3" runat="server" CssClass="packages-item">
                    <asp:Panel ID="pnlImgBox3" runat="server" CssClass="packages-img">
                        <asp:Image ID="img3" runat="server" ImageUrl="~/img/destination-3.jpg" AlternateText="Venice Italy" />
                        <asp:Label ID="lblPrice3" runat="server" Text="$349.00" CssClass="packages-price"></asp:Label>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlStrip3" runat="server" CssClass="packages-info-strip py-2 px-3 d-flex justify-content-between align-items-center">
                        <asp:Label ID="lblLoc3" runat="server" Text="<i class='fa fa-map-marker-alt me-1'></i> Venice - Italy"></asp:Label>
                        <asp:Label ID="lblDays3" runat="server" Text="<i class='fa fa-calendar-alt me-1'></i> 3 days"></asp:Label>
                        <asp:Label ID="lblPerson3" runat="server" Text="<i class='fa fa-user me-1'></i> 2 Person"></asp:Label>
                    </asp:Panel>

                    <asp:Panel ID="pnlBody3" runat="server" CssClass="p-4">
                        <asp:Label ID="lblCardTitle3" runat="server" Text="Venice - Italy" CssClass="h4 fw-bold text-dark d-block mb-1"></asp:Label>
                        <asp:Label ID="lblCategory3" runat="server" Text="HOTEL DEALS" CssClass="text-uppercase small text-muted fw-bold d-block mb-2"></asp:Label>
                        <asp:Panel ID="pnlStars3" runat="server" CssClass="star-rating mb-3">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </asp:Panel>
                        <asp:Label ID="lblDesc3" runat="server" Text="Lorem ipsum dolor, sit amet consectetur adipisicing elit. Nesciunt nemo quis quos illum aperiam fugiat." CssClass="text-muted d-block small mb-0"></asp:Label>
                    </asp:Panel>
                </asp:Panel>
            </asp:Panel>

        </asp:Panel>
    </asp:Panel>

    <!-- Online Booking Section -->
    <asp:Panel ID="pnlBookingSection" runat="server" CssClass="container my-5">
        <asp:Panel ID="pnlBookingBox" runat="server" CssClass="booking-section p-5">
            <div class="row align-items-center g-5">
                
                <!-- Left Text Content -->
                <div class="col-lg-6">
                    <asp:Label ID="lblBookTag" runat="server" Text="BOOKING" CssClass="text-white text-uppercase fw-bold d-block" style="letter-spacing: 2px;"></asp:Label>
                    <asp:Label ID="lblBookTitle" runat="server" Text="Online Booking" CssClass="display-4 fw-bold text-white mb-4 d-block"></asp:Label>
                    <asp:Label ID="lblBookP1" runat="server" Text="Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur maxime ullam esse fuga blanditiis me..." CssClass="text-white-50 d-block mb-3"></asp:Label>
                    <asp:Label ID="lblBookP2" runat="server" Text="Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur maxime ullam esse fuga blanditiis me..." CssClass="text-white-50 d-block mb-4"></asp:Label>
                    <asp:HyperLink ID="hlReadMore" runat="server" NavigateUrl="#" CssClass="btn btn-light rounded-pill px-4 py-2 text-primary fw-bold">Read More</asp:HyperLink>
                </div>

                <!-- Right Booking Form -->
                <div class="col-lg-6">
                    <asp:Panel ID="pnlFormWrapper" runat="server" CssClass="booking-form">
                        <asp:Label ID="lblFormHeading" runat="server" Text="Book A Tour Deals" CssClass="h2 text-white fw-bold mb-2 d-block"></asp:Label>
                        <p class="text-white-50 mb-4">Get <span class="text-warning fw-bold">50% Off</span> On Your First Adventure Trip With Travela. Get More Deal Offers Here.</p>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Your Email"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtDateTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal" Placeholder="Date & Time"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Text="Destination" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Destination 1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Destination 2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Destination 3"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlPersons" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Text="Persons" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Persons 1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Persons 2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Persons 3"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Text="Categories" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Kids"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="1" ></asp:ListItem>
                                    <asp:ListItem Value="3" Text="2"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-12">
                                <asp:TextBox ID="txtSpecialRequest" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" Placeholder="Special Request"></asp:TextBox>
                            </div>
                            <div class="col-12">
                                <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn btn-book-submit w-100" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>

            </div>
        </asp:Panel>
    </asp:Panel>

</asp:Content>