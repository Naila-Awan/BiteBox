using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiteBox
{
    public partial class ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                // Set default recipient email addresses
                string[] recipientEmails = { "<Enter recipient 1 email>", "<Enter recipient 2 email>", "<Enter recipient 3 email>" };

                // Get values from textboxes
                string fromEmail = txtFrom.Text.Trim();
                string subject = txtSubject.Text.Trim();
                string message = txtMessage.Text.Trim();

                // Create a new MailMessage for each recipient
                foreach (string toEmail in recipientEmails)
                {
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress(fromEmail);
                    mailMessage.To.Add(new MailAddress(toEmail));
                    mailMessage.Subject = subject;
                    mailMessage.Body = message;

                    // Send the email
                    using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtpClient.EnableSsl = true; // Enable SSL/TLS encryption
                        smtpClient.UseDefaultCredentials = false; // Do not use default credentials
                        smtpClient.Credentials = new System.Net.NetworkCredential("<Enter Your Email>", "<Enter Your Password>");
                        smtpClient.Send(mailMessage);
                    }
                }

                // Display success message
                lblStatus.Text = "Email has been successfully sent!";
            }
            catch (Exception ex)
            {
                // Display error message
                lblStatus.Text = "An error occurred while sending the email:<br />" + ex.Message;
            }
        }
    }
}
