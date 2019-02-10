using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommWebApp.Forms
{
    public partial class ReviewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {            
            
        }

        protected void btnUploadFile_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                lblMessage.Text = "Please select a file to upload.";
                lblMessage.ForeColor = System.Drawing.Color.Red;                
            }
            else if (FileUpload1.PostedFile.ContentLength > 50000)
            {
                lblMessage.Text = "The maximum size of 50 MB was exceeded.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            } else
            {                
                string filepath = Server.MapPath("~/Uploads/");
                lblMessage.Text = string.Empty;

                for (int i = 0; i < FileUpload1.PostedFiles.Count; i++)
                {
                    HttpPostedFile userPostedFile = FileUpload1.PostedFiles[i];                    
                    userPostedFile.SaveAs(filepath + Path.GetFileName(userPostedFile.FileName));
                }

                lblMessage.Text = FileUpload1.PostedFiles.Count + " file(s) uploaded successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
}