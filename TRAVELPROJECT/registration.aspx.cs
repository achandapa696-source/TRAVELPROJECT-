using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TRAVELPROJECT
{
    public partial class registration : Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string Fnm = "";
        string s;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Fillgrid();
            }
        }

        void getcon()
        {
            s = ConfigurationManager.ConnectionStrings["TravelDB"].ConnectionString;
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void imgupload()
        {
            if (Flpimg.HasFile)
            {
                Fnm = "Images/" + Flpimg.FileName;
                Flpimg.SaveAs(Server.MapPath(Fnm));
            }
        }

        void clear()
        {
            txtnm.Text = "";
            txteml.Text = "";
            txtadd.Text = "";
            txtmbl.Text = "";
            rdbgen.SelectedIndex = -1;
            dropdown.SelectedIndex = -1;
            ViewState["id"] = null;
        }

        void Fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from emp_Tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            gridview2.DataSource = ds;
            gridview2.DataBind();
            con.Close();
        }

        void Filldata()
        {
            getcon();
            da = new SqlDataAdapter("select * from emp_Tbl where id = '" + ViewState["id"] + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtnm.Text = ds.Tables[0].Rows[0]["name"].ToString();
                txteml.Text = ds.Tables[0].Rows[0]["Email"].ToString();
                txtadd.Text = ds.Tables[0].Rows[0]["Address"].ToString();
                txtmbl.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                dropdown.SelectedValue = ds.Tables[0].Rows[0]["city"].ToString();

                if (ds.Tables[0].Rows[0]["Gender"].ToString().ToLower() == "male")
                {
                    rdbgen.SelectedValue = "male";
                }
                else
                {
                    rdbgen.SelectedValue = "Female";
                }
            }
            con.Close();
        }

        protected void button2_Click(object sender, EventArgs e)
        {
            if (button2.Text == "Save")
            {
                getcon();
                imgupload();
                cmd = new SqlCommand("Insert into emp_Tbl (name, Gender, Email, city, Address, mobile, Image) values ('"
                    + txtnm.Text + "','"
                    + rdbgen.SelectedValue + "','"
                    + txteml.Text + "','"
                    + dropdown.SelectedValue + "','"
                    + txtadd.Text + "','"
                    + txtmbl.Text + "','"
                    + Fnm + "')", con);

                cmd.ExecuteNonQuery();
                con.Close();

                Fillgrid();
                clear();
            }
            else
            {
                getcon();
                imgupload();

                string updateQuery = "";
                if (!string.IsNullOrEmpty(Fnm))
                {
                    updateQuery = "update emp_Tbl set name='" + txtnm.Text + "', Gender='" + rdbgen.SelectedValue + "', Email='" + txteml.Text + "', city='" + dropdown.SelectedValue + "', Address='" + txtadd.Text + "', mobile='" + txtmbl.Text + "', Image='" + Fnm + "' where id='" + ViewState["id"] + "'";
                }
                else
                {
                    updateQuery = "update emp_Tbl set name='" + txtnm.Text + "', Gender='" + rdbgen.SelectedValue + "', Email='" + txteml.Text + "', city='" + dropdown.SelectedValue + "', Address='" + txtadd.Text + "', mobile='" + txtmbl.Text + "' where id='" + ViewState["id"] + "'";
                }

                cmd = new SqlCommand(updateQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();

                Fillgrid();
                clear();
                button2.Text = "Save";
            }
        }

        protected void gridview2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd-edit")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                button2.Text = "Update";
                Filldata();
            }
            else if (e.CommandName == "cmd-del")
            {
                getcon();
                cmd = new SqlCommand("delete from emp_Tbl where id = '" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                Fillgrid();
                clear();
            }
        }
    }
}