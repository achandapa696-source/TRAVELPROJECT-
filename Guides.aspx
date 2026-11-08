<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TravelGuides.aspx.cs" Inherits="TRAVELPROJECT.TravelGuides" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Travel Guides - TravelProject</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .guide-header {
            background: linear-gradient(135deg, #0d6efd, #0b5ed7);
            color: #ffffff;
            padding: 50px 0;
            text-align: center;
            margin-bottom: 45px;
        }
        .guide-card {
            border: none;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.06);
            transition: all 0.3s ease;
            background: #ffffff;
        }
        .guide-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.12);
        }
        .guide-img {
            height: 250px;
            width: 100%;
            object-fit: cover;
        }
        .social-link {
            width: 34px;
            height: 34px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #eef2ff;
            color: #0d6efd;
            text-decoration: none;
            margin: 0 4px;
            transition: all 0.2s;
        }
        .social-link:hover {
            background: #0d6efd;
            color: #ffffff;
        }
        .badge-specialty {
            background-color: #e0f2fe;
            color: #0284c7;
            font-size: 0.8rem;
            padding: 4px 10px;
            border-radius: 20px;
            font-weight: 600;
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
                        <li class="nav-item"><a class="nav-link active text-primary fw-bold" href="TravelGuides.aspx">Travel Guides</a></li>
                        <li class="nav-item"><a class="nav-link" href="Testimonial.aspx">Testimonial</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header -->
        <div class="guide-header">
            <div class="container">
                <h1 class="fw-bold display-6">Meet Our Expert Tour Guides</h1>
                <p class="mb-0 text-light">Certified, multilingual, and experienced professionals to lead your journey.</p>
            </div>
        </div>

        <!-- Guides Grid -->
        <div class="container mb-5">
            <div class="row g-4">
                <asp:Repeater ID="rptGuides" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card guide-card h-100 text-center">
                                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("GuideName") %>' class="guide-img" onerror="this.src='https://via.placeholder.com/400x300?text=Tour+Guide';" />
                                <div class="card-body p-4 d-flex flex-column">
                                    <h5 class="fw-bold mb-1"><%# Eval("GuideName") %></h5>
                                    <p class="text-primary small fw-semibold mb-2"><%# Eval("Designation") %></p>
                                    
                                    <div class="mb-2">
                                        <span class="badge-specialty"><%# Eval("Specialty") %></span>
                                    </div>

                                    <div class="d-flex justify-content-center gap-3 text-muted small my-2">
                                        <span><i class="fa-solid fa-briefcase text-secondary me-1"></i><%# Eval("ExperienceYears") %>+ Yrs</span>
                                        <span><i class="fa-solid fa-route text-success me-1"></i><%# Eval("TotalTours") %> Tours</span>
                                        <span><i class="fa-solid fa-star text-warning me-1"></i><%# Eval("Rating") %></span>
                                    </div>

                                    <p class="text-secondary small mb-3">
                                        <i class="fa-solid fa-language me-1 text-primary"></i> <strong>Languages:</strong> <%# Eval("Languages") %>
                                    </p>

                                    <!-- Social Links -->
                                    <div class="mt-auto pt-2 border-top">
                                        <a href='<%# Eval("FacebookUrl") %>' class="social-link" title="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
                                        <a href='<%# Eval("TwitterUrl") %>' class="social-link" title="Twitter"><i class="fa-brands fa-x-twitter"></i></a>
                                        <a href='<%# Eval("InstagramUrl") %>' class="social-link" title="Instagram"><i class="fa-brands fa-instagram"></i></a>
                                        <a href='<%# Eval("LinkedinUrl") %>' class="social-link" title="LinkedIn"><i class="fa-brands fa-linkedin-in"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <footer class="bg-dark text-secondary py-4 text-center mt-5">
            <p class="mb-0 small">&copy; 2026 TravelProject. All Rights Reserved.</p>
        </footer>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
