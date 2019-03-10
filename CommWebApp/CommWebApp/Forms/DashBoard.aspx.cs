using CommWebApp.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommWebApp.Forms
{
    public partial class DashBoard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated) Response.Redirect("~/Forms/Login");
            // Passing current user id to a QueryString to filter DashBoard
            if (Request.QueryString.Count == 0)
            {
                string currentUserId = User.Identity.GetUserId();
                Response.Redirect("/Forms/DashBoard.aspx?currentUserId=" + currentUserId);
            }

            btnR.Visible = false;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Forms/Login");
        }

        protected void btnA_Click(object sender, EventArgs e)
        {
            DashBoardGV.Visible = false;
            btnR.Visible = true;
            btnA.Visible = false;
        }

        protected void btnR_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Forms/ReviewPage.aspx");
        }

        protected void DashBoardGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = DashBoardGV.SelectedRow.RowIndex;
            int postID = Convert.ToInt32(DashBoardGV.DataKeys[index][0]);
            ViewState["_postID"] = postID;
            DashBoardGV.Visible = false;
            panelAssociate.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertAssEdit1();
            InsertAssEdit2();
            UpdatePost();
            lblMessage.Text = "Associate Editors were added successfully.";
            DashBoardGV.DataBind();
            DashBoardGV.Visible = true;
            panelAssociate.Visible = false;
        }

        protected void InsertAssEdit1()
        {
            int postID = Convert.ToInt32(ViewState["_postID"]);

            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [AspNetUserRoles] (UserId, RoleId, PostId) "
                                  + "VALUES (@userID, @roleID, @postID)";

                cmd.Parameters.AddWithValue("@userID", ddlAssEdit1.SelectedValue);
                cmd.Parameters.AddWithValue("@roleID", 2);
                cmd.Parameters.AddWithValue("@postID", postID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void InsertAssEdit2()
        {
            int postID = Convert.ToInt32(ViewState["_postID"]);

            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [AspNetUserRoles] (UserId, RoleId, PostId) "
                                  + "VALUES (@userID, @roleID, @postID)";

                cmd.Parameters.AddWithValue("@userID", ddlAssEdit2.SelectedValue);
                cmd.Parameters.AddWithValue("@roleID", 2);
                cmd.Parameters.AddWithValue("@postID", postID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }

        protected void UpdatePost()
        {
            int postID = Convert.ToInt32(ViewState["_postID"]);

            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "UPDATE [Post] SET CurrentStatusId = @status WHERE Id = @postID";

                cmd.Parameters.AddWithValue("@status", 3);
                cmd.Parameters.AddWithValue("@postID", postID);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }

    }
}