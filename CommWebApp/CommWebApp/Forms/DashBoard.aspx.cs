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
            DashBoardGV.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
        }

    }
}