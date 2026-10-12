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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string s;

        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();

            if (!IsPostBack)
            {
                fillpackages();
            }
        }

        // 2t_connectivity જેવી સાદી getcon
        void getcon()
        {
            s = ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString;
            con = new SqlConnection(s);
            con.Open();
        }

        // પેકેજ ડેટાબેઝમાંથી લાવવા માટે
        void fillpackages()
        {
            getcon();
            da = new SqlDataAdapter("select * from Package_Tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        // View Details ક્લિક -> PackageDetails.aspx પર જશે
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_pkgid")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["pid"] = id;
                Response.Redirect("PackageDetails.aspx?pkgId=" + ViewState["pid"]);
            }
        }

        // નો-પેરામીટર સર્ચ ક્વેરી (No Parameterized Query - As per Sir's Rule)
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getcon();
            string q = "select * from Package_Tbl";

            if (ddlCities.SelectedValue != "-1")
            {
                q = "select * from Package_Tbl where Location='" + ddlCities.SelectedValue + "'";
            }

            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }

        protected void lnkViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Packages.aspx");
        }
    }
}