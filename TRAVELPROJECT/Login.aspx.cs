//using System;
//using System.Data.SqlClient;

//namespace TRAVELPROJECT
//{
//    public partial class Login : System.Web.UI.Page
//    {
//        SqlConnection con;
//        SqlCommand cmd;
//        int i;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            con = new SqlConnection(
//                @"Data Source=(LocalDB)\MSSQLLocalDB;
//                AttachDbFilename=|DataDirectory|\TravelDB.mdf;
//                Integrated Security=True"
//            );

//            con.Open();
//        }

//        protected void btnLogin_Click(object sender, EventArgs e)
//        {
//            if (!String.IsNullOrEmpty(txtUsername.Text) &&
//                !String.IsNullOrEmpty(txtPassword.Text))
//            {
//                cmd = new SqlCommand(
//                    "select count(*) from Registration " +
//                    "where Email='" + txtUsername.Text +
//                    "' and Password='" + txtPassword.Text + "'",
//                    con);

//                i = Convert.ToInt16(cmd.ExecuteScalar());

//                if (i > 0)
//                {
//                    Session["user"] = txtUsername.Text;
//                    Session["password"] = txtPassword.Text;

//                    Response.Redirect("WebForm2.aspx");
//                }
//                else
//                {
//                    Response.Write("Invalid user name and password");
//                }
//            }
//            else
//            {
//                Response.Write("Please enter user name and password");
//            }
//        }
//    }
//}



using System;
using System.Data.SqlClient;

namespace TRAVELPROJECT
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        int i;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text != "" && txtPassword.Text != "")
            {
                con = new SqlConnection(
                    @"Data Source=(LocalDB)\MSSQLLocalDB;
                    AttachDbFilename=|DataDirectory|\TravelDB.mdf;
                    Integrated Security=True"
                );

                con.Open();

                string query =
                    "select count(*) from Registration " +
                    "where Email='" + txtUsername.Text +
                    "' and Password='" + txtPassword.Text + "'";

                cmd = new SqlCommand(query, con);

                i = Convert.ToInt32(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Session["user"] = txtUsername.Text;

                    Response.Redirect("WebForm2.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Email or Password";
                }

                con.Close();
            }
            else
            {
                lblMessage.Text = "Please enter Email and Password";
            }
        }
    }
}