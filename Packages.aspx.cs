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
    public partial class Packages : System.Web.UI.Page
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
                bindPackages();
            }
        }

        void bindPackages()
        {
            getcon();
            // Sir's rule: Direct concatenation without parameters
            da = new SqlDataAdapter("select * from Package_Tbl order by PackageId desc", con);
            ds = new DataSet();
            da.Fill(ds);

            dlPackages.DataSource = ds;
            dlPackages.DataBind();

            con.Close();
        }

        protected void dlPackages_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_pkgid")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["pid"] = id;
                Response.Redirect("PackageDetails.aspx?pkgId=" + ViewState["pid"].ToString());
            }
            else if (e.CommandName == "cmd_book")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["pid"] = id;
                Response.Redirect("Booking.aspx?pkgId=" + ViewState["pid"].ToString());
            }
        }
    }
}