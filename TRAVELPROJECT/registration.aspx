<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="TRAVELPROJECT.registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-4">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <!-- Form Card -->
                <div class="card border-0 shadow-lg rounded-3 mb-5">
                    <div class="card-header text-center text-white py-4" style="background-color: #13357B;">
                        <h3 class="mb-0 text-white font-weight-bold"><i class="fa fa-map-marker-alt me-2"></i>TRAVELA</h3>
                        <p class="mb-0 small opacity-75">Create your new account</p>
                    </div>
                    <div class="card-body p-4 p-md-5"
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Full Name</label>
                                <asp:TextBox ID="txtnm" runat="server" CssClass="form-control" Placeholder="Enter Full Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold d-block">Gender</label>
                                <asp:RadioButtonList ID="rdbgen" runat="server" RepeatDirection="Horizontal" CssClass="d-inline-flex gap-3 align-items-center mt-2">
                                    <asp:ListItem Value="male">&nbsp;Male</asp:ListItem>
                                    <asp:ListItem Value="Female">&nbsp;Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                            <div class="col-md-6"></div>
                                <label class="form-label fw-bold">Email Address</label>
                                <asp:TextBox ID="txteml" runat="server" CssClass="form-control" Placeholder="name@example.com"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">City</label>
                                <asp:DropDownList ID="dropdown" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="-1">-- Select City --</asp:ListItem>
                                    <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                    <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                    <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">Mobile Number</label>
                                <asp:TextBox ID="txtmbl" runat="server" CssClass="form-control" Placeholder="Enter Mobile"></asp:TextBox>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-bold">&nbsp;Image</label>
                                <asp:FileUpload ID="Flpimg" runat="server" CssClass="form-control" />
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-bold">Address</label>
                                <asp:TextBox ID="txtadd" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" Placeholder="Enter Address"></asp:TextBox>
                            </div>
                            <div class="col-12 text-center mt-4">
                                <asp:Button ID="button2" runat="server" Text="Save" CssClass="btn text-white fw-bold px-5 py-2" Style="background-color: #13357B;" OnClick="button2_Click" />
                            </div>
                            <div class="col-12 text-center mt-2">
                                <span class="text-muted">Already registered? </span>
                                <a href="login.aspx" class="fw-bold text-decoration-none" style="color: #13357B;">Login Here</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- GridView Card Section -->
                <div class="card border-0 shadow-sm rounded-3">
                    <div class="card-header bg-white py-3">
                        <h4 class="mb-0 fw-bold" style="color: #13357B;"><i class="fa fa-list me-2"></i>Registered Details</h4>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <asp:GridView ID="gridview2" runat="server" AutoGenerateColumns="False" OnRowCommand="gridview2_RowCommand" CssClass="table table-hover table-striped align-middle mb-0">
                                <Columns>
                                    <asp:TemplateField HeaderText="Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Gender">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="50px" Width="50px" CssClass="border" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd-edit" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-sm btn-outline-primary">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Update">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="cmd-edit" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-sm btn-outline-success">Update</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd-del" CommandArgument='<%# Eval("id") %>' CssClass="btn btn-sm btn-outline-danger">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>