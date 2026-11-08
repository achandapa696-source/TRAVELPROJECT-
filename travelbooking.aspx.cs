using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TRAVELPROJECT
{
    public partial class Booking : System.Web.UI.Page
    {
        // Database Connection String
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TravelDB.mdf;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDestinations();
            }
        }

        // Method to populate destinations into dropdown
        private void LoadDestinations()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string query = "SELECT DestinationId, DestinationName FROM Destinations WHERE IsActive = 1";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        ddlDestination.DataSource = dr;
                        ddlDestination.DataTextField = "DestinationName";
                        ddlDestination.DataValueField = "DestinationId";
                        ddlDestination.DataBind();
                    }
                }
            }
            catch
            {
                // Fallback static list
                ddlDestination.Items.Clear();
                ddlDestination.Items.Add(new ListItem("Royal Rajasthan Heritage Tour", "1"));
                ddlDestination.Items.Add(new ListItem("Goa Beach Holiday", "2"));
                ddlDestination.Items.Add(new ListItem("Manali Snow Adventure", "3"));
                ddlDestination.Items.Add(new ListItem("Kerala Backwaters", "4"));
            }
        }

        // Submit Booking data to database
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    // Exact insert query matching your Bookings table columns
                    string query = @"INSERT INTO Bookings (DestinationId, DestinationName, FullName, Email, Phone, TravelDate, TotalPersons, SpecialRequest, BookingDate)
                                     VALUES (@DestinationId, @DestinationName, @FullName, @Email, @Phone, @TravelDate, @TotalPersons, @SpecialRequest, GETDATE())";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@DestinationId", Convert.ToInt32(ddlDestination.SelectedValue));
                        cmd.Parameters.AddWithValue("@DestinationName", ddlDestination.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                        cmd.Parameters.AddWithValue("@TravelDate", DateTime.Parse(txtTravelDate.Text));
                        cmd.Parameters.AddWithValue("@TotalPersons", Convert.ToInt32(txtTotalPersons.Text.Trim()));
                        cmd.Parameters.AddWithValue("@SpecialRequest", txtSpecialRequest.Text.Trim());

                        con.Open();
                        int rows = cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            lblMessage.Visible = true;
                            lblMessage.CssClass = "alert alert-success d-block mb-4";
                            lblMessage.Text = "<strong>Booking Successful!</strong> Your tour for " + ddlDestination.SelectedItem.Text + " has been booked successfully.";

                            // Clear Form Inputs
                            txtFullName.Text = "";
                            txtEmail.Text = "";
                            txtPhone.Text = "";
                            txtTravelDate.Text = "";
                            txtSpecialRequest.Text = "";
                            txtTotalPersons.Text = "1";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.CssClass = "alert alert-danger d-block mb-4";
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}