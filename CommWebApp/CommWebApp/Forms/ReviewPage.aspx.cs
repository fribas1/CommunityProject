using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            // send email to EiC document has been reviewed
            SmtpClient client = new SmtpClient();
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.EnableSsl = true;
            client.Host = "smtp.gmail.com";
            client.Port = 587;

            // setup Smtp authentication
            System.Net.NetworkCredential credentials =
                new System.Net.NetworkCredential("contact.trpr@gmail.com", "emailtrpr");
            client.UseDefaultCredentials = false;
            client.Credentials = credentials;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("contact.trpr@gmail.com");
            msg.To.Add(new MailAddress("EiC EMAIL HERE !!!"));

            msg.Subject = "Teste Assunto";
            msg.IsBodyHtml = true;
            msg.Body = string.Format("Fabio um verdadeiro maxao.");

            try
            {
                client.Send(msg);
            }
            catch (Exception ex)
            {
            }
        }
    }
}