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
        string recomendID, commentToAuthor, commentToEditor, feedbackString;
        int[] feedback = new int[11];
        int count;
        int postID;

        protected void Page_Load(object sender, EventArgs e)
        {
            postID = Convert.ToInt32(Request.QueryString["Post"]);
            encName.Text = "Review " + postID;
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {

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
                valid = false;
            }
            if (rationale1.Checked == false && rationale2.Checked == false &&
                rationale3.Checked == false && rationale4.Checked == false)
            {
                notValid3.Visible = true;
                valid = false;
            }
            if (methodology1.Checked == false && methodology2.Checked == false &&
                methodology3.Checked == false && methodology4.Checked == false)
            {
                notValid4.Visible = true;
                valid = false;
            }
            if (Findings1.Checked == false && Findings2.Checked == false &&
    Findings3.Checked == false && Findings4.Checked == false)
            {
                notValid5.Visible = true;
                valid = false;
            }
            if (Discussion1.Checked == false && Discussion2.Checked == false &&
    Discussion3.Checked == false && Discussion4.Checked == false)
            {
                notValid6.Visible = true;
                valid = false;
            }
            if (abstract1.Checked == false && abstract2.Checked == false &&
abstract3.Checked == false && abstract4.Checked == false)
            {
                notValid7.Visible = true;
                valid = false;
            }
            if (manuscript1.Checked == false && manuscript2.Checked == false &&
manuscript3.Checked == false && manuscript4.Checked == false)
            {
                notValid8.Visible = true;
                valid = false;
            }
            if (formatted1.Checked == false && formatted2.Checked == false &&
formatted3.Checked == false && formatted4.Checked == false)
            {
                notValid9.Visible = true;
                valid = false;
            }

            if (citations1.Checked == false && citations2.Checked == false &&
citations3.Checked == false && citations4.Checked == false)
            {
                notValid10.Visible = true;
                valid = false;
            }

            if (Recommendation1.Checked == false && Recommendation2.Checked == false &&
Recommendation3.Checked == false && Recommendation4.Checked == false)
            {
                notValid11.Visible = true;
                valid = false;
            }            
            return valid;
        }
        protected void InsertRecomendation()
        {
            var connection = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(connection);

            try
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "INSERT INTO [Recommendation] (Description) values (@descr) select SCOPE_IDENTITY()";

                string descr = feedback.ToString();

                cmd.Parameters.AddWithValue("@descr", descr);

                conn.Open();
                recomendID = cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                notValidSumm.Text = ex.ToString();
            }
            finally
            {
                conn.Close();
            }
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
                count = 0;
                foreach (Control rad in Form.Controls)
                {
                    if (rad is RadioButton)
                    {
                        RadioButton radio = rad as RadioButton;
                        if (radio.Checked == true)
                        {
                            if (radio.Text == "Yes" || radio.Text == "Great" || radio.Text == "Accept")
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
                //InsertRecomendation();
                insertComment();
                updatePostStatus();



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