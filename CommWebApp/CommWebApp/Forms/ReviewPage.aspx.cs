using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;

namespace CommWebApp.Forms
{
    public partial class ReviewPage : System.Web.UI.Page
    {
        string commentToAuthor, commentToEditor, feedbackString, postID, fileName;
        int[] feedback = new int[11];
        int count;
        bool sucess = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            postID = Request.QueryString["Post"];
            encName.Text = "Review #" + postID;
            hdFileName.Value = GetFile();
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/Forms/Login");
        }
        
        protected bool Validation()
        {
            bool valid = true;
            if (revisionR1.Checked == false && revisionR2.Checked == false)
            {
                notValid1.Visible = true;
                valid = false;
            }
            if (org1.Checked == false && org2.Checked == false &&
                org3.Checked == false && org4.Checked == false)
            {
                notValid2.Visible = true;
                lblOrgStar.Visible = true;
                valid = false;
            }
            if (rationale1.Checked == false && rationale2.Checked == false &&
                rationale3.Checked == false && rationale4.Checked == false)
            {
                notValid3.Visible = true;
                lblRatStar.Visible = true;
                valid = false;
            }
            if (methodology1.Checked == false && methodology2.Checked == false &&
                methodology3.Checked == false && methodology4.Checked == false)
            {
                notValid4.Visible = true;
                lblMethStar.Visible = true;
                valid = false;
            }
            if (Findings1.Checked == false && Findings2.Checked == false &&
    Findings3.Checked == false && Findings4.Checked == false)
            {
                notValid5.Visible = true;
                lblFindStar.Visible = true;
                valid = false;
            }
            if (Discussion1.Checked == false && Discussion2.Checked == false &&
    Discussion3.Checked == false && Discussion4.Checked == false)
            {
                notValid6.Visible = true;
                lblDisStar.Visible = true;
                valid = false;
            }
            if (abstract1.Checked == false && abstract2.Checked == false &&
abstract3.Checked == false && abstract4.Checked == false)
            {
                notValid7.Visible = true;
                lblAbstStar.Visible = true;
                valid = false;
            }
            if (manuscript1.Checked == false && manuscript2.Checked == false &&
manuscript3.Checked == false && manuscript4.Checked == false)
            {
                notValid8.Visible = true;
                lblManuStar.Visible = true;
                valid = false;
            }
            if (formatted1.Checked == false && formatted2.Checked == false &&
formatted3.Checked == false && formatted4.Checked == false)
            {
                notValid9.Visible = true;
                lblPFStar.Visible = true;
                valid = false;
            }

            if (citations1.Checked == false && citations2.Checked == false &&
citations3.Checked == false && citations4.Checked == false)
            {
                notValid10.Visible = true;
                lblCitStar.Visible = true;
                valid = false;
            }

            if (Recommendation1.Checked == false && Recommendation2.Checked == false &&
Recommendation3.Checked == false && Recommendation4.Checked == false)
            {
                notValid11.Visible = true;
                valid = false;
            }
            if (!valid)
            {
                notValidSumm.Text = "Some sections are missing your comment. Please review your Rubric.";
                notValidSumm.Visible = true;
            }
            return valid;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Forms/DashBoard.aspx");
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://trprstorage.blob.core.windows.net/manuscript/" + GetFile());
        }

        protected string GetFile()
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);            

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT [Name] FROM [File] " +
                    "WHERE [PostId] = " + postID + " AND [Manuscript] = 1";

                conn.Open();
                fileName = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();                
            }

            return fileName;
        }

        protected void insertComment()
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [Comment] (Content, RecommendationId, PostId, CommentedBy, " +
                    "ConfidentialToEditor, FileId) " +
                    "VALUES (@Content, @RecommendationId, @PostId, @CommentedBy, @ConfidentialToEditor, @FileId)";

                feedbackString = string.Join("", feedback);
                commentToAuthor = string.IsNullOrEmpty(txtAuthor.Text) ? " " : txtAuthor.Text;
                commentToEditor = string.IsNullOrEmpty(txtConfEditor.Text) ? feedbackString : 
                    feedbackString + "|" + txtConfEditor.Text;
                cmd.Parameters.AddWithValue("@Content", commentToAuthor);
                cmd.Parameters.AddWithValue("@RecommendationId", 1);
                cmd.Parameters.AddWithValue("@PostId", postID);
                cmd.Parameters.AddWithValue("@CommentedBy", User.Identity.GetUserId());
                cmd.Parameters.AddWithValue("@ConfidentialToEditor", commentToEditor);
                cmd.Parameters.AddWithValue("@FileId", 1); //just an example

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                notValidSumm.Text = ex.ToString();
                notValidSumm.Visible = true;
                sucess = false;
            }
            finally
            {
                conn.Close();
            }
        }
        protected void updatePostStatus()
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "UPDATE [Post] " +
                    "SET CurrentStatusId = 4" + // 4 for the "final revision" status, the only thing the associates assign here
                    "WHERE Id = " + postID.ToString();

                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                notValidSumm.Text = ex.ToString();
                notValidSumm.Visible = true;
                sucess = false;
            }
            finally
            {
                conn.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Validation())
            {
                notValidSumm.Visible = false;
                count = 0;
                foreach (Control rad in Form.Controls)
                {
                    if (rad is RadioButton)
                    {
                        RadioButton radio = rad as RadioButton;
                        if (radio.Checked == true)
                        {
                            if (radio.Text == "Yes" || radio.Text == "Perfect" || radio.Text == "Accept")
                            {
                                feedback[count] = 1;
                                count++;
                            }
                            else if (radio.Text == "No" || radio.Text == "Minor Revision")
                            {
                                feedback[count] = 2;
                                count++;
                            }
                            else if (radio.Text == "Major Revision")
                            {
                                feedback[count] = 3;
                                count++;
                            }
                            else
                            {
                                feedback[count] = 4;
                                count++;
                            }

                        }
                    }
                }
                //inserting
                insertComment();
                updatePostStatus();
                if (sucess)
                {
                    pnlQuestions.Visible = false;
                    btnBack.Visible = true;
                    btnSubmit.Visible = false;
                    btnSave.Visible = false;
                    lblSucess.Text = "Your Review has been uploaded successfully";
                    lblSucess.Visible = true;
                }



                //// send email to EiC document has been reviewed
                //SmtpClient client = new SmtpClient();
                //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client.EnableSsl = true;
                //client.Host = "smtp.gmail.com";
                //client.Port = 587;

                //// setup Smtp authentication
                //System.Net.NetworkCredential credentials =
                //    new System.Net.NetworkCredential("contact.trpr@gmail.com", "emailtrpr");
                //client.UseDefaultCredentials = false;
                //client.Credentials = credentials;

                //MailMessage msg = new MailMessage();
                //msg.From = new MailAddress("contact.trpr@gmail.com");
                //msg.To.Add(new MailAddress("EiC EMAIL HERE !!!"));

                //msg.Subject = "Teste Assunto";
                //msg.IsBodyHtml = true;
                //msg.Body = string.Format("Fabio um verdadeiro maxao.");

                //try
                //{
                //    client.Send(msg);
                //}
                //catch (Exception ex)
                //{
                //}
            }

        }



    }
}