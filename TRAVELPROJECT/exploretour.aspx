<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="exploretour.aspx.cs" Inherits="TRAVELPROJECT.exploretour" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Explore Tour Destinations</title>

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
        .hero-banner {
            background: linear-gradient(rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.75)), 
                        url('https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=1600') center/cover no-repeat;
            color: #ffffff;
            padding: 80px 20px 60px;
            text-align: center;
        }
        .search-card {
            background: #ffffff;
            border-radius: 14px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            padding: 22px 25px;
            margin-top: -45px;
            position: relative;
            z-index: 10;
        }
        .tour-card {
            border: none;
            border-radius: 16px;
            background: #ffffff;
            overflow: hidden;
            box-shadow: 0 5px 18px rgba(0,0,0,0.06);
            transition: all 0.3s ease;
        }
        .tour-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.12);
        }
        .tour-img-wrapper {
            height: 220px;
            overflow: hidden;
            position: relative;
        }
        .tour-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .tour-card:hover .tour-img-wrapper img {
            transform: scale(1.08);
        }
        .country-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(13, 110, 253, 0.9);
            color: #ffffff;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
        }
        .price-text {
            font-size: 1.35rem;
            font-weight: 700;
            color: #0d6efd;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Hero Header -->
        <div class="hero-banner">
            <div class="container">
                <h1 class="fw-bold display-5">Explore Tour Destinations</h1>
                <p class="lead">Find and book your favorite holiday packages from our top selections.</p>
            </div>
        </div>

        <div class="container mb-5">
            <!-- Search & Filter Card -->
            <div class="search-card mb-5">
                <div class="row g-3 align-items-end">
                    <div class="col-md-5">
                        <label class="form-label fw-bold text-muted small">
                            <i class="fa-solid fa-location-dot text-danger me-1"></i> Search Destination or Country
                        </label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-lg" placeholder="e.g. Goa, Rajasthan, France..."></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label fw-bold text-muted small">
                            <i class="fa-solid fa-dollar-sign text-success me-1"></i> Max Budget Filter
                        </label>
                        <asp:DropDownList ID="ddlBudget" runat="server" CssClass="form-select form-select-lg">
                            <asp:ListItem Text="Any Budget" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Up to ₹15,000" Value="15000"></asp:ListItem>
                            <asp:ListItem Text="Up to ₹25,000" Value="25000"></asp:ListItem>
                            <asp:ListItem Text="Up to ₹50,000" Value="50000"></asp:ListItem>
                            <asp:ListItem Text="Up to ₹1,00,000" Value="100000"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 d-grid">
                        <asp:Button ID="btnSearch" runat="server" Text="Search Tours" CssClass="btn btn-primary btn-lg fw-semibold" OnClick="btnSearch_Click" />
                    </div>
                </div>
            </div>

            <!-- Destinations Grid (Bound from Database) -->
            <div class="row g-4">
                <asp:Repeater ID="rptDestinations" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-4 col-md-6">
                            <div class="card tour-card h-100">
                                <div class="tour-img-wrapper">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("DestinationName") %>' onerror="this.src='https://via.placeholder.com/600x400?text=Tour+Image';" />
                                    <span class="country-badge">
                                        <i class="fa-solid fa-globe me-1"></i><%# Eval("Country") %>
                                    </span>
                                </div>
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title fw-bold mb-2"><%# Eval("DestinationName") %></h5>
                                    
                                    <p class="text-secondary small flex-grow-1">
                                        <%# Eval("Description") %>
                                    </p>

                                    <hr class="my-3 text-muted" />

                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem;">Price per person</small>
                                            <span class="price-text">₹<%# Eval("Price", "{0:N0}") %></span>
                                        </div>
                                        <div>
                                            <asp:Button ID="btnBook" runat="server" Text="Book Now" 
                                                        CssClass="btn btn-primary px-3 fw-semibold" 
                                                        CommandArgument='<%# Eval("DestinationId") %>' 
                                                        OnClick="btnBook_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- No Records Message -->
            <asp:Panel ID="pnlNoData" runat="server" Visible="false" CssClass="text-center py-5">
                <i class="fa-solid fa-compass fa-3x text-muted mb-3"></i>
                <h4>No Destinations Found</h4>
                <p class="text-muted">Try adjusting your search criteria or budget filter.</p>
                <asp:Button ID="btnReset" runat="server" Text="View All Tours" CssClass="btn btn-outline-primary" OnClick="btnReset_Click" />
            </asp:Panel>
        </div>

    </form>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>