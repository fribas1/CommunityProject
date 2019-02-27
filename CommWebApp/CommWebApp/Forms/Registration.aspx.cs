using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CommWebApp.Models;
using System.Data.SqlClient;

namespace CommWebApp.Forms
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {                        
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text,
                                                PhoneNumber = (Phone.Text.Length > 0) ? Phone.Text : null };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection conn = new SqlConnection(connection);
                
                try
                {
                    SqlCommand cmd = new SqlCommand("UPDATE [AspNetUsers] SET "
                                                    + "[FirstName] = @FirstName, "
                                                    + "[LastName] = @LastName "
                                                    + "WHERE [Email] = @Email", conn);

                    cmd.Parameters.AddWithValue("@FirstName", FirstName.Text);                   
                    cmd.Parameters.AddWithValue("@LastName", LastName.Text);
                    cmd.Parameters.AddWithValue("@Email", Email.Text);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.ToString();
                }                                
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}