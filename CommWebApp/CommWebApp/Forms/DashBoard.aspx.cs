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
    }
}