<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="TRAVELPROJECT.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Travel Booking - TravelProject</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .booking-banner {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            color: #ffffff;
            padding: 50px 0;
            text-align: center;
            margin-bottom: 40px;
        }
        .form-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            padding: 35px;
            margin-bottom: 50px;
        }
        .form-label {
            font-weight: 600;
            color: #333333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
            <div class="container">
                <a class="navbar-brand fw-bold text-white" href="Home.aspx">
                    <i class="fa-solid fa-plane-departure text-primary me-2"></i>TravelProject
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navMenu">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item"><a class="nav-link" href="Home.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Destination.aspx">Destination</a></li>
                        <li class="nav-item"><a class="nav-link" href="exploretour.aspx">Explore Tour</a></li>
                        <li class="nav-item"><a class="nav-link active text-primary fw-bold" href="Booking.aspx">Travel Booking</a></li>
                        <li class="nav-item"><a class="nav-link" href="Gallery.aspx">Our Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="TravelGuides.aspx">Travel Guides</a></li>
                        <li class="nav-item"><a class="nav-link" href="Testimonial.aspx">Testimonial</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Banner Header -->
        <div class="booking-banner">
            <div class="container">
                <h2 class="fw-bold display-6">Book Your Tour Package</h2>
                <p class="mb-0 text-light">Confirm your travel destination and reservation details easily.</p>
            </div>
        </div>

        <!-- Form Card Container -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="form-card">

                        <!-- Success / Error Alert Message -->
                        <asp:Label ID="lblMessage" runat="server" Visible="false" CssClass="alert d-block mb-4"></asp:Label>

                        <div class="row g-3">
                            <!-- Full Name -->
                            <div class="col-md-6">
                                <label class="form-label">Full Name *</label>
                                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" required="required"></asp:TextBox>
                            </div>

                            <!-- Phone / Mobile -->
                            <div class="col-md-6">
                                <label class="form-label">Phone Number *</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="10-digit mobile number" MaxLength="10" required="required"></asp:TextBox>
                            </div>

                            <!-- Email -->
                            <div class="col-md-12">
                                <label class="form-label">Email Address *</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="name@example.com" TextMode="Email" required="required"></asp:TextBox>
                            </div>

                            <!-- Destination Selection -->
                            <div class="col-md-6">
                                <label class="form-label">Select Destination *</label>
                                <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-select">
                                </asp:DropDownList>
                            </div>

                            <!-- Travel Date -->
                            <div class="col-md-6">
                                <label class="form-label">Travel Date *</label>
                                <asp:TextBox ID="txtTravelDate" runat="server" CssClass="form-control" TextMode="Date" required="required"></asp:TextBox>
                            </div>

                            <!-- Total Persons -->
                            <div class="col-md-6">
                                <label class="form-label">Total Persons *</label>
                                <asp:TextBox ID="txtTotalPersons" runat="server" CssClass="form-control" TextMode="Number" Text="1" min="1" max="50" required="required"></asp:TextBox>
                            </div>

                            <!-- Special Requests -->
                            <div class="col-md-12">
                                <label class="form-label">Special Requests (Optional)</label>
                                <asp:TextBox ID="txtSpecialRequest" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Hotel preferences, food requirements, extra services, etc."></asp:TextBox>
                            </div>

                            <!-- Submit Button -->
                            <div class="col-md-12 text-center mt-4">
                                <asp:Button ID="btnSubmit" runat="server" Text="Confirm Booking" CssClass="btn btn-primary px-5 py-2 fw-semibold" OnClick="btnSubmit_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-secondary py-4 text-center mt-5">
            <p class="mb-0 small">&copy; 2026 TravelProject. All Rights Reserved.</p>
        </footer>

    </form>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>