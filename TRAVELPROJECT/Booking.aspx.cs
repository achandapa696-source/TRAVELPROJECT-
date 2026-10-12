using System;
using System.Web.UI;

namespace TRAVELPROJECT
{
    public partial class Booking : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDateTime.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        // આ મેથડનું નામ Booking.aspx માં આપેલા OnClick="btnBookNow_Click" સાથે જ પણ એક્ઝેક્ટ મેચ થવું જોઈએ
        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtName.Text.Trim();
                string destination = ddlDestination.SelectedValue;
                string travelDate = txtDateTime.Text;
                string phone = txtPhone.Text.Trim();

                lblSuccessMsg.Text = $"<strong>Thank you, {name}!</strong> Your booking request for <strong>{destination}</strong> on <strong>{travelDate}</strong> has been submitted successfully. We will contact you at {phone} soon.";
                pnlSuccessAlert.Visible = true;

                ClearForm();
            }
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtDateTime.Text = string.Empty;
            ddlDestination.SelectedIndex = 0;
            ddlPersons.SelectedIndex = 0;
            ddlCategories.SelectedIndex = 0;
            txtSpecialRequest.Text = string.Empty;
        }
    }
}