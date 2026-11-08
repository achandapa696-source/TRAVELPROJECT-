<%@ Page Title="About Us - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="TRAVELPROJECT.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --brand-navy: #13357B;
            --brand-blue: #0d6efd;
            --border-color: #e2e8f0;
            --text-dark: #1e293b;
            --text-muted: #64748b;
        }

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

        .about-main-section {
            background-color: #ffffff;
            padding: 80px 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }
        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .about-grid-2col {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 50px;
            align-items: center;
        }
        @media (max-width: 900px) {
            .about-grid-2col {
                grid-template-columns: 1fr;
            }
        }

        .about-image-wrap {
            position: relative;
            padding: 15px;
            border: 4px solid var(--brand-navy);
            border-radius: 16px;
        }
        .about-image-wrap img {
            width: 100%;
            height: 420px;
            object-fit: cover;
            border-radius: 10px;
            display: block;
        }

        .section-tag-lines {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            color: var(--brand-navy);
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 12px;
        }
        .section-tag-lines::before,
        .section-tag-lines::after {
            content: "";
            width: 45px;
            height: 2px;
            background-color: var(--brand-navy);
            display: inline-block;
        }
        .about-title-large {
            font-size: 40px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0 0 18px 0;
            line-height: 1.2;
        }
        .about-title-large span {
            color: var(--brand-navy);
        }
        .about-para-lead {
            font-size: 15px;
            color: var(--text-muted);
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .about-features-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
            margin-bottom: 30px;
        }
        .feat-item {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
        }
        .feat-item i {
            color: var(--brand-navy);
            font-size: 16px;
        }

        .btn-about-discover {
            background-color: var(--brand-navy);
            color: #ffffff;
            padding: 13px 34px;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 700;
            border: none;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: 0 4px 15px rgba(19, 53, 123, 0.25);
            display: inline-block;
        }
        .btn-about-discover:hover {
            background-color: #0d285e;
            transform: translateY(-2px);
        }

        .guide-section {
            background-color: #f8fafc;
            padding: 80px 0 90px 0;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }
        .section-center-head {
            text-align: center;
            margin-bottom: 50px;
        }
        .section-head-title {
            font-size: 40px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0;
        }

        .guide-cards-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }
        @media (max-width: 991px) {
            .guide-cards-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 600px) {
            .guide-cards-grid {
                grid-template-columns: 1fr;
            }
        }

        .guide-card-box {
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.04);
            text-align: center;
            transition: all 0.35s ease;
            padding-bottom: 22px;
        }
        .guide-card-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 28px rgba(19, 53, 123, 0.15);
            border-color: var(--brand-navy);
        }

        .guide-img-container {
            position: relative;
            height: 280px;
            overflow: hidden;
            margin-bottom: 25px;
        }
        .guide-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s ease;
        }
        .guide-card-box:hover .guide-img-container img {
            transform: scale(1.05);
        }

        .guide-social-pill {
            position: absolute;
            bottom: -18px;
            left: 50%;
            transform: translateX(-50%);
            background: #ffffff;
            border: 1.5px solid var(--brand-navy);
            border-radius: 30px;
            padding: 5px 14px;
            display: flex;
            gap: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            z-index: 5;
        }
        .guide-social-pill a {
            width: 28px;
            height: 28px;
            border-radius: 50%;
            background: var(--brand-navy);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .guide-social-pill a:hover {
            background: var(--brand-blue);
            transform: scale(1.15);
        }

        .guide-name {
            font-size: 18px;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0 0 4px 0;
        }
        .guide-role {
            font-size: 13px;
            color: var(--text-muted);
            margin: 0;
            font-weight: 500;
        }
    </style>

    <div class="travela-breadcrumb-header">
        <h1>About Us</h1>
        <div class="travela-breadcrumb-nav">
            <a href="Home.aspx">Home</a>
            <span>/</span>
            <a href="#">Pages</a>
            <span>/</span>
            <span style="color:#ffffff;">About</span>
        </div>
    </div>

    <div class="about-main-section">
        <div class="about-container">
            <div class="about-grid-2col">
                
                <div class="about-image-wrap">
                    <img src="img/about-img.jpg" onerror="this.src='img/destination-1.jpg';" alt="Welcome to Travela" />
                </div>

                <div>
                    <div class="section-tag-lines">About Us</div>
                    <h2 class="about-title-large">Welcome to <span>Travela</span></h2>
                    <p class="about-para-lead">
                        Travela is a world-renowned travel and tour agency committed to creating extraordinary vacation experiences. We specialize in international holiday packages, flight reservations, luxury 4-star hotel accommodations, and guided sightseeing.
                    </p>
                    <p class="about-para-lead" style="margin-bottom: 25px;">
                        With over 12 years of industry experience and 50,000+ happy travelers globally, our team ensures complete comfort, safety, and 24/7 dedicated assistance throughout your holiday.
                    </p>

                    <!-- Features -->
                    <div class="about-features-grid">
                        <div class="feat-item"><i class="fa fa-arrow-right"></i> First Class Flights</div>
                        <div class="feat-item"><i class="fa fa-arrow-right"></i> 5 Star Accommodations</div>
                        <div class="feat-item"><i class="fa fa-arrow-right"></i> 150+ Premium City Tours</div>
                        <div class="feat-item"><i class="fa fa-arrow-right"></i> 24/7 Travel Assistance</div>
                    </div>

                    <asp:Button ID="btnDiscoverPackages" runat="server" Text="Discover More" CssClass="btn-about-discover" OnClick="btnDiscoverPackages_Click" />
                </div>

            </div>
        </div>
    </div>

    <div class="guide-section">
        <div class="about-container">
            
            <div class="section-center-head">
                <div class="section-tag-lines">Travel Guide</div>
                <h2 class="section-head-title">Meet Our Guide</h2>
            </div>

            <!-- 4 Guides Grid -->
            <div class="guide-cards-grid">
                
                <!-- Guide 1 -->
                <div class="guide-card-box">
                    <div class="guide-img-container">
                        <img src="img/guide-1.jpg" onerror="this.src='img/packages-1.jpg';" alt="Guide 1" />
                        <div class="guide-social-pill">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4 class="guide-name">Alex Morgan</h4>
                    <p class="guide-role">Senior Tour Director</p>
                </div>

                <!-- Guide 2 -->
                <div class="guide-card-box">
                    <div class="guide-img-container">
                        <img src="img/guide-2.jpg" onerror="this.src='img/packages-2.jpg';" alt="Guide 2" />
                        <div class="guide-social-pill">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4 class="guide-name">Ethan Carter</h4>
                    <p class="guide-role">Trekking & Nature Specialist</p>
                </div>

                <!-- Guide 3 -->
                <div class="guide-card-box">
                    <div class="guide-img-container">
                        <img src="img/guide-3.jpg" onerror="this.src='img/packages-3.jpg';" alt="Guide 3" />
                        <div class="guide-social-pill">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4 class="guide-name">Lucas Bennett</h4>
                    <p class="guide-role">Cultural & City Guide</p>
                </div>

                <!-- Guide 4 -->
                <div class="guide-card-box">
                    <div class="guide-img-container">
                        <img src="img/guide-4.jpg" onerror="this.src='img/packages-4.jpg';" alt="Guide 4" />
                        <div class="guide-social-pill">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <h4 class="guide-name">David Miller</h4>
                    <p class="guide-role">Adventure & Excursion Lead</p>
                </div>

            </div>

        </div>
    </div>
</asp:Content>