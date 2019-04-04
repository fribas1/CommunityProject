using CommWebApp.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
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
            string currentUserId = User.Identity.GetUserId();
            var userManager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

            if (Request.QueryString.Count == 0)
            {
                Response.Redirect("/Forms/DashBoard.aspx?currentUserId=" + currentUserId);
            }

            List<string> roles = userManager.GetRoles(currentUserId).ToList();
            var authorAssociate = new List<string> { "Author", "Associate Editor" };
            var author = new List<string> { "Author" };
            var associate = new List<string> { "Associate Editor" };
            var editor = new List<string> { "Editor" };

            if (roles.All(authorAssociate.Contains) == true)
            {
                DashBoardGV.Visible = false;
                panelReview.Visible = true;
                panelArticles.Visible = true;
                panelSearchAssociate.Visible = true;
                panelSearchAuthor.Visible = true;
                panelSearchEditor.Visible = false;
            }

            if (roles.All(author.Contains) == true)
            {
                DashBoardGV.Visible = false;
                panelReview.Visible = false;
                panelArticles.Visible = true;
                panelSearchAssociate.Visible = false;
                panelSearchAuthor.Visible = true;
                panelSearchEditor.Visible = false;
            }

            if (roles.All(associate.Contains) == true)
            {
                DashBoardGV.Visible = false;
                panelReview.Visible = true;
                panelArticles.Visible = false;
                panelSearchAssociate.Visible = true;
                panelSearchAuthor.Visible = false;
                panelSearchEditor.Visible = false;
            }

            if (roles.All(editor.Contains) == true)
            {
                DashBoardGV.Visible = true;
                panelReview.Visible = false;
                panelArticles.Visible = false;
                panelSearchAssociate.Visible = false;
                panelSearchAuthor.Visible = false;
                panelSearchEditor.Visible = true;
            }

        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Forms/Login");
        }



        protected void DashBoardGV_SelectedIndexChanged(object sender, EventArgs e)
        {

            int index = DashBoardGV.SelectedRow.RowIndex;
            int postID = Convert.ToInt32(DashBoardGV.DataKeys[index][0]);
            ViewState["_postID"] = postID;

            GridViewRow row1 = DashBoardGV.SelectedRow;

            if (row1.Cells[1].Text== "Final Review")
            {
                lblhiddenPostID.Text = postID.ToString();
                DataView dv = (DataView)DSComment.Select(DataSourceSelectArguments.Empty);
                string commentsToEditor = (string)dv.Table.Rows[0][5];
                string commetstoAuthor = (string)dv.Table.Rows[0][1];
                string[] feedbackCommentsEditor = commentsToEditor.Split('|');
                lblass1toAuthor.Text = "Comments to the Author: " + commetstoAuthor;
                lblass1toAuthor.Visible = true;
                lblAss1toEditor.Text = "Comments to the Editor: " + feedbackCommentsEditor[1];
                lblAss1toEditor.Visible = true;

                DataView dvAss = (DataView)DSasses12.Select(DataSourceSelectArguments.Empty);
                
                ddlAssEdit1.SelectedValue = (string)dvAss.Table.Rows[0][1];

            }

            DashBoardGV.Visible = false;
            lblMessage.Visible = false;
            panelAssociate.Visible = true;


        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            InsertAssEdit1();
            InsertAssEdit2();
            UpdatePost();
            lblMessage.Text = "Associate Editors were added successfully.";
            lblMessage.Visible = true;
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

        protected void gvReview_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = gvReview.SelectedRow.RowIndex;
            int postId = Convert.ToInt32(gvReview.DataKeys[index][0]);
            Response.Redirect("~/Forms/ReviewPage.aspx?Post=" + postId);                        
        }
    }
}