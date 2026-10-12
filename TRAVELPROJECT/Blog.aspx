<%@ Page Title="Blog - Travela" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="TRAVELPROJECT.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .blog-card {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            transition: 0.5s;
        }
        .blog-card:hover {
            box-shadow: 0 0 25px rgba(0,0,0,0.15);
        }
        .blog-img-box {
            position: relative;
            overflow: hidden;
        }
        .blog-img-box img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: 0.5s;
        }
        .blog-card:hover .blog-img-box img {
            transform: scale(1.1);
        }
        .overlay-bar {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(19, 53, 123, 0.6);
            backdrop-filter: blur(2px);
            padding: 8px 15px;
            display: flex;
            justify-content: space-around;
            color: #ffffff;
            font-size: 14px;
        }
        .newsletter-box {
            background: linear-gradient(rgba(19, 53, 123, 0.75), rgba(19, 53, 123, 0.75)), url('img/breadcrumb-bg.jpg');
            background-position: center;
            background-size: cover;
            padding: 80px 0;
        }
        .newsletter-input-wrap {
            position: relative;
            max-width: 650px;
            margin: 0 auto;
        }
        .newsletter-input-wrap .form-control {
            height: 60px;
            border-radius: 30px;
            padding-left: 30px;
            padding-right: 150px;
            border: none;
        }
        .btn-sub {
            position: absolute;
            top: 5px;
            right: 5px;
            height: 50px;
            border-radius: 30px;
            padding: 0 30px;
            background-color: #13357B;
            color: #ffffff;
            font-weight: 600;
            border: none;
        }
    </style>

    <!-- Main Container Panel -->
    <asp:Panel ID="pnlMainContainer" runat="server" CssClass="container py-5">
        
        <!-- Header Section Panel -->
        <asp:Panel ID="pnlHeader" runat="server" CssClass="text-center mx-auto mb-5" style="max-width: 800px;">
            <asp:Panel ID="pnlTagLine" runat="server" CssClass="d-flex align-items-center justify-content-center mb-2">
                <asp:Panel ID="pnlLineLeft" runat="server" style="width: 40px; height: 2px; background-color: #13357B; margin-right: 10px;"></asp:Panel>
                <asp:Label ID="lblCategoryHeader" runat="server" Text="OUR BLOG" CssClass="text-primary text-uppercase mb-0 fw-bold" style="letter-spacing: 2px;"></asp:Label>
                <asp:Panel ID="pnlLineRight" runat="server" style="width: 40px; height: 2px; background-color: #13357B; margin-left: 10px;"></asp:Panel>
            </asp:Panel>

            <asp:Label ID="lblMainTitle" runat="server" Text="Popular Travel Blogs" CssClass="display-5 fw-bold mb-3 d-block" style="color: #011233;"></asp:Label>
            <asp:Label ID="lblMainDesc" runat="server" Text="Lorem ipsum dolor sit amet consectetur adipisicing elit. Deleniti deserunt tenetur sapiente atque. Magni non explicabo beatae sit, vel reiciendis consectetur numquam id similique sunt error obcaecati ducimus officia meiores." CssClass="text-muted fs-6 d-block"></asp:Label>
        </asp:Panel>

        <!-- Blog Cards Grid Panel -->
        <asp:Panel ID="pnlGridRow" runat="server" CssClass="row g-4">
            <asp:Repeater ID="rptBlogs" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="pnlCol" runat="server" CssClass="col-lg-4 col-md-6">
                        <asp:Panel ID="pnlBlogCard" runat="server" CssClass="blog-card">
                            
                            <!-- Image Box Panel -->
                            <asp:Panel ID="pnlImgBox" runat="server" CssClass="blog-img-box">
                                <asp:Image ID="imgBlog" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Title") %>' />
                                
                                <asp:Panel ID="pnlOverlay" runat="server" CssClass="overlay-bar">
                                    <asp:Panel ID="pnlDate" runat="server"><i class="fa fa-calendar-alt me-2"></i><asp:Literal ID="litDate" runat="server" Text='<%# Eval("PostDate") %>'></asp:Literal></asp:Panel>
                                    <asp:Panel ID="pnlLikes" runat="server"><i class="fa fa-thumbs-up me-2"></i><asp:Literal ID="litLikes" runat="server" Text='<%# Eval("Likes") %>'></asp:Literal></asp:Panel>
                                    <asp:Panel ID="pnlComments" runat="server"><i class="fa fa-comment me-2"></i><asp:Literal ID="litComments" runat="server" Text='<%# Eval("Comments") %>'></asp:Literal></asp:Panel>
                                </asp:Panel>
                            </asp:Panel>

                            <!-- Content Details Panel -->
                            <asp:Panel ID="pnlContent" runat="server" CssClass="p-4">
                                <asp:Label ID="lblAuthor" runat="server" CssClass="text-muted d-block mb-2" style="font-size: 15px;">Posted By: <%# Eval("Author") %></asp:Label>
                                <asp:Label ID="lblTitle" runat="server" CssClass="h4 fw-bold d-block mb-3" style="color: #011233;"><%# Eval("Title") %></asp:Label>
                                <asp:Label ID="lblDesc" runat="server" CssClass="text-muted d-block mb-4" style="font-size: 14px; line-height: 1.6;"><%# Eval("Description") %></asp:Label>
                                
                                <asp:HyperLink ID="hlReadMore" runat="server" NavigateUrl='<%# "BlogDetails.aspx?id=" + Eval("BlogId") %>' CssClass="btn btn-primary rounded-pill px-4 py-2 fw-bold" style="background-color: #13357B; border: none;">
                                    Read More
                                </asp:HyperLink>
                            </asp:Panel>

                        </asp:Panel>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
        </asp:Panel>

    </asp:Panel>

    <!-- Newsletter Panel Section -->
    <asp:Panel ID="pnlNewsletterSection" runat="server" CssClass="container-fluid newsletter-box my-5">
        <asp:Panel ID="pnlNewsletterInner" runat="server" CssClass="container text-center">
            
            <asp:Panel ID="pnlSubHeaderWrap" runat="server" CssClass="d-flex align-items-center justify-content-center mb-2">
                <asp:Panel ID="pnlLineLeft2" runat="server" style="width: 40px; height: 2px; background-color: #ffffff; margin-right: 10px;"></asp:Panel>
                <asp:Label ID="lblSubHeader" runat="server" Text="SUBSCRIBE" CssClass="text-white text-uppercase mb-0 fw-bold" style="letter-spacing: 2px;"></asp:Label>
                <asp:Panel ID="pnlLineRight2" runat="server" style="width: 40px; height: 2px; background-color: #ffffff; margin-left: 10px;"></asp:Panel>
            </asp:Panel>

            <asp:Label ID="lblNewsTitle" runat="server" Text="Our Newsletter" CssClass="display-4 text-white fw-bold mb-3 d-block"></asp:Label>
            <asp:Label ID="lblNewsDesc" runat="server" Text="Lorem ipsum dolor sit amet consectetur adipisicing elit. Laborum tempore nam, architecto doloremque velit explicabo? Voluptate sunt eveniet fuga eligendi! Expedita laudantium fugiat corrupti eum cum repellat a laborum quasi." CssClass="text-white-50 mb-4 mx-auto d-block" style="max-width: 700px;"></asp:Label>

            <!-- Newsletter Form Controls -->
            <asp:Panel ID="pnlInputWrap" runat="server" CssClass="newsletter-input-wrap">
                <asp:TextBox ID="txtSubscriberEmail" runat="server" TextMode="Email" CssClass="form-control" Placeholder="Your email"></asp:TextBox>
<asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="btn btn-sub" />            </asp:Panel>
            
            <asp:Label ID="lblSubscribeMsg" runat="server" CssClass="d-block mt-3 text-white fw-bold" Visible="false"></asp:Label>

        </asp:Panel>
    </asp:Panel>

</asp:Content>