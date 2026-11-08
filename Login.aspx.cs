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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        void getcon()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Visible = false;

                if (Session["user"] != null)
                {
                    Response.Redirect("MyDashboard.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(email))
            {
                lblMsg.Visible = true;
                lblMsg.Text = "⚠️ Please enter your registered Email address.";
                lblMsg.Style["background-color"] = "#fee2e2";
                lblMsg.Style["color"] = "#dc2626";
                lblMsg.Style["border"] = "1px solid #f87171";
                return;
            }

            try
            {
                getcon();

               
                string q = "select * from emp_Tbl where Email='" + email + "'";

                da = new SqlDataAdapter(q, con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["user"] = ds.Tables[0].Rows[0]["Email"].ToString();
                    Session["username"] = ds.Tables[0].Rows[0]["name"].ToString();

                    if (ds.Tables[0].Columns.Contains("city"))
                    {
                        Session["city"] = ds.Tables[0].Rows[0]["city"].ToString();
                    }

                    con.Close();

                    Response.Redirect("MyDashboard.aspx");
                }
                else
                {
                    con.Close();
                    lblMsg.Visible = true;
                    lblMsg.Text = "❌ This Email is not registered! Please enter your registered email.";
                    lblMsg.Style["background-color"] = "#fee2e2";
                    lblMsg.Style["color"] = "#dc2626";
                    lblMsg.Style["border"] = "1px solid #f87171";
                }
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.Style["background-color"] = "#fee2e2";
                lblMsg.Style["color"] = "#dc2626";
                lblMsg.Style["border"] = "1px solid #f87171";
            }
        }
    }
}