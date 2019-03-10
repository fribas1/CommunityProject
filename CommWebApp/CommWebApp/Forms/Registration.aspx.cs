using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using CommWebApp.Models;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace CommWebApp.Forms
{
    public partial class Registration : System.Web.UI.Page
    {
        List<ListItem> selectedTags = new List<ListItem>();
        public string userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Forms/Login");
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
                foreach (ListItem item in cblExpertise.Items)
                    if (item.Selected) selectedTags.Add(item);

                userId = GetNewUserId(Email.Text);

                UpdateUser(FirstName.Text, LastName.Text, Email.Text);
                InsertExpertise(userId);                                

                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl("~/Forms/DashBoard", Response);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void UpdateUser(string first, string last, string email)
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();

                cmd.CommandText = "UPDATE [AspNetUsers] SET "
                                    + "[FirstName] = @FirstName, "
                                    + "[LastName] = @LastName";                                    

                if (chkConsider.Checked)
                    cmd.CommandText += ", [ConsiderAsAssociate] = 1";
                
                cmd.CommandText += " WHERE[Email] = @Email";

                cmd.Parameters.AddWithValue("@FirstName", first);
                cmd.Parameters.AddWithValue("@LastName", last);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                cmd.ExecuteNonQuery();                               
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void InsertExpertise(string id)
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();

                if (selectedTags.Count > 1)
                {
                    cmd.CommandText = "";
                    for (int i = 0; i < selectedTags.Count; i++)
                    {
                        cmd.CommandText += "INSERT INTO [Expertise] (UserId, TagId) "
                                        + "VALUES (@UserId, " + Convert.ToInt32(selectedTags[i].Value)
                                        + ") ";
                    }
                }
                else
                {
                    cmd.CommandText = "INSERT INTO [Expertise] (UserId, TagId) "
                                     + "VALUES (@UserId, @TagId)";

                    string tagId = selectedTags[0].Value;

                    cmd.Parameters.AddWithValue("@TagId", Convert.ToInt32(tagId));
                }

                cmd.Parameters.AddWithValue("@UserId", id);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }

        protected string GetNewUserId(string email)
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            string id = "";

            try
            {
                SqlCommand cmd = new SqlCommand("SELECT Id FROM [AspNetUsers] "
                                                + "WHERE [Email] = @Email", conn);

                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                id = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }

            return id;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/Login");
        }
    }
}