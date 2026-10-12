
<%@ Page Title="Booking - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="TRAVELPROJECT.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Custom CSS matching Travela Theme -->
    <style>
        .bg-breadcrumb {
            background: linear-gradient(rgba(19, 53, 123, 0.7), rgba(19, 53, 123, 0.7)), url('img/breadcrumb-bg.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            padding: 80px 0 50px 0;
        }

        .booking-section {
            background: linear-gradient(rgba(19, 53, 123, 0.88), rgba(19, 53, 123, 0.88)), url('img/booking-bg.jpg');
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            color: #ffffff;
            padding: 70px 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }

        .booking-form .form-control, 
        .booking-form .form-select {
            height: 50px;
            border-radius: 8px;
            border: 1px solid #ffffff;
            padding: 10px 15px;
            font-size: 15px;
        }

        .booking-form textarea.form-control {
            height: 110px;
        }

        .btn-book-submit {
            background-color: #011233;
            color: #ffffff;
            font-weight: 600;
            font-size: 16px;
            height: 52px;
            border-radius: 8px;
            border: none;
            transition: 0.3s;
        }

        .btn-book-submit:hover {
            background-color: #ffffff;
            color: #13357B;
        }

        .info-box {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            height: 100%;
            border-left: 5px solid #13357B;
        }

        .text-validation {
            font-size: 13px;
            color: #ff3333;
            margin-top: 3px;
            display: block;
        }
    </style>

    <!-- Header Banner -->
    <asp:Panel ID="pnlHeader" runat="server" CssClass="container-fluid bg-breadcrumb text-center mb-5">
        <asp:Label ID="lblPageTitle" runat="server" Text="Online Booking" CssClass="display-4 text-white fw-bold d-block"></asp:Label>
        <asp:Label ID="lblSubtitle" runat="server" Text="Book Your Dream Holiday Trip With Travela" CssClass="text-white-50 d-block mt-2 fs-5"></asp:Label>
    </asp:Panel>

    <!-- Booking Form Section -->
    <div class="container my-5">
        
        <!-- Success Alert Message -->
        <asp:Panel ID="pnlSuccessAlert" runat="server" Visible="false" CssClass="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fa fa-check-circle me-2"></i>
            <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </asp:Panel>

        <div class="row g-4 align-items-stretch">
            
            <!-- Left Info Column -->
            <div class="col-lg-5">
                <div class="info-box d-flex flex-column justify-content-between">
                    <div>
                        <span class="text-primary text-uppercase fw-bold d-block mb-1" style="letter-spacing: 2px;">RESERVATION</span>
                        <h2 class="fw-bold text-dark mb-4">Plan Your Adventure With Us</h2>
                        <p class="text-muted mb-4">
                            Book your customized tour packages with ease. Fill out the form and our travel experts will confirm your seats and guide you through the process.
                        </p>

                        <div class="d-flex align-items-center mb-3">
                            <div class="btn-square bg-primary text-white rounded-circle me-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                                <i class="fa fa-phone-alt"></i>
                            </div>
                            <div>
                                <small class="text-muted d-block">Call For Inquiries</small>
                                <strong class="text-dark">+012 345 6789</strong>
                            </div>
                        </div>

                        <div class="d-flex align-items-center mb-3">
                            <div class="btn-square bg-primary text-white rounded-circle me-3 d-flex align-items-center justify-content-center" style="width: 45px; height: 45px;">
                                <i class="fa fa-envelope"></i>
                            </div>
                            <div>
                                <small class="text-muted d-block">Email Us</small>
                                <strong class="text-dark">booking@travela.com</strong>
                            </div>
                        </div>
                    </div>

                    <div class="p-3 bg-light rounded mt-4 border">
                        <small class="text-primary fw-bold d-block"><i class="fa fa-percent me-1"></i> Special Offer</small>
                        <small class="text-dark">Get up to <strong>30% OFF</strong> on advance booking for family holiday packages!</small>
                    </div>
                </div>
            </div>

            <!-- Right Booking Form Column -->
            <div class="col-lg-7">
                <asp:Panel ID="pnlFormWrapper" runat="server" CssClass="booking-section">
                    <span class="text-warning text-uppercase fw-bold d-block mb-1" style="letter-spacing: 2px;">ONLINE BOOKING</span>
                    <h2 class="text-white fw-bold mb-4">Book A Tour Deal</h2>

                    <div class="row g-3 booking-form">
                        
                        <!-- Full Name -->
                        <div class="col-md-6">
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                                ErrorMessage="Name is required" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Email -->
                        <div class="col-md-6">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Your Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Email is required" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Mobile Number -->
                        <div class="col-md-6">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Your Mobile Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                                ErrorMessage="Phone number required" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Date & Time Picker -->
                        <div class="col-md-6">
                            <asp:TextBox ID="txtDateTime" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDateTime"
                                ErrorMessage="Travel date required" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Destination Dropdown -->
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-select">
                                <asp:ListItem Value="" Text="Select Destination" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="Venice - Italy" Text="Venice - Italy"></asp:ListItem>
                                <asp:ListItem Value="Thailand" Text="Thailand"></asp:ListItem>
                                <asp:ListItem Value="Discover Japan" Text="Discover Japan"></asp:ListItem>
                                <asp:ListItem Value="Swiss Alps" Text="Swiss Alps"></asp:ListItem>
                                <asp:ListItem Value="Paris - France" Text="Paris - France"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDestination" runat="server" ControlToValidate="ddlDestination"
                                InitialValue="" ErrorMessage="Please select destination" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Persons Dropdown -->
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlPersons" runat="server" CssClass="form-select">
                                <asp:ListItem Value="" Text="Select Persons" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="1 Person" Text="1 Person"></asp:ListItem>
                                <asp:ListItem Value="2 Persons" Text="2 Persons"></asp:ListItem>
                                <asp:ListItem Value="3 Persons" Text="3 Persons"></asp:ListItem>
                                <asp:ListItem Value="4+ Persons" Text="4+ Persons"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvPersons" runat="server" ControlToValidate="ddlPersons"
                                InitialValue="" ErrorMessage="Please select persons" CssClass="text-validation" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Categories -->
                        <div class="col-12">
                            <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-select">
                                <asp:ListItem Value="" Text="Select Package Category" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="Honeymoon Special" Text="Honeymoon Special"></asp:ListItem>
                                <asp:ListItem Value="Family Holiday" Text="Family Holiday"></asp:ListItem>
                                <asp:ListItem Value="Adventure & Trekking" Text="Adventure & Trekking"></asp:ListItem>
                                <asp:ListItem Value="Luxury Resort Deals" Text="Luxury Resort Deals"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <!-- Special Request -->
                        <div class="col-12">
                            <asp:TextBox ID="txtSpecialRequest" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" Placeholder="Special Request / Notes"></asp:TextBox>
                        </div>

                        <!-- Submit Button -->
                        <div class="col-12 mt-4">
                            <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="btn btn-book-submit w-100" OnClick="btnBookNow_Click" />
                        </div>

                    </div>
                </asp:Panel>
            </div>

        </div>
    </div>

</asp:Content>