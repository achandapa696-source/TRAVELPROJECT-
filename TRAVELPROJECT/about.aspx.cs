using System;
using System.Data;
using System.Web.UI;

namespace TRAVELPROJECT
{
    public partial class about : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGuideData();
            }
        }

        private void BindGuideData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("GuideName");
            dt.Columns.Add("Designation");
            dt.Columns.Add("GuideImage");

            dt.Rows.Add("Alex Morgan", "Europe & UK Specialist", "~/img/guide-1.jpg");
            dt.Rows.Add("Sophia Chen", "Asian Destinations Guide", "~/img/guide-2.jpg");
            dt.Rows.Add("David Miller", "Tropical & Island Expert", "~/img/guide-3.jpg");
            dt.Rows.Add("Emma Watson", "Wildlife & Adventure Guide", "~/img/guide-4.jpg");

            dlGuides.DataSource = dt;
            dlGuides.DataBind();
        }

        protected void btnExplore_Click(object sender, EventArgs e)
        {
            Response.Redirect("Packages.aspx");
        }
    }
}