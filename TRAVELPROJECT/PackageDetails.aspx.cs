using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TRAVELPROJECT
{
    public partial class PackageDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["pkgId"] != null)
                {
                    string id = Request.QueryString["pkgId"].ToString();
                    ViewState["pid"] = id;
                    loaddetails();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        void getcon()
        {
            s = ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString;
            con = new SqlConnection(s);
            con.Open();
        }

        void loaddetails()
        {
            getcon();
            da = new SqlDataAdapter("select * from Package_Tbl where PackageId=" + ViewState["pid"], con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblBannerTitle.Text = ds.Tables[0].Rows[0]["PackageName"].ToString();
                imgTour.ImageUrl = ds.Tables[0].Rows[0]["PackageImage"].ToString();
                lblLocationBadge.Text = "📍 " + ds.Tables[0].Rows[0]["Location"].ToString();
                lblPrice.Text = "₹ " + ds.Tables[0].Rows[0]["Price"].ToString();
            }
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (ViewState["pid"] != null)
            {
                Response.Redirect("Booking.aspx?pkgId=" + ViewState["pid"].ToString());
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}