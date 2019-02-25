using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommWebApp.Forms
{
    public partial class SubmitPage : System.Web.UI.Page
    {
        public string fileName, fileExtension;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filepath = Server.MapPath("~/Uploads/");

                fileName = FileUpload1.PostedFile.FileName;
                fileExtension = Path.GetExtension(FileUpload1.FileName);

                if (fileExtension.ToLower() != ".pdf")
                {
                    lblMessage.Text = "Only files with .pdf extension are allowed.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                } else if (FileUpload1.PostedFile.ContentLength > 50000000)
                {
                    lblMessage.Text = "The maximum size of 50 MB was exceeded.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                } else
                {
                    FileUpload1.SaveAs(filepath + FileUpload1.FileName);

                    lblMessage.Text = "File uploaded successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    
                    pnlViewer.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Please select a file to upload.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            this.lblMessage.Visible = true;
        }
    }
}