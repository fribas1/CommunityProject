using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommWebApp.Forms
{
    public partial class InstructionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void editAssEditor_Click(object sender, EventArgs e)
        {
            pnlEditAss.Visible = true;
            pnlMain.Visible = false;
            lblCurrentEdit.Text = "Editing Associate Editors Instructions";
        }

        protected void editAuthorIns_Click(object sender, EventArgs e)
        {
            pnlEditAuthor.Visible = true;
            pnlMain.Visible = false;
            lblCurrentEdit.Text = "Editing Authors Instructions";
        }

        protected void btnSaveAss_Click(object sender, EventArgs e)
        {
            txtAssEditorIns.Text = txtEditAssEditor.Text;
            pnlEditAss.Visible = false;
            pnlMain.Visible = true;
        }

        protected void btnSaveAuthor_Click(object sender, EventArgs e)
        {
            txtAuthIns.Text = txtEditAuthor.Text;
            pnlEditAuthor.Visible = false;
            pnlMain.Visible = true;
        }
    }
}