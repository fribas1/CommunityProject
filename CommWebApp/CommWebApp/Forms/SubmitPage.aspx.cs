using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

                    var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection conn = new SqlConnection(connection);

                    try
                    {
                        //SqlCommand cmd = new SqlCommand("INSERT INTO [File] (Name, Path, Size, Extension) "
                        //                                + "VALUES (@Name, @Path, @Size, @Extension)", conn);

                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "INSERT INTO [File] (Name, Path, Size, Extension) "
                                         + "VALUES (@Name, @Path, @Size, @Extension)";

                        cmd.Parameters.AddWithValue("@Name", fileName);
                        cmd.Parameters.AddWithValue("@Path", filepath);
                        cmd.Parameters.AddWithValue("@Size", FileUpload1.PostedFile.ContentLength);
                        cmd.Parameters.AddWithValue("@Extension", fileExtension);

                        conn.Open();
                        cmd.ExecuteNonQuery();                        

                        //SqlCommand cmd2 = conn.CreateCommand();
                        //cmd2.CommandText = "SELECT SCOPE_IDENTITY()";
                        //var id = cmd.ExecuteScalar();

                        //SqlCommand cmd3 = new SqlCommand("UPDATE [File] SET PostId = @id WHERE [Email] = @Email", conn);

                        //cmd.Parameters.AddWithValue("@FirstName", FirstName.Text);
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = ex.ToString();
                    }
                    finally
                    {
                        conn.Close();

                        lblMessage.Text = "File uploaded successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        pnlViewer.Visible = true;
                    }                    
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