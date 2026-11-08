<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Destination.aspx.cs" Inherits="TRAVELPROJECT.Destination" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Popular Destinations - Travel Project</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <style>
        * {
            font-family: 'Poppins', sans-serif;
        }
        body {
            background-color: #f8f9fa;
        }
        .hero-section {
            background: linear-gradient(rgba(15, 23, 42, 0.75), rgba(15, 23, 42, 0.8)), 
                        url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=1600') center/cover no-repeat;
            color: #ffffff;
            padding: 85px 20px 65px;
            text-align: center;
        }
        .search-container {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            padding: 25px;
            margin-top: -45px;
            position: relative;
            z-index: 10;
        }
        .dest-card {
            border: none;
            border-radius: 16px;
            background: #ffffff;
            overflow: hidden;
            box-shadow: 0 6px 20px rgba(0,0,0,0.06);
            transition: all 0.3s ease;
        }
        .dest-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.12);
        }
        .img-wrapper {
            height: 220px;
            overflow: hidden;
            position: relative;
        }
        .img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .dest-card:hover .img-wrapper img {
            transform: scale(1.08);
        }
        .badge-country {
            position: absolute;
            top: 14px;
            left: 14px;
            background: rgba(13, 110, 253, 0.9);
            color: #ffffff;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .price-tag {
            font-size: 1.35rem;
            font-weight: 700;
            color: #0d6efd;
        }
        .line-clamp-2 {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Hero Section -->
        <div class="hero-section">
            <div class="container">
                <h1 class="display-5 fw-bold mb-2">Explore Top Destinations</h1>
                <p class="lead mb-0 text-white-50">Discover handpicked travel locations and plan your dream vacation.</p>
            </div>
        </div>

        <div class="container mb-5">
            <!-- Search Bar Section -->
            <div class="search-container mb-5">
                <div class="row g-2 align-items-center">
                    <div class="col-md-7">
                        <div class="input-group input-group-lg">
                            <span class="input-group-text bg-light border-end-0">
                                <i class="fa-solid fa-magnifying-glass text-muted"></i>
                            </span>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control bg-light border-start-0" 
                                         placeholder="Search by destination name or country..."></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-3 col-6 d-grid">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-lg fw-semibold" 
                                    OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-md-2 col-6 d-grid">
                        <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="btn btn-outline-secondary btn-lg fw-semibold" 
                                    OnClick="btnShowAll_Click" />
                    </div>
                </div>
            </div>

            <!-- Message Label (for errors or no data) -->
            <div class="text-center my-4">
                <asp:Label ID="lblMessage" runat="server" Visible="false" 
                           CssClass="alert alert-warning d-inline-block px-4 py-2 fw-semibold rounded-pill shadow-sm">
                </asp:Label>
            </div>

            <!-- Destinations Grid (Repeater) -->
            <div class="row g-4">
                <asp:Repeater ID="rptDestinations" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card dest-card h-100">
                                <div class="img-wrapper">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("DestinationName") %>' 
                                         onerror="this.src='https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=600';" />
                                    <span class="badge-country">
                                        <i class="fa-solid fa-location-dot me-1"></i><%# Eval("Country") %>
                                    </span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title fw-bold text-dark mb-2"><%# Eval("DestinationName") %></h5>
                                    <p class="card-text text-muted small flex-grow-1 line-clamp-2">
                                        <%# Eval("Description") %>
                                    </p>

                                    <hr class="my-3 text-muted" />

                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <span class="d-block text-muted" style="font-size: 0.75rem;">Price starting from</span>
                                            <span class="price-tag">₹<%# Eval("Price", "{0:N0}") %></span>
                                        </div>
                                        <div>
                                            <a href='Booking.aspx?DestinationId=<%# Eval("DestinationId") %>' 
                                               class="btn btn-primary px-3 fw-semibold">
                                                Book Now <i class="fa-solid fa-arrow-right ms-1"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </form>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>