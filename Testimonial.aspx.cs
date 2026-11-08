using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace TRAVELPROJECT
{
    public partial class Testimonial : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TravelDB.mdf;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTestimonials();
            }
        }

        // Fetch testimonials matching exact column names
        private void LoadTestimonials()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT Id, FullName, Destination, Rating, Comment, ImageUrl, CreatedDate 
                                 FROM Testimonials 
                                 ORDER BY Id DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    rptTestimonials.DataSource = dt;
                    rptTestimonials.DataBind();
                }
            }
        }

        // Save new user review into Testimonials table
        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string defaultAvatar = "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150";

                    string query = @"INSERT INTO Testimonials (FullName, Destination, Rating, Comment, ImageUrl, CreatedDate, IsApproved) 
                                     VALUES (@FullName, @Destination, @Rating, @Comment, @ImageUrl, GETDATE(), 1)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Destination", txtDestination.Text.Trim());
                        cmd.Parameters.AddWithValue("@Rating", Convert.ToInt32(ddlRating.SelectedValue));
                        cmd.Parameters.AddWithValue("@Comment", txtComment.Text.Trim());
                        cmd.Parameters.AddWithValue("@ImageUrl", defaultAvatar);

                        con.Open();
                        int rows = cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMsg.Visible = true;
                            lblMsg.CssClass = "alert alert-success d-block mb-3";
                            lblMsg.Text = "<strong>Thank you!</strong> Your feedback has been recorded successfully.";

                            // Clear Form Inputs
                            txtFullName.Text = "";
                            txtDestination.Text = "";
                            txtComment.Text = "";

                            LoadTestimonials();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.CssClass = "alert alert-danger d-block mb-3";
                lblMsg.Text = "Error: " + ex.Message;
            }
        }
    }
}