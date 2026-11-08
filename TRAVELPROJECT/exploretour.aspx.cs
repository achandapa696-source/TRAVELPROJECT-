using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TRAVELPROJECT
{
    public partial class exploretour : System.Web.UI.Page
    {
        // TravelDB database connection (LocalDB)
        private string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TravelDB.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // પ્રથમ વખત પેજ લોડ થાય ત્યારે ડેટા લોડ કરશે
                LoadDestinations();
            }
        }

        // Database માંથી Destinations લાવવા માટે
        private void LoadDestinations(string searchTerm = "", decimal maxBudget = 0)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT DestinationId, DestinationName, Country, Description, Price, ImageUrl FROM Destinations WHERE 1=1";

                if (!string.IsNullOrWhiteSpace(searchTerm))
                {
                    query += " AND (DestinationName LIKE @Search OR Country LIKE @Search)";
                }

                if (maxBudget > 0)
                {
                    query += " AND Price <= @Budget";
                }

                query += " ORDER BY DestinationId DESC";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrWhiteSpace(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + searchTerm + "%");
                    }

                    if (maxBudget > 0)
                    {
                        cmd.Parameters.AddWithValue("@Budget", maxBudget);
                    }

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptDestinations.DataSource = dt;
                            rptDestinations.DataBind();
                            rptDestinations.Visible = true;
                            pnlNoData.Visible = false;
                        }
                        else
                        {
                            rptDestinations.Visible = false;
                            pnlNoData.Visible = true;
                        }
                    }
                }
            }
        }

        // Search બટન માટે
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text.Trim();
            decimal budget = 0;
            decimal.TryParse(ddlBudget.SelectedValue, out budget);

            LoadDestinations(search, budget);
        }

        // Reset બટન માટે
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlBudget.SelectedIndex = 0;
            LoadDestinations();
        }

        // Book Now બટન માટે
        protected void btnBook_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string destinationId = btn.CommandArgument;
            Response.Redirect("Booking.aspx?DestinationId=" + destinationId);
        }
    }
}