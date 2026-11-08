using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TRAVELPROJECT
{
    public partial class PackageDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtTravelDate.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");

                if (Request.QueryString["pkgId"] != null)
                {
                    ViewState["pid"] = Request.QueryString["pkgId"].ToString();
                    filldetails();
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        void filldetails()
        {
            getcon();
            da = new SqlDataAdapter("select * from Package_Tbl where PackageId=" + ViewState["pid"], con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                lblPackageName.Text = ds.Tables[0].Rows[0]["PackageName"].ToString();
                lblLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
                lblPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();

                string imgUrl = ds.Tables[0].Rows[0]["PackageImage"].ToString();
                if (!string.IsNullOrEmpty(imgUrl))
                {
                    imgMain.ImageUrl = imgUrl;
                    thumb0.ImageUrl = imgUrl; 
                }
            }

            con.Close();
        }

        protected void btnBookPackage_Click(object sender, EventArgs e)
        {
            if (ViewState["pid"] != null)
            {
                string travelers = hfTravelers.Value;
                string date = txtTravelDate.Text;

                Response.Redirect("Booking.aspx?pkgId=" + ViewState["pid"].ToString() + "&travelers=" + travelers + "&date=" + date);
            }
            else
            {
                Response.Redirect("Packages.aspx");
            }
        }
    }
}