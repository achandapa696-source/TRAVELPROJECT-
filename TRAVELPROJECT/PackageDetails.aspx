<%@ Page Title="Package Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PackageDetails.aspx.cs" Inherits="TRAVELPROJECT.PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        /* 1. Panoramic Header Banner */
        .panoramic-header-exact {
            background: linear-gradient(rgba(11, 37, 69, 0.65), rgba(11, 37, 69, 0.75)), url('https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=1600&auto=format&fit=crop') center/cover no-repeat;
            padding: 40px 60px 45px 60px;
            color: #ffffff;
            border-radius: 0 0 16px 16px;
        }

        .btn-back-panoramic {
            background: rgba(255, 255, 255, 0.15);
            color: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.4);
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 12px;
            display: inline-block;
            transition: all 0.2s;
        }

        .btn-back-panoramic:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .hero-main-title {
            font-size: 38px;
            font-weight: 800;
            margin-bottom: 6px;
            display: block;
            color: #ffffff;
        }

        .hero-meta-row {
            display: flex;
            gap: 16px;
            font-size: 13.5px;
            color: #e0f2fe;
            align-items: center;
        }

        /* 2. Top 3-Column Grid Layout */
        .details-top-grid {
            max-width: 1240px;
            margin: 35px auto 30px auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1.15fr 1.25fr 0.9fr;
            gap: 24px;
        }

        /* Col 1: Gallery */
        .gallery-box-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 14px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            height: fit-content;
        }

        .gallery-main-img {
            width: 100%;
            height: 290px;
            object-fit: cover;
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .thumb-grid-strip {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 8px;
        }

        .thumb-item {
            width: 100%;
            height: 60px;
            object-fit: cover;
            border-radius: 6px;
            border: 1px solid #e2e8f0;
        }

        .thumb-more-tag {
            background: #0f172a;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 13.5px;
            border-radius: 6px;
        }

        /* Col 2: Details & Specs */
        .middle-details-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 24px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }

        .section-h3 {
            font-size: 19px;
            font-weight: 800;
            color: #0f172a;
            margin-bottom: 8px;
        }

        .desc-paragraph {
            font-size: 13.5px;
            color: #475569;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        /* 6 Specs Box */
        .specs-grid-6 {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 16px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
            margin-bottom: 22px;
        }

        .spec-unit {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .spec-unit-icon { font-size: 20px; }
        .spec-unit-lbl { font-size: 11px; font-weight: 700; color: #64748b; text-transform: uppercase; }
        .spec-unit-val { font-size: 13px; font-weight: 700; color: #0f172a; }

        /* Includes List */
        .includes-h4 {
            font-size: 15px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 10px;
        }

        .includes-ul {
            list-style: none;
        }

        .includes-ul li {
            font-size: 13px;
            color: #334155;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .includes-ul li span {
            color: #0d6efd;
            font-weight: bold;
        }

        /* Col 3: Right Sidebar */
        .right-sidebar-stack {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .price-panel {
            background: #ffffff;
            border-radius: 12px;
            padding: 24px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.04);
        }

        .price-lbl-small { font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; }

        .price-val-big {
            font-size: 34px;
            font-weight: 800;
            color: #0d6efd;
            margin: 4px 0 2px 0;
            display: block;
        }

        .price-sub-note { font-size: 12px; color: #64748b; margin-bottom: 16px; }

        .btn-book-sidebar {
            width: 100%;
            background: #0d6efd;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 14.5px;
            font-weight: 700;
            cursor: pointer;
            margin-bottom: 8px;
            transition: background 0.2s;
        }

        .btn-book-sidebar:hover { background: #0b5ed7; }

        .btn-wishlist-sidebar {
            width: 100%;
            background: #ffffff;
            color: #0d6efd;
            border: 1px solid #bfdbfe;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
        }

        .help-panel {
            background: #f8fafc;
            border-radius: 12px;
            padding: 20px;
            border: 1px solid #e2e8f0;
        }

        .help-panel h4 { font-size: 14.5px; color: #0f172a; margin-bottom: 6px; }
        .help-panel p { font-size: 12px; color: #64748b; line-height: 1.5; margin-bottom: 10px; }
        .help-phone-txt { font-size: 13px; font-weight: 700; color: #0d6efd; margin-bottom: 3px; }

        /* 3. Bottom 2-Column Section (Itinerary & Testimonial) */
        .details-bottom-grid {
            max-width: 1240px;
            margin: 0 auto 60px auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 24px;
        }

        .itinerary-card-box {
            background: #ffffff;
            border-radius: 12px;
            padding: 26px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }

        .tab-nav-row {
            display: flex;
            gap: 25px;
            border-bottom: 2px solid #e2e8f0;
            margin-bottom: 22px;
            padding-bottom: 10px;
        }

        .tab-link-item {
            font-size: 14px;
            font-weight: 700;
            color: #64748b;
            text-decoration: none;
            cursor: pointer;
        }

        .tab-link-item.active {
            color: #0d6efd;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 10px;
            margin-bottom: -12px;
        }

        .timeline-vertical {
            border-left: 2px solid #cbd5e1;
            padding-left: 22px;
            margin-left: 10px;
        }

        .tl-row { position: relative; margin-bottom: 20px; }
        .tl-row:last-child { margin-bottom: 0; }

        .tl-pill-tag {
            position: absolute;
            left: -33px;
            top: 0;
            background: #e0f2fe;
            color: #0d6efd;
            border: 2px solid #0d6efd;
            font-size: 11px;
            font-weight: 700;
            padding: 2px 6px;
            border-radius: 10px;
        }

        .tl-title-txt { font-size: 14px; font-weight: 700; color: #0f172a; margin-bottom: 2px; }
        .tl-desc-txt { font-size: 12.5px; color: #64748b; line-height: 1.5; }

        /* Testimonial Box */
        .testimonial-card-box {
            background: #f0f7ff;
            border-radius: 12px;
            padding: 26px;
            border: 1px solid #dbeafe;
            height: fit-content;
        }

        .quote-icon { font-size: 32px; color: #93c5fd; line-height: 1; margin-bottom: 8px; }
        .quote-text { font-size: 13.5px; font-style: italic; color: #1e3a8a; line-height: 1.6; margin-bottom: 18px; }
        
        .reviewer-meta {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #0d6efd;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 14px;
        }
    </style>

    <!-- 1. Panoramic Header Banner -->
    <div class="panoramic-header-exact">
        <asp:Button ID="btnTopBack" runat="server" CssClass="btn-back-panoramic" Text="← Back to Packages" OnClick="btnBack_Click" />
        <asp:Label ID="lblBannerTitle" runat="server" CssClass="hero-main-title"></asp:Label>
        <div class="hero-meta-row">
            <asp:Label ID="lblLocationBadge" runat="server"></asp:Label>
            <span>• ⭐ 4.8 (120 Reviews)</span>
        </div>
    </div>

    <!-- 2. Middle 3-Column Grid -->
    <div class="details-top-grid">

        <!-- Column 1: Image Gallery -->
        <div class="gallery-box-card">
            <asp:Image ID="imgTour" runat="server" CssClass="gallery-main-img" />
            <div class="thumb-grid-strip">
                <img class="thumb-item" src="https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?w=200" alt="Spot 1">
                <img class="thumb-item" src="https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=200" alt="Spot 2">
                <img class="thumb-item" src="https://images.unsplash.com/photo-1431274172761-fca41d930114?w=200" alt="Spot 3">
                <img class="thumb-item" src="https://images.unsplash.com/photo-1520939817895-060bdef4dc1b?w=200" alt="Spot 4">
                <div class="thumb-more-tag">+3</div>
            </div>
        </div>

        <!-- Column 2: Tour Details & Specs -->
        <div class="middle-details-card">
            <div class="section-h3">Tour Package Details</div>
            <p class="desc-paragraph">
                Experience the magic of this destination. This amazing 5-day tour package covers the most iconic landmarks, 
                delicious cuisine, and unforgettable experiences with our expertly planned itinerary.
            </p>

            <!-- 6 Specs Grid -->
            <div class="specs-grid-6">
                <div class="spec-unit">
                    <span class="spec-unit-icon">📅</span>
                    <div><div class="spec-unit-lbl">Duration</div><div class="spec-unit-val">5 Days / 4 Nights</div></div>
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-icon">👥</span>
                    <div><div class="spec-unit-lbl">Group Size</div><div class="spec-unit-val">2 – 10 People</div></div>
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-icon">🏨</span>
                    <div><div class="spec-unit-lbl">Hotel</div><div class="spec-unit-val">4 Star Luxury</div></div>
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-icon">🚌</span>
                    <div><div class="spec-unit-lbl">Transport</div><div class="spec-unit-val">Included</div></div>
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-icon">🍽️</span>
                    <div><div class="spec-unit-lbl">Meals</div><div class="spec-unit-val">Breakfast Included</div></div>
                </div>
                <div class="spec-unit">
                    <span class="spec-unit-icon">☀️</span>
                    <div><div class="spec-unit-lbl">Best Time</div><div class="spec-unit-val">All Year Round</div></div>
                </div>
            </div>

            <!-- Package Includes -->
            <div class="includes-h4">Package Includes</div>
            <ul class="includes-ul">
                <li><span>✔</span> Hotel accommodation (4 star)</li>
                <li><span>✔</span> Airport pickup and drop</li>
                <li><span>✔</span> City sightseeing tour</li>
                <li><span>✔</span> Professional tour guide</li>
                <li><span>✔</span> Daily breakfast</li>
            </ul>
        </div>

        <!-- Column 3: Price & Sidebar -->
        <div class="right-sidebar-stack">
            <div class="price-panel">
                <div class="price-lbl-small">Price</div>
                <asp:Label ID="lblPrice" runat="server" CssClass="price-val-big"></asp:Label>
                <div class="price-sub-note">per person • taxes included</div>
                
                <asp:Button ID="btnBookNow" runat="server" CssClass="btn-book-sidebar" Text="📅 Book Now" OnClick="btnBookNow_Click" />
                <asp:Button ID="btnWishlist" runat="server" CssClass="btn-wishlist-sidebar" Text="🤍 Add to Wishlist" />
            </div>

            <div class="help-panel">
                <h4>🎧 Need Help?</h4>
                <p>Our travel experts are here to help you plan your perfect trip.</p>
                <div class="help-phone-txt">📞 +012 345 67890</div>
                <div style="font-size: 12px; color: #64748b;">✉ info@travela.com</div>
            </div>
        </div>

    </div>

    <!-- 3. Bottom 2-Column Section (Itinerary & Reviews) -->
    <div class="details-bottom-grid">
        
        <div class="itinerary-card-box">
            <div class="tab-nav-row">
                <span class="tab-link-item active">📅 Itinerary</span>
                <span class="tab-link-item">🖼️ Gallery</span>
                <span class="tab-link-item">⭐ Reviews</span>
            </div>

            <div class="timeline-vertical">
                <div class="tl-row">
                    <span class="tl-pill-tag">Day 1</span>
                    <div class="tl-title-txt">Arrival & Hotel Check-in</div>
                    <div class="tl-desc-txt">Meet our representative at the airport and transfer to the hotel. Relax and enjoy your first day.</div>
                </div>
                <div class="tl-row">
                    <span class="tl-pill-tag">Day 2</span>
                    <div class="tl-title-txt">Full-Day City Sightseeing</div>
                    <div class="tl-desc-txt">Visit the most iconic sights, historic monuments, and scenic spots with your guide.</div>
                </div>
                <div class="tl-row">
                    <span class="tl-pill-tag">Day 3</span>
                    <div class="tl-title-txt">Culture & Museum Exploration</div>
                    <div class="tl-desc-txt">Explore famous museums, art galleries, and local handicraft markets.</div>
                </div>
                <div class="tl-row">
                    <span class="tl-pill-tag">Day 4</span>
                    <div class="tl-title-txt">Special Excursion & Cruise</div>
                    <div class="tl-desc-txt">Enjoy a relaxing day trip, river/lake cruise ride, and authentic dinner.</div>
                </div>
                <div class="tl-row">
                    <span class="tl-pill-tag">Day 5</span>
                    <div class="tl-title-txt">Departure</div>
                    <div class="tl-desc-txt">After breakfast, private cab transfer to the airport for your departure flight.</div>
                </div>
            </div>
        </div>

        <div class="testimonial-card-box">
            <div class="quote-icon">“</div>
            <div class="quote-text">
                An amazing experience! Everything was perfectly planned and the guide was so helpful. 
                The destination is even more beautiful in person!
            </div>
            <div class="reviewer-meta">
                <div class="avatar-circle">SJ</div>
                <div>
                    <div style="font-weight: 700; font-size: 13.5px; color: #0f172a;">Sarah Johnson</div>
                    <div style="font-size: 12px; color: #64748b;">USA &nbsp;•&nbsp; ⭐⭐⭐⭐⭐</div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>