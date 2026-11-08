<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="TRAVELPROJECT.Testimonial" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Customer Testimonials - TravelProject</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .page-header {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            color: #ffffff;
            padding: 50px 0;
            text-align: center;
            margin-bottom: 45px;
        }
        .testimonial-card {
            border: none;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.06);
            background: #ffffff;
            padding: 25px;
            height: 100%;
            transition: transform 0.3s ease;
        }
        .testimonial-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        .user-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
        }
        .form-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.08);
            padding: 35px;
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
                        <li class="nav-item"><a class="nav-link" href="travelbooking.aspx">Travel Booking</a></li>
                        <li class="nav-item"><a class="nav-link" href="Gallery.aspx">Our Gallery</a></li>
                        <li class="nav-item"><a class="nav-link" href="TravelGuides.aspx">Travel Guides</a></li>
                        <li class="nav-item"><a class="nav-link active text-primary fw-bold" href="Testimonial.aspx">Testimonial</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <div class="page-header">
            <div class="container">
                <h1 class="fw-bold display-6">Traveler Testimonials</h1>
                <p class="mb-0 text-light">Real experiences and feedback from our happy adventurers.</p>
            </div>
        </div>

        <div class="container mb-5">
            <!-- Testimonial Cards Repeater -->
            <div class="row g-4 mb-5">
                <asp:Repeater ID="rptTestimonials" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card testimonial-card">
                                <div class="text-warning mb-2">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <span class="text-muted small ms-1">(<%# Eval("Rating") %>/5)</span>
                                </div>
                                <p class="text-secondary small fst-italic mb-3 flex-grow-1">
                                    "<%# Eval("Comment") %>"
                                </p>
                                <div class="d-flex align-items-center pt-2 border-top">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("FullName") %>' class="user-avatar me-3" onerror="this.src='https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150';" />
                                    <div>
                                        <h6 class="mb-0 fw-bold"><%# Eval("FullName") %></h6>
                                        <small class="text-primary"><i class="fa-solid fa-location-dot me-1"></i><%# Eval("Destination") %></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Submit Feedback Form -->
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="form-card">
                        <h4 class="fw-bold mb-3 text-center">Share Your Travel Experience</h4>
                        <p class="text-muted text-center small mb-4">We would love to hear your feedback on your latest journey with us.</p>
                        
                        <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="alert d-block mb-3"></asp:Label>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Your Full Name *</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name" required="required"></asp:TextBox>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Destination Visited *</label>
                                <asp:TextBox ID="txtDestination" runat="server" CssClass="form-control" placeholder="e.g. Goa, Manali, Kerala" required="required"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Your Rating *</label>
                                <asp:DropDownList ID="ddlRating" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="5 Stars (Excellent)" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="4 Stars (Very Good)" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="3 Stars (Average)" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="2 Stars (Poor)" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="1 Star (Terrible)" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Your Comments / Review *</label>
                            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Describe your experience, hotel quality, guide support..." required="required"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmitReview" runat="server" Text="Submit Review" CssClass="btn btn-primary w-100 py-2 fw-bold" OnClick="btnSubmitReview_Click" />
                    </div>
                </div>
            </div>
        </div>

        <footer class="bg-dark text-secondary py-4 text-center mt-5">
            <p class="mb-0 small">&copy; 2026 TravelProject. All Rights Reserved.</p>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>