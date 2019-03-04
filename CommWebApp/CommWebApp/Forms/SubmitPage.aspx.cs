using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;

namespace CommWebApp.Forms
{
    public partial class SubmitPage : System.Web.UI.Page
    {
        public string fileName, filePath, fileExtension, postId, fileId;
        public int fileSize;
        List<ListItem> selectedTags = new List<ListItem>();        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack) return;
            FileUpload1.Attributes["onchange"] = "UploadFile(this)";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Forms/Login");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {            
            foreach (ListItem item in cblTags.Items)
                if (item.Selected) selectedTags.Add(item);

            if ((txtTitle.Text.Length == 0) && (selectedTags.Count != 0))
            {
                lblTitleValid.Text = "The title field is required.";
                lblTitleValid.Visible = true;
                txtTitle.Focus();
            }                
            else if ((txtTitle.Text.Length != 0) && (selectedTags.Count == 0))
            {
                lblError.Text = "At least one tag is required.";
                lblError.Visible = true;
            }                
            else if ((txtTitle.Text.Length == 0) && (selectedTags.Count == 0))
            {
                lblTitleValid.Text = "The title field is required.";
                lblError.Text = "At least one tag is required.";
                txtTitle.Focus();

                lblTitleValid.Visible = true;
                lblError.Visible = true;
            }
            else
            {
                InsertPost();
                InsertFile(hdFileName.Value, hdFilePath.Value, hdFileSize.Value, hdFileExtension.Value, postId);
                InsertPostTag(postId);

                pnlContent.Visible = false;
                pnlViewer.Visible = false;
                pnlSuccess.Visible = true;
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/DashBoard.aspx");
        }

        //protected void btnUploadFile_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        filePath = Server.MapPath("~/Uploads/");

        //        fileName = FileUpload1.PostedFile.FileName;
        //        fileSize = FileUpload1.PostedFile.ContentLength;
        //        fileExtension = Path.GetExtension(FileUpload1.FileName);

        //        if (fileExtension.ToLower() != ".pdf")
        //        {
        //            lblMessage.Text = "Only files with .pdf extension are allowed.";                    
        //        }
        //        else if (FileUpload1.PostedFile.ContentLength > 50000000)
        //        {
        //            lblMessage.Text = "The maximum size of 50 MB was exceeded.";                    
        //        }
        //        else
        //        {
        //            FileUpload1.SaveAs(filePath + FileUpload1.FileName);

        //            lblMessage.Text = "File uploaded successfully!";
        //            lblMessage.CssClass = "text-success";                    

        //            pnlViewer.Visible = true;
        //        }
        //    }
        //    else
        //    {
        //        lblMessage.Text = "Please select a file to upload.";                
        //    }

        //    this.lblMessage.Visible = true;
        //}

        public void UploadFile(object sender, EventArgs e)
        {
            filePath = Server.MapPath("~/Uploads/");
            fileName = FileUpload1.PostedFile.FileName;
            fileSize = FileUpload1.PostedFile.ContentLength;
            fileExtension = Path.GetExtension(FileUpload1.FileName);

            if (fileExtension.ToLower() != ".pdf")
            {
                lblMessage.Text = "Only files with .pdf extension are allowed.";
            }
            else if (fileSize > 50000000)
            {
                lblMessage.Text = "The maximum size of 50 MB was exceeded.";
            }
            else
            {
                FileUpload1.SaveAs(filePath + FileUpload1.FileName);

                hdFileName.Value = fileName;
                hdFilePath.Value = filePath;
                hdFileSize.Value = fileSize.ToString();
                hdFileExtension.Value = fileExtension;

                lblMessage.Text = "File uploaded successfully!";                
                lblMessage.CssClass = "text-success";                

                pnlViewer.Visible = true;
            }

            if(fileName.Length <= 15)
                lblFileName.Text = fileName;
            else
                lblFileName.Text = fileName.Substring(0, 10) + "[...]" + fileExtension;

            lblMessage.Visible = true;
        }

        protected void InsertPost()
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [Post] (Title, Content, CreatedBy, LastModifiedBy, "
                                  + "CurrentStatusId, CreatedOn, LastModifiedOn) "
                                  + "VALUES (@Title, @Content, @CreatedBy, @LastModifiedBy, "
                                  + "@CurrentStatusId, @CreatedOn, @LastModifiedOn) "
                                  + "SELECT SCOPE_IDENTITY()";


                string content = (txtContent.Text.Length > 0) ? txtContent.Text : "";

                cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmd.Parameters.AddWithValue("@Content", content);
                cmd.Parameters.AddWithValue("@CreatedBy", User.Identity.GetUserId());
                cmd.Parameters.AddWithValue("@LastModifiedBy", User.Identity.GetUserId());
                cmd.Parameters.AddWithValue("@CurrentStatusId", 2); //status 2: Awaiting Editors' Choice
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@LastModifiedOn", DateTime.Now.ToBinary());

                conn.Open();

                postId = cmd.ExecuteScalar().ToString();
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

        protected void InsertFile(string name, string path, string size, string extension, string id)
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);
            
            try
            {
                //SqlCommand cmd = new SqlCommand("INSERT INTO [File] (Name, Path, Size, Extension) "
                //                                + "VALUES (@Name, @Path, @Size, @Extension)", conn);

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [File] (Name, Path, Size, Extension, PostId) "
                                 + "VALUES (@Name, @Path, @Size, @Extension, @PostId)";

                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Path", path);
                cmd.Parameters.AddWithValue("@Size", Convert.ToInt64(size));
                cmd.Parameters.AddWithValue("@Extension", extension);
                cmd.Parameters.AddWithValue("@PostId", Convert.ToInt32(id));

                conn.Open();
                cmd.ExecuteNonQuery();                
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
            finally
            {
                conn.Close();                
            }
        }
       
        protected void InsertPostTag(string id)
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
                        cmd.CommandText += "INSERT INTO [PostTag] (PostId, TagId) "
                                        + "VALUES (@PostId, " + Convert.ToInt32(selectedTags[i].Value)
                                        + ") ";
                    }
                }
                else
                {
                    cmd.CommandText = "INSERT INTO [PostTag] (PostId, TagId) "
                                     + "VALUES (@PostId, @TagId)";

                    string tagId = selectedTags[0].Value;

                    cmd.Parameters.AddWithValue("@TagId", Convert.ToInt32(tagId));
                }

                cmd.Parameters.AddWithValue("@PostId", Convert.ToInt32(id));

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}