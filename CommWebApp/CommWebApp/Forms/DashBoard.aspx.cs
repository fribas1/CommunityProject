using CommWebApp.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
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

        protected void btnAssociate_Click(object sender, EventArgs e)
        {
            DashBoardGV.Visible = false;
            AssociateGV.Visible = true;
            GridViewRow row = DashBoardGV.SelectedRow;
            int postID = Convert.ToInt32(row.Cells[6].Text);
            txtTest.Text = postID.ToString();
        }
    }
}