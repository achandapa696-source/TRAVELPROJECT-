<%@ Page Title="Home - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TRAVELPROJECT.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        :root {
            --brand-navy: #13357B;
            --brand-blue: #0d6efd;
            --border-color: #e2e8f0;
            --text-dark: #1e293b;
            --text-muted: #64748b;
        }

        .hero-carousel-container {
            position: relative;
            width: 100%;
            height: 600px;
            overflow: hidden;
            background-color: #0f172a;
        }

        .carousel-slide-item {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.8s ease-in-out, visibility 0.8s ease-in-out;
            background-position: center center;
            background-repeat: no-repeat;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #ffffff;
            padding: 40px 20px 80px 20px;
        }
        .carousel-slide-item.active {
            opacity: 1;
            visibility: visible;
            z-index: 2;
        }

        /* 3 Slide Backgrounds with Dark Overlays */
        .slide-1 {
            background-image: linear-gradient(rgba(19, 53, 123, 0.45), rgba(19, 53, 123, 0.55)), url('img/carousel-2.jpg');
        }
        .slide-2 {
            background-image: linear-gradient(rgba(19, 53, 123, 0.45), rgba(19, 53, 123, 0.55)), url('img/carousel-1.jpg');
        }
        .slide-3 {
            background-image: linear-gradient(rgba(19, 53, 123, 0.45), rgba(19, 53, 123, 0.55)), url('img/carousel-3.jpg');
        }

        .hero-content-box {
            max-width: 900px;
            margin: 0 auto;
            transform: translateY(20px);
            transition: transform 0.6s ease;
        }
        .carousel-slide-item.active .hero-content-box {
            transform: translateY(0);
        }

        .hero-tag-text {
            font-size: 16px;
            font-weight: 800;
            letter-spacing: 3px;
            text-transform: uppercase;
            color: #ffffff;
            margin-bottom: 12px;
            display: block;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        .hero-main-title {
            font-size: 56px;
            font-weight: 800;
            color: #ffffff;
            margin: 0 0 18px 0;
            text-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
            line-height: 1.15;
        }
        @media (max-width: 768px) {
            .hero-main-title { font-size: 36px; }
            .hero-carousel-container { height: 500px; }
        }
        .hero-sub-para {
            font-size: 16px;
            color: #f1f5f9;
            max-width: 700px;
            margin: 0 auto 30px auto;
            line-height: 1.6;
            text-shadow: 0 2px 6px rgba(0,0,0,0.3);
        }
        .btn-discover-now {
            background-color: var(--brand-navy);
            color: #ffffff;
            padding: 14px 40px;
            border-radius: 30px;
            font-size: 16px;
            font-weight: 700;
            border: none;
            cursor: pointer;
            box-shadow: 0 6px 20px rgba(19, 53, 123, 0.4);
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }
        .btn-discover-now:hover {
            background-color: #0b2252;
            color: #ffffff;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(19, 53, 123, 0.6);
        }

        .slider-nav-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 52px;
            height: 52px;
            border-radius: 50%;
            background: rgba(19, 53, 123, 0.45);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.25s ease;
            z-index: 10;
            user-select: none;
        }
        .slider-nav-arrow:hover {
            background: var(--brand-navy);
            transform: translateY(-50%) scale(1.1);
        }
        .slider-nav-arrow.left { left: 25px; }
        .slider-nav-arrow.right { right: 25px; }

        /* 2. FLOATING SEARCH BAR (Overlapping Hero) */
        .search-overlap-container {
            max-width: 1050px;
            margin: -50px auto 65px auto;
            padding: 0 20px;
            position: relative;
            z-index: 15;
        }
        .search-card-box {
            background: #ffffff;
            border-radius: 16px;
            padding: 24px 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border: 1px solid var(--border-color);
            display: grid;
            grid-template-columns: 2fr 1fr auto;
            gap: 16px;
            align-items: center;
        }
        @media (max-width: 768px) {
            .search-card-box { grid-template-columns: 1fr; }
        }
        .search-input-box {
            height: 48px;
            border: 1.5px solid var(--border-color);
            border-radius: 10px;
            padding: 0 16px;
            font-size: 14px;
            outline: none;
            width: 100%;
            box-sizing: border-box;
        }
        .search-input-box:focus {
            border-color: var(--brand-navy);
        }
        .btn-search-main {
            height: 48px;
            background: var(--brand-navy);
            color: #ffffff;
            border: none;
            border-radius: 10px;
            padding: 0 28px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.2s;
        }
        .btn-search-main:hover {
            background: #0b2252;
        }

        /* 3. FEATURED PACKAGES SECTION */
        .home-packages-section {
            padding: 0 0 80px 0;
            background-color: #f8fafc;
            font-family: 'Segoe UI', -apple-system, BlinkMacSystemFont, Roboto, sans-serif;
        }
        .home-packages-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        .section-title-wrap {
            text-align: center;
            margin-bottom: 45px;
        }
        .section-tag-lines {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            color: var(--brand-navy);
            font-size: 15px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 10px;
        }
        .section-tag-lines::before,
        .section-tag-lines::after {
            content: "";
            width: 50px;
            height: 2px;
            background-color: var(--brand-navy);
            display: inline-block;
        }
        .section-main-heading {
            font-size: 38px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0;
        }

        .packages-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 30px;
        }
        @media (max-width: 991px) {
            .packages-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 650px) {
            .packages-grid { grid-template-columns: 1fr; }
        }

        .packages-item-box {
            background: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            border: 1px solid var(--border-color);
            transition: all 0.35s ease;
            display: flex;
            flex-direction: column;
        }
        .packages-item-box:hover {
            transform: translateY(-8px);
            box-shadow: 0 14px 30px rgba(19, 53, 123, 0.15);
        }
        .packages-img-wrap {
            position: relative;
            height: 230px;
            overflow: hidden;
        }
        .packages-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.5s ease;
        }
        .packages-item-box:hover .packages-img-wrap img {
            transform: scale(1.08);
        }
        .packages-price-badge {
            position: absolute;
            top: 0;
            right: 35px;
            background: var(--brand-navy);
            color: #ffffff;
            padding: 7px 16px;
            font-weight: 700;
            font-size: 15px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            z-index: 6;
        }
        .packages-info-strip {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(19, 53, 123, 0.85);
            backdrop-filter: blur(4px);
            display: flex;
            color: #ffffff;
            font-size: 12px;
            font-weight: 600;
            z-index: 5;
        }
        .info-strip-col {
            flex: 1;
            text-align: center;
            padding: 8px 4px;
            border-right: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        .info-strip-col:last-child { border-right: none; }

        .packages-content-area {
            padding: 22px 20px 0 20px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        .pkg-name-title {
            font-size: 19px;
            font-weight: 800;
            color: var(--text-dark);
            margin: 0 0 4px 0;
        }
        .pkg-hotel-deal {
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 0.8px;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 8px;
            display: block;
        }
        .pkg-stars-row {
            color: var(--brand-navy);
            font-size: 13px;
            margin-bottom: 12px;
        }
        .pkg-desc-text {
            font-size: 13px;
            color: var(--text-muted);
            line-height: 1.6;
            margin: 0 0 18px 0;
        }
        .packages-bottom-bar {
            background-color: var(--brand-navy);
            display: flex;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            overflow: hidden;
            margin-top: auto;
        }
        .btn-card-action {
            flex: 1;
            text-align: center;
            color: #ffffff;
            padding: 12px 8px;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s ease;
            display: block;
            border: none;
            background: transparent;
            cursor: pointer;
        }
        .btn-card-action:first-child {
            border-right: 1px solid rgba(255, 255, 255, 0.15);
        }
        .btn-card-action:hover {
            background-color: #0d285e;
            color: #60a5fa;
        }
    </style>

    <!-- ================= 1. AUTO-SLIDING HERO CAROUSEL ================= -->
    <div class="hero-carousel-container">
        
        <!-- Left & Right Navigation Arrows -->
        <div class="slider-nav-arrow left" onclick="prevHeroSlide()"><i class="fa fa-chevron-left"></i></div>
        <div class="slider-nav-arrow right" onclick="nextHeroSlide()"><i class="fa fa-chevron-right"></i></div>

        <!-- Slide 1 (Trekking Group) -->
        <div class="carousel-slide-item slide-1 active">
            <div class="hero-content-box">
                <span class="hero-tag-text">EXPLORE THE WORLD</span>
                <h1 class="hero-main-title">Let's The World Together!</h1>
                <p class="hero-sub-para">
                    Find and book your dream vacation at exclusive prices. Enjoy luxury 4-star stays, guided tours, and unforgettable experiences with your family.
                </p>
                <a href="#featured-packages" class="btn-discover-now">Discover Now</a>
            </div>
        </div>

        <div class="carousel-slide-item slide-2">
            <div class="hero-content-box">
                <span class="hero-tag-text">EXPLORE THE WORLD</span>
                <h1 class="hero-main-title">Find Your Perfect Tour At Travel</h1>
                <p class="hero-sub-para">
                    Discover breathtaking international holiday packages, flight reservations, and tailor-made travel itineraries crafted just for you.
                </p>
                <a href="#featured-packages" class="btn-discover-now">Discover Now</a>
            </div>
        </div>

        <div class="carousel-slide-item slide-3">
            <div class="hero-content-box">
                <span class="hero-tag-text">EXPLORE THE WORLD</span>
                <h1 class="hero-main-title">You Like To Go?</h1>
                <p class="hero-sub-para">
                    Experience stunning scenic landscapes, rich cultural heritage spots, and thrilling outdoor adventures around the globe.
                </p>
                <a href="#featured-packages" class="btn-discover-now">Discover Now</a>
            </div>
        </div>

    </div>

    <div class="search-overlap-container">
        <div class="search-card-box">
            <div>
                <asp:TextBox ID="txtSearchLocation" runat="server" CssClass="search-input-box" placeholder="Where do you want to go? (e.g. Dubai, Bali, Paris)"></asp:TextBox>
            </div>
            <div>
                <asp:DropDownList ID="ddlBudget" runat="server" CssClass="search-input-box">
                    <asp:ListItem Text="Any Budget" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Under ₹35,000" Value="1"></asp:ListItem>
                    <asp:ListItem Text="₹35,000 - ₹55,000" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Above ₹55,000" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button ID="btnSearchHome" runat="server" Text="🔍 Search" CssClass="btn-search-main" OnClick="btnSearchHome_Click" />
            </div>
        </div>
    </div>

    <div class="home-packages-section" id="featured-packages">
        <div class="home-packages-container">
            
            <div class="section-title-wrap">
                <div class="section-tag-lines">Popular Tours</div>
                <h2 class="section-main-heading">Featured Holiday Packages</h2>
            </div>

            <asp:DataList ID="dlDestinations" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnItemCommand="dlDestinations_ItemCommand">
                <HeaderTemplate>
                    <div class="packages-grid">
                </HeaderTemplate>

                <ItemTemplate>
                    <div class="packages-item-box">
                        <div class="packages-img-wrap">
                            <asp:Image ID="imgPkg" runat="server" ImageUrl='<%# Eval("PackageImage") %>' AlternateText='<%# Eval("PackageName") %>' />
                            <div class="packages-price-badge">
                                ₹<%# Eval("Price") %>
                            </div>
                            <div class="packages-info-strip">
                                <div class="info-strip-col">
                                    <i class="fa fa-map-marker-alt"></i> <%# Eval("Location") %>
                                </div>
                                <div class="info-strip-col">
                                    <i class="fa fa-calendar-alt"></i> 5 Days
                                </div>
                                <div class="info-strip-col">
                                    <i class="fa fa-user"></i> 2 Person
                                </div>
                            </div>
                        </div>

                        <div class="packages-content-area">
                            <h3 class="pkg-name-title"><%# Eval("PackageName") %></h3>
                            <span class="pkg-hotel-deal">HOTEL DEALS</span>
                            <div class="pkg-stars-row">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </div>
                            <p class="pkg-desc-text">
                                Explore top attractions, indulge in authentic dining, and relax in certified 4-star luxury accommodation.
                            </p>
                        </div>

                        <div class="packages-bottom-bar">
                            <asp:LinkButton ID="btnReadMore" runat="server" 
                                CommandName="cmd_pkgid" 
                                CommandArgument='<%# Eval("PackageId") %>' 
                                CssClass="btn-card-action">
                                View Details
                            </asp:LinkButton>

                            <asp:LinkButton ID="btnBookNow" runat="server" 
                                CommandName="cmd_book" 
                                CommandArgument='<%# Eval("PackageId") %>' 
                                CssClass="btn-card-action">
                                Book Now
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>

                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:DataList>

        </div>
    </div>

    <!-- JavaScript For Smooth Auto-Sliding Carousel -->
    <script type="text/javascript">
        var currentHeroIndex = 0;
        var heroSlides = document.querySelectorAll('.carousel-slide-item');
        var slideTimer = null;

        function showHeroSlide(index) {
            heroSlides = document.querySelectorAll('.carousel-slide-item');
            if (!heroSlides || heroSlides.length === 0) return;

            if (index >= heroSlides.length) currentHeroIndex = 0;
            else if (index < 0) currentHeroIndex = heroSlides.length - 1;
            else currentHeroIndex = index;

            heroSlides.forEach(function (slide) {
                slide.classList.remove('active');
            });
            heroSlides[currentHeroIndex].classList.add('active');
        }

        function nextHeroSlide() {
            showHeroSlide(currentHeroIndex + 1);
            resetSlideTimer();
        }

        function prevHeroSlide() {
            showHeroSlide(currentHeroIndex - 1);
            resetSlideTimer();
        }

        function startSlideTimer() {
            slideTimer = setInterval(function () {
                showHeroSlide(currentHeroIndex + 1);
            }, 4500); 
        }

        function resetSlideTimer() {
            if (slideTimer) clearInterval(slideTimer);
            startSlideTimer();
        }

        window.addEventListener('load', function () {
            startSlideTimer();
        });
    </script>
</asp:Content>