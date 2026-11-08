<%@ Page Title="Package Details - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PackageDetails.aspx.cs" Inherits="TRAVELPROJECT.PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --brand-navy: #0f172a;
            --brand-blue: #2563eb;
            --brand-blue-hover: #1d4ed8;
            --brand-light-blue: #eff6ff;
            --text-dark: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --card-bg: #ffffff;
        }

        .pkg-page-wrapper {
            max-width: 1220px;
            margin: 25px auto 60px auto;
            padding: 0 20px;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
            color: var(--text-dark);
        }

        /* 1. HERO BANNER WITH SKYLINE */
        .hero-banner {
            position: relative;
            background: linear-gradient(135deg, #1e1b4b 0%, #312e81 40%, #c2410c 100%);
            border-radius: 24px;
            padding: 35px 40px 85px 40px;
            color: #ffffff;
            overflow: hidden;
            box-shadow: 0 15px 35px rgba(30, 27, 75, 0.25);
            margin-bottom: 30px;
        }
        .hero-skyline {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 90px;
            pointer-events: none;
            opacity: 0.85;
        }
        .btn-back-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: #ffffff;
            text-decoration: none;
            padding: 8px 18px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 500;
            backdrop-filter: blur(6px);
            transition: all 0.2s ease;
            margin-bottom: 20px;
        }
        .btn-back-pill:hover {
            background: rgba(255, 255, 255, 0.25);
            color: #ffffff;
            transform: translateX(-3px);
        }
        .badge-popular {
            display: inline-block;
            background: #f59e0b;
            color: #ffffff;
            font-size: 11px;
            font-weight: 800;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            padding: 5px 14px;
            border-radius: 20px;
            margin-bottom: 12px;
            box-shadow: 0 4px 10px rgba(245, 158, 11, 0.35);
        }
        .hero-title {
            font-size: 38px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 16px 0;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.25);
        }
        .hero-meta-row {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            align-items: center;
            position: relative;
            z-index: 2;
        }
        .meta-glass-pill {
            background: rgba(255, 255, 255, 0.18);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.25);
            color: #ffffff;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        /* 2. MAIN 2-COLUMN GRID */
        .details-grid {
            display: grid;
            grid-template-columns: 1fr 380px;
            gap: 32px;
            align-items: start;
        }
        @media (max-width: 991px) {
            .details-grid {
                grid-template-columns: 1fr;
            }
        }

        /* LEFT SIDE - GALLERY */
        .gallery-card {
            background: var(--card-bg);
            border-radius: 20px;
            border: 1px solid var(--border-color);
            padding: 16px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }
        .main-image-viewport {
            position: relative;
            width: 100%;
            height: 420px;
            border-radius: 16px;
            overflow: hidden;
            background: #1e293b;
        }
        .main-pkg-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s ease;
        }
        .gallery-nav-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #ffffff;
            color: var(--text-dark);
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            transition: all 0.2s ease;
            z-index: 5;
        }
        .gallery-nav-btn:hover {
            background: #f1f5f9;
            transform: translateY(-50%) scale(1.08);
        }
        .gallery-nav-btn.prev { left: 16px; }
        .gallery-nav-btn.next { right: 16px; }

        .img-tag-caption {
            position: absolute;
            bottom: 16px;
            left: 16px;
            background: rgba(15, 23, 42, 0.75);
            backdrop-filter: blur(6px);
            color: #ffffff;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .img-counter-pill {
            position: absolute;
            bottom: 16px;
            right: 16px;
            background: rgba(255, 255, 255, 0.9);
            color: var(--brand-navy);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        /* Thumbnails Row */
        .thumbnails-row {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 12px;
            margin-top: 14px;
        }
        .thumb-item {
            height: 75px;
            border-radius: 12px;
            overflow: hidden;
            cursor: pointer;
            border: 2.5px solid transparent;
            transition: all 0.25s ease;
        }
        .thumb-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
        .thumb-item.active {
            border-color: var(--brand-blue);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.25);
            transform: translateY(-2px);
        }
        .thumb-item:hover {
            transform: translateY(-2px);
        }

        /* SPEC HIGHLIGHT CARDS (2x3 Grid) */
        .spec-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 14px;
            margin-bottom: 30px;
        }
        @media (max-width: 650px) {
            .spec-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        .spec-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 14px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.25s ease;
        }
        .spec-card:hover {
            border-color: var(--brand-blue);
            background: var(--brand-light-blue);
            transform: translateY(-2px);
            box-shadow: 0 6px 14px rgba(37, 99, 235, 0.08);
        }
        .spec-icon-box {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: var(--brand-light-blue);
            color: var(--brand-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
            transition: 0.2s;
        }
        .spec-card:hover .spec-icon-box {
            background: var(--brand-blue);
            color: #ffffff;
        }
        .spec-info-label {
            font-size: 11px;
            color: var(--text-muted);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 2px;
        }
        .spec-info-val {
            font-size: 13px;
            font-weight: 700;
            color: var(--text-dark);
        }

        /* TAB NAVIGATION */
        .tabs-header {
            display: flex;
            gap: 10px;
            margin-bottom: 25px;
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 14px;
        }
        .tab-btn {
            background: #f1f5f9;
            color: var(--text-muted);
            border: none;
            padding: 8px 22px;
            border-radius: 25px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
        }
        .tab-btn.active {
            background: var(--brand-navy);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(15, 23, 42, 0.2);
        }

        /* ITINERARY LIST */
        .section-headline {
            font-size: 22px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0 0 20px 0;
        }
        .itinerary-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 14px;
            padding: 18px 20px;
            margin-bottom: 14px;
            transition: all 0.25s ease;
        }
        .itinerary-card:hover {
            border-color: var(--brand-blue);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.04);
        }
        .itinerary-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .itinerary-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .day-badge-circle {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--brand-blue);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
            flex-shrink: 0;
            box-shadow: 0 3px 8px rgba(37, 99, 235, 0.3);
        }
        .day-sub-label {
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 0.5px;
        }
        .day-main-title {
            font-size: 15px;
            font-weight: 700;
            color: var(--text-dark);
            margin-top: 2px;
        }
        .itinerary-desc {
            margin: 12px 0 0 52px;
            font-size: 13px;
            color: var(--text-muted);
            line-height: 1.6;
        }

        /* OVERVIEW & INCLUDES PANELS */
        .tab-panel {
            display: none;
        }
        .tab-panel.active {
            display: block;
        }
        .content-box {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 14px;
            padding: 24px;
            line-height: 1.7;
            color: #475569;
        }
        .inc-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }
        .inc-list li {
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .inc-list li i.fa-check { color: #16a34a; }
        .inc-list li i.fa-times { color: #dc2626; }

        /* RIGHT STICKY BOOKING CARD */
        .booking-card-sticky {
            position: sticky;
            top: 25px;
        }
        .pricing-box-card {
            background: #ffffff;
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 26px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        .price-sub-heading {
            font-size: 12px;
            font-weight: 700;
            text-transform: uppercase;
            color: var(--text-muted);
            letter-spacing: 0.6px;
        }
        .price-large-display {
            font-size: 36px;
            font-weight: 800;
            color: var(--brand-blue);
            margin: 6px 0 2px 0;
            display: flex;
            align-items: baseline;
            gap: 4px;
        }
        .price-per-person {
            font-size: 14px;
            font-weight: 500;
            color: var(--text-muted);
        }
        .price-taxes-note {
            font-size: 12px;
            color: var(--text-muted);
            margin-bottom: 20px;
        }

        .booking-form-group {
            margin-bottom: 16px;
        }
        .booking-form-label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 6px;
        }
        .form-input-custom {
            width: 100%;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            padding: 10px 14px;
            font-size: 14px;
            color: var(--text-dark);
            outline: none;
            transition: 0.2s;
            box-sizing: border-box;
        }
        .form-input-custom:focus {
            border-color: var(--brand-blue);
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
        }

        /* Traveler Counter Control */
        .traveler-counter-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid var(--border-color);
            border-radius: 10px;
            padding: 6px 10px;
            background: #ffffff;
        }
        .counter-btn {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            border: 1px solid var(--border-color);
            background: #f8fafc;
            color: var(--text-dark);
            font-weight: 700;
            font-size: 16px;
            cursor: pointer;
            transition: 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .counter-btn:hover {
            background: var(--brand-light-blue);
            color: var(--brand-blue);
            border-color: var(--brand-blue);
        }
        .counter-val-text {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-dark);
        }

        /* Calculation Breakdown */
        .calc-breakdown {
            background: #f8fafc;
            border-radius: 12px;
            padding: 14px;
            margin: 20px 0;
            border: 1px dashed var(--border-color);
        }
        .calc-row {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            color: var(--text-muted);
            margin-bottom: 6px;
        }
        .calc-row.total-row {
            margin-top: 10px;
            padding-top: 8px;
            border-top: 1px solid var(--border-color);
            font-size: 15px;
            font-weight: 800;
            color: var(--text-dark);
        }

        /* Action Buttons */
        .btn-book-primary {
            width: 100%;
            background: var(--brand-blue);
            color: #ffffff;
            border: none;
            padding: 14px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 4px 14px rgba(37, 99, 235, 0.35);
            margin-bottom: 10px;
        }
        .btn-book-primary:hover {
            background: var(--brand-blue-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(37, 99, 235, 0.45);
        }
        .btn-wishlist-outline {
            width: 100%;
            background: #ffffff;
            color: var(--text-dark);
            border: 1px solid var(--border-color);
            padding: 12px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .btn-wishlist-outline:hover {
            background: #f8fafc;
            border-color: #cbd5e1;
        }

        /* NEED HELP CARD */
        .help-expert-card {
            background: var(--brand-navy);
            color: #ffffff;
            border-radius: 20px;
            padding: 24px;
            box-shadow: 0 8px 25px rgba(15, 23, 42, 0.15);
        }
        .help-expert-card h5 {
            margin: 0 0 8px 0;
            font-size: 18px;
            font-weight: 700;
            color: #ffffff;
        }
        .help-expert-card p {
            margin: 0 0 16px 0;
            font-size: 13px;
            color: #94a3b8;
            line-height: 1.5;
        }
        .contact-direct-link {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 10px;
            transition: 0.2s;
        }
        .contact-direct-link:hover {
            color: #60a5fa;
        }
    </style>

    <div class="pkg-page-wrapper">
        
        <!-- ================= 1. HERO GRADIENT BANNER ================= -->
        <div class="hero-banner">
            <!-- Back to Packages -->
            <a href="Packages.aspx" class="btn-back-pill">
                <i class="fa fa-arrow-left"></i> Back to Packages
            </a>
            <br />
            <!-- Popular Badge -->
            <div class="badge-popular">POPULAR PACKAGE</div>

            <!-- Dynamic Package Name -->
            <h1 class="hero-title">
                <asp:Label ID="lblPackageName" runat="server" Text="Dubai Adventure"></asp:Label>
            </h1>

            <!-- Meta Pills -->
            <div class="hero-meta-row">
                <div class="meta-glass-pill">
                    <i class="fa fa-map-marker-alt" style="color: #60a5fa;"></i>
                    <asp:Label ID="lblLocation" runat="server" Text="Dubai"></asp:Label>
                </div>
                <div class="meta-glass-pill">
                    <i class="fa fa-star" style="color: #fbbf24;"></i> 4.8 · 120 reviews
                </div>
                <div class="meta-glass-pill">
                    <i class="fa fa-clock" style="color: #60a5fa;"></i> 5 Days / 4 Nights
                </div>
            </div>

            <svg class="hero-skyline" viewBox="0 0 1200 120" preserveAspectRatio="none">
                <path d="M0,120 L0,95 L30,95 L30,60 L55,60 L55,95 L90,95 L90,40 L125,40 L125,95 L170,95 L170,70 L200,70 L200,95 L260,95 L260,25 L280,5 L300,25 L300,95 L360,95 L360,50 L410,50 L410,95 L470,95 L470,75 L530,75 L530,95 L600,95 L600,35 L645,35 L645,95 L720,95 L720,60 L770,60 L770,95 L840,95 L840,20 L860,0 L880,20 L880,95 L950,95 L950,55 L1000,55 L1000,95 L1080,95 L1080,70 L1140,70 L1140,95 L1200,95 L1200,120 Z" fill="#0f172a"></path>
            </svg>
        </div>

        <!-- ================= 2. MAIN 2-COLUMN GRID ================= -->
        <div class="details-grid">

            <!-- LEFT COLUMN: Gallery, Specs, Tabs, Content -->
            <div class="left-content-area">
                
                <!-- Main Photo Gallery Card -->
                <div class="gallery-card">
                    <div class="main-image-viewport">
                        <asp:Image ID="imgMain" runat="server" CssClass="main-pkg-img" ImageUrl="~/img/packages-1.jpg" AlternateText="Tour Package Main Image" />
                        
                        <button type="button" class="gallery-nav-btn prev" onclick="prevSlide()"><i class="fa fa-chevron-left"></i></button>
                        <button type="button" class="gallery-nav-btn next" onclick="nextSlide()"><i class="fa fa-chevron-right"></i></button>

                        <div class="img-tag-caption">Skyline at sunset</div>
                        <div class="img-counter-pill" id="slideCounter">1 / 5</div>
                    </div>

                    <!-- 5 Thumbnails Row -->
                    <div class="thumbnails-row">
                        <div class="thumb-item active" onclick="switchThumbnail(0)">
                            <asp:Image ID="thumb0" runat="server" ImageUrl="~/img/packages-1.jpg" />
                        </div>
                        <div class="thumb-item" onclick="switchThumbnail(1)">
                            <img src="img/packages-2.jpg" onerror="this.src='img/destination-1.jpg';" alt="Thumb 2" />
                        </div>
                        <div class="thumb-item" onclick="switchThumbnail(2)">
                            <img src="img/packages-3.jpg" onerror="this.src='img/destination-2.jpg';" alt="Thumb 3" />
                        </div>
                        <div class="thumb-item" onclick="switchThumbnail(3)">
                            <img src="img/packages-4.jpg" onerror="this.src='img/destination-3.jpg';" alt="Thumb 4" />
                        </div>
                        <div class="thumb-item" onclick="switchThumbnail(4)">
                            <img src="img/packages-5.jpg" onerror="this.src='img/destination-4.jpg';" alt="Thumb 5" />
                        </div>
                    </div>
                </div>

                <!-- 6 Spec Highlight Cards -->
                <div class="spec-grid">
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-clock"></i></div>
                        <div>
                            <div class="spec-info-label">Duration</div>
                            <div class="spec-info-val">5 Days / 4 Nights</div>
                        </div>
                    </div>
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-users"></i></div>
                        <div>
                            <div class="spec-info-label">Group Size</div>
                            <div class="spec-info-val">2 – 10 People</div>
                        </div>
                    </div>
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-hotel"></i></div>
                        <div>
                            <div class="spec-info-label">Hotel</div>
                            <div class="spec-info-val">4 Star Luxury</div>
                        </div>
                    </div>
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-car"></i></div>
                        <div>
                            <div class="spec-info-label">Transport</div>
                            <div class="spec-info-val">Included (AC Cab)</div>
                        </div>
                    </div>
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-utensils"></i></div>
                        <div>
                            <div class="spec-info-label">Meals</div>
                            <div class="spec-info-val">Breakfast & Dinner</div>
                        </div>
                    </div>
                    <div class="spec-card">
                        <div class="spec-icon-box"><i class="fa fa-sun"></i></div>
                        <div>
                            <div class="spec-info-label">Best Time</div>
                            <div class="spec-info-val">All Year Round</div>
                        </div>
                    </div>
                </div>

                <!-- Tabs Navigation -->
                <div class="tabs-header">
                    <button type="button" class="tab-btn" onclick="openTab('tab-overview', this)">Overview</button>
                    <button type="button" class="tab-btn active" onclick="openTab('tab-itinerary', this)">Itinerary</button>
                    <button type="button" class="tab-btn" onclick="openTab('tab-includes', this)">Includes</button>
                </div>

                <!-- TAB 1: OVERVIEW -->
                <div id="tab-overview" class="tab-panel">
                    <div class="content-box">
                        <h4 style="margin-top:0; color:var(--text-dark); font-weight:700;">About this Tour Package</h4>
                        <p>Embark on an unforgettable vacation with our premium, fully-curated holiday package. Designed for discerning travelers, families, and couples looking for the perfect blend of relaxation, sightseeing, cultural heritage, and modern thrills.</p>
                        <p>Enjoy handpicked 4-star luxury stays, hassle-free private airport and local transfers, daily complimentary buffet meals, and verified professional English-speaking tour guides for all key excursions.</p>
                    </div>
                </div>

                <!-- TAB 2: ITINERARY (Active by default as per screenshot) -->
                <div id="tab-itinerary" class="tab-panel active">
                    <h3 class="section-headline">Day-by-day itinerary</h3>

                    <div class="itinerary-card">
                        <div class="itinerary-header">
                            <div class="itinerary-left">
                                <div class="day-badge-circle">1</div>
                                <div>
                                    <div class="day-sub-label">Day 1</div>
                                    <div class="day-main-title">Arrival and hotel check-in</div>
                                </div>
                            </div>
                            <i class="fa fa-chevron-down" style="color:var(--text-muted); font-size:13px;"></i>
                        </div>
                        <div class="itinerary-desc">
                            Airport pickup and transfer to your 4-star luxury hotel. Evening free to settle in, explore the local promenade, and rest.
                        </div>
                    </div>

                    <div class="itinerary-card">
                        <div class="itinerary-header">
                            <div class="itinerary-left">
                                <div class="day-badge-circle">2</div>
                                <div>
                                    <div class="day-sub-label">Day 2</div>
                                    <div class="day-main-title">City sightseeing tour</div>
                                </div>
                            </div>
                            <i class="fa fa-chevron-down" style="color:var(--text-muted); font-size:13px;"></i>
                        </div>
                        <div class="itinerary-desc">
                            Full-day guided excursion covering iconic architecture, panoramic viewpoints, and historical heritage landmarks.
                        </div>
                    </div>

                    <div class="itinerary-card">
                        <div class="itinerary-header">
                            <div class="itinerary-left">
                                <div class="day-badge-circle">3</div>
                                <div>
                                    <div class="day-sub-label">Day 3</div>
                                    <div class="day-main-title">Local cuisine and experiences</div>
                                </div>
                            </div>
                            <i class="fa fa-chevron-down" style="color:var(--text-muted); font-size:13px;"></i>
                        </div>
                        <div class="itinerary-desc">
                            Indulge in authentic traditional food tasting tours, local market exploration, and culturally rich artisan workshops.
                        </div>
                    </div>

                    <div class="itinerary-card">
                        <div class="itinerary-header">
                            <div class="itinerary-left">
                                <div class="day-badge-circle">4</div>
                                <div>
                                    <div class="day-sub-label">Day 4</div>
                                    <div class="day-main-title">Free exploration & leisure</div>
                                </div>
                            </div>
                            <i class="fa fa-chevron-down" style="color:var(--text-muted); font-size:13px;"></i>
                        </div>
                        <div class="itinerary-desc">
                            Spend the day at leisure for personal shopping, photography, beach or poolside relaxation, or optional adventure sports.
                        </div>
                    </div>

                    <div class="itinerary-card">
                        <div class="itinerary-header">
                            <div class="itinerary-left">
                                <div class="day-badge-circle">5</div>
                                <div>
                                    <div class="day-sub-label">Day 5</div>
                                    <div class="day-main-title">Departure</div>
                                </div>
                            </div>
                            <i class="fa fa-chevron-down" style="color:var(--text-muted); font-size:13px;"></i>
                        </div>
                        <div class="itinerary-desc">
                            Enjoy your breakfast at the hotel, complete checkout formalities, and proceed with a private transfer to the airport.
                        </div>
                    </div>
                </div>

                <!-- TAB 3: INCLUDES -->
                <div id="tab-includes" class="tab-panel">
                    <div class="content-box">
                        <h4 style="margin-top:0; color:var(--text-dark); font-weight:700;">Inclusions & Exclusions</h4>
                        <ul class="inc-list">
                            <li><i class="fa fa-check"></i> 4-Star Luxury Hotel Stay</li>
                            <li><i class="fa fa-times"></i> International Flight Tickets</li>
                            <li><i class="fa fa-check"></i> Daily Breakfast & Dinner</li>
                            <li><i class="fa fa-times"></i> Personal Laundry & Mini Bar</li>
                            <li><i class="fa fa-check"></i> Private AC Vehicle for Transfers</li>
                            <li><i class="fa fa-times"></i> Visa Processing Fees</li>
                            <li><i class="fa fa-check"></i> Sightseeing Entry Passes</li>
                            <li><i class="fa fa-times"></i> Travel Insurance</li>
                            <li><i class="fa fa-check"></i> Professional English Guide</li>
                            <li><i class="fa fa-times"></i> Extra Tips & Gratuities</li>
                        </ul>
                    </div>
                </div>

            </div>

            <!-- RIGHT COLUMN: Sticky Pricing Box & Need Help -->
            <div class="right-sidebar-area">
                <div class="booking-card-sticky">
                    
                    <!-- Pricing & Live Calculation Card -->
                    <div class="pricing-box-card">
                        <div class="price-sub-heading">Price</div>
                        <div class="price-large-display">
                            ₹<asp:Label ID="lblPrice" runat="server" Text="40000"></asp:Label>
                            <span class="price-per-person">/ person</span>
                        </div>
                        <div class="price-taxes-note">Taxes included</div>

                        <!-- Travel Date -->
                        <div class="booking-form-group">
                            <label class="booking-form-label">Travel date</label>
                            <asp:TextBox ID="txtTravelDate" runat="server" TextMode="Date" CssClass="form-input-custom"></asp:TextBox>
                        </div>

                        <!-- Travelers Counter -->
                        <div class="booking-form-group">
                            <label class="booking-form-label">Travelers (2 – 10)</label>
                            <div class="traveler-counter-box">
                                <button type="button" class="counter-btn" onclick="updateTravelers(-1)">−</button>
                                <span class="counter-val-text" id="travelerText">2 people</span>
                                <button type="button" class="counter-btn" onclick="updateTravelers(1)">+</button>
                            </div>
                            <asp:HiddenField ID="hfTravelers" runat="server" Value="2" />
                        </div>

                        <!-- Live Price Breakdown -->
                        <div class="calc-breakdown">
                            <div class="calc-row">
                                <span>₹<span id="rateLabel">40,000</span> × <span id="numTravelers">2</span> travelers</span>
                                <span>₹<span id="subTotalLabel">80,000</span></span>
                            </div>
                            <div class="calc-row total-row">
                                <span>Total</span>
                                <span style="color:var(--brand-blue);">₹<span id="grandTotalLabel">80,000</span></span>
                            </div>
                        </div>

                        <!-- Pure ASP.NET Book Button -->
                        <asp:Button ID="btnBookPackage" runat="server" Text="📅 Book this package" CssClass="btn-book-primary" OnClick="btnBookPackage_Click" />

                        <!-- Add to Wishlist Button -->
                        <button type="button" class="btn-wishlist-outline">
                            <i class="fa fa-heart" style="color:#ef4444;"></i> Add to wishlist
                        </button>
                    </div>

                    <!-- Need Help? Navy Card -->
                    <div class="help-expert-card">
                        <h5>Need help?</h5>
                        <p>Our travel experts are here to help you plan your perfect trip.</p>
                        <a href="tel:+01234567890" class="contact-direct-link">
                            <i class="fa fa-phone-alt"></i> +012 345 67890
                        </a>
                        <a href="mailto:info@travela.com" class="contact-direct-link">
                            <i class="fa fa-envelope"></i> info@travela.com
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>

    <!-- Client-Side Scripts for Smooth Interactions -->
    <script type="text/javascript">
        var perPersonRate = 40000;
        var currentTravelers = 2;

        window.onload = function () {
            var priceElem = document.getElementById('<%= lblPrice.ClientID %>');
            if (priceElem) {
                var cleanPrice = parseInt(priceElem.innerText.replace(/[^0-9]/g, '')) || 40000;
                perPersonRate = cleanPrice;
                document.getElementById('rateLabel').innerText = perPersonRate.toLocaleString('en-IN');
                recalcTotal();
            }
        };

        function updateTravelers(delta) {
            currentTravelers += delta;
            if (currentTravelers < 1) currentTravelers = 1;
            if (currentTravelers > 10) currentTravelers = 10;

            document.getElementById('travelerText').innerText = currentTravelers + (currentTravelers === 1 ? ' person' : ' people');
            document.getElementById('numTravelers').innerText = currentTravelers;
            document.getElementById('<%= hfTravelers.ClientID %>').value = currentTravelers;

            recalcTotal();
        }

        function recalcTotal() {
            var total = perPersonRate * currentTravelers;
            document.getElementById('subTotalLabel').innerText = total.toLocaleString('en-IN');
            document.getElementById('grandTotalLabel').innerText = total.toLocaleString('en-IN');
        }

        // 2. Thumbnail & Slide Gallery
        var currentSlideIndex = 0;
        function getThumbImages() {
            var thumbs = document.querySelectorAll('.thumb-item img');
            var urls = [];
            for (var i = 0; i < thumbs.length; i++) {
                urls.push(thumbs[i].src);
            }
            return urls;
        }

        function switchThumbnail(index) {
            var thumbs = document.querySelectorAll('.thumb-item');
            var imgUrls = getThumbImages();
            if (index >= 0 && index < thumbs.length) {
                currentSlideIndex = index;
                var mainImg = document.getElementById('<%= imgMain.ClientID %>');
                if (mainImg && imgUrls[index]) {
                    mainImg.src = imgUrls[index];
                }
                for (var i = 0; i < thumbs.length; i++) {
                    thumbs[i].classList.remove('active');
                }
                thumbs[index].classList.add('active');
                document.getElementById('slideCounter').innerText = (index + 1) + ' / 5';
            }
        }

        function nextSlide() {
            var thumbs = document.querySelectorAll('.thumb-item');
            var nextIdx = (currentSlideIndex + 1) % thumbs.length;
            switchThumbnail(nextIdx);
        }

        function prevSlide() {
            var thumbs = document.querySelectorAll('.thumb-item');
            var prevIdx = (currentSlideIndex - 1 + thumbs.length) % thumbs.length;
            switchThumbnail(prevIdx);
        }

        // 3. Tab Switching
        function openTab(tabId, btn) {
            var panels = document.querySelectorAll('.tab-panel');
            panels.forEach(function (p) { p.classList.remove('active'); });

            var buttons = document.querySelectorAll('.tab-btn');
            buttons.forEach(function (b) { b.classList.remove('active'); });

            document.getElementById(tabId).classList.add('active');
            btn.classList.add('active');
        }
    </script>
</asp:Content>