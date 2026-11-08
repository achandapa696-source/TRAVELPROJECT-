using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace TRAVELPROJECT
{
    public partial class Destination : System.Web.UI.Page
    {
        // travel database connection
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TravelDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDestinations();
            }
        }

        
        private void LoadDestinations()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Destinations";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                rptDestinations.DataSource = dt;
                                rptDestinations.DataBind();
                                lblMessage.Visible = false;
                            }
                            else
                            {
                                rptDestinations.DataSource = null;
                                rptDestinations.DataBind();
                                lblMessage.Text = "હાલમાં કોઈ ડેસ્ટિનેશન ઉમેરેલા નથી.";
                                lblMessage.Visible = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Database Error: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        // Search button click
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text.Trim();

            if (string.IsNullOrEmpty(keyword))
            {
                LoadDestinations();
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    
                    string query = "SELECT * FROM Destinations WHERE DestinationName LIKE @Search OR Country LIKE @Search";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + keyword + "%");

                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);

                            if (dt.Rows.Count > 0)
                            {
                                rptDestinations.DataSource = dt;
                                rptDestinations.DataBind();
                                lblMessage.Visible = false;
                            }
                            else
                            {
                                rptDestinations.DataSource = null;
                                rptDestinations.DataBind();
                                lblMessage.Text = "Sorry, no destinations found for '" + keyword + "'";
                                lblMessage.Visible = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Search Error: " + ex.Message;
                lblMessage.Visible = true;
            }
        }

        // Reset Filter / Show All 
        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            LoadDestinations();
        }
    }
}