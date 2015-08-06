/*****************************************************************zkeg**
 Purpose: KEI Email Application program.                          
------------------------------------------------------------------------
 -Changed by-         -Date-      -Req #-     -Action-                     
 Emily Richardson   2015-07-27    BC-10577    Initial.                     
***********************************************************************/

using System;
using System.Linq;
using System.Web.UI;
using System.Web.Script.Serialization;



namespace KimballEmailApp
{
    public partial class Index : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try {
                //Version number
                VersionLabel.Text = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();

                string userID = this.Page.User.Identity.Name.Substring(4); //cuts the KEI\userID down to just the userID
                UserID.Text = userID.ToUpper();


                Service.KEIMasterDir.DIR_ServiceSoapClient dir = new Service.KEIMasterDir.DIR_ServiceSoapClient();
                Service.KEIMasterDir.strcProperty[] list = dir.Req_By_Userid(userID, "true", "").strcProperties;
                foreach (Service.KEIMasterDir.strcProperty prop in list)
                {
                    if (prop.strPropertyName == "mail") //searches for the 'mail' property name to retrieve the email address from
                    {
                        System.Net.Mail.MailAddress addr = new System.Net.Mail.MailAddress(prop.strPropertyValues[0]);
                        //set from address here automatically
                        FromAddressLabel.Text = addr.User + "@" + addr.Host;
                        break;
                    }
                }

                //client.Host = ClientSelectionList.Text;
                if (ClientSelectionList.Text == "")
                {
                    foreach (string serv in Properties.Settings.Default.SMTPlist)
                    {
                        ClientSelectionList.Items.Add(serv);
                    }
                }
                //Do not need to set default, as smtpa.kess.keint.com is already the first in the list, and therefore automatically shows up
            }
            catch(Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            try {
                //Write to the event log
                System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                log.Source = "Application";
                log.WriteEntry("An email has been sent from the Email Testing Tool.");
                log.Close();

                //Create a client server to be set later
                System.Net.Mail.SmtpClient client = new System.Net.Mail.SmtpClient();

                //Create new message to send, set it to be from yourself
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();

                //Pulls the "From" address from the KEI Directory
                string userID = this.Page.User.Identity.Name.Substring(4); //cuts the KEI\userID down to just the userID
                Service.KEIMasterDir.DIR_ServiceSoapClient dir = new Service.KEIMasterDir.DIR_ServiceSoapClient();
                Service.KEIMasterDir.strcProperty[] list = dir.Req_By_Userid(userID, "true", "").strcProperties;
                foreach (Service.KEIMasterDir.strcProperty prop in list)
                {
                    if (prop.strPropertyName == "mail") //searches for the 'mail' property name to retrieve the email address from
                    {
                        System.Net.Mail.MailAddress addr = new System.Net.Mail.MailAddress(prop.strPropertyValues[0]);
                        msg.From = addr;
                        break;
                    }
                }

                //Determine server to connect to
                client.Host = ClientSelectionList.Text;


                //Gets any CC addresses
                string[] ccList = CCBox.Text.Split(',');
                foreach (string addr in ccList)
                {
                    if (addr == "")
                    {
                        break;
                    }
                    else
                    {
                        System.Net.Mail.MailAddress ccAddr = new System.Net.Mail.MailAddress(addr);
                        msg.CC.Add(addr);
                    }
                }

                //Sets any BCC addresses
                string[] bccList = BCCBox.Text.Split(',');
                foreach (string addr in bccList)
                {
                    if (addr == "")
                    {
                        break;
                    }
                    else
                    {
                        System.Net.Mail.MailAddress bccAddr = new System.Net.Mail.MailAddress(addr);
                        msg.Bcc.Add(bccAddr);
                    }
                }

                //We want to add a timestamp to the email body
                DateTime stamp = DateTime.Now;

                //Gets subject line for the message
                msg.Subject = "KETT-APP  " + stamp + "  " + SubjectTextBox.Text;

                //Automatically parses for multiple addresses separated by commas
                if (ToTextBox.Text == "")
                {
                    throw new Exception("Please enter the recipient's email address.");
                }
                else
                {
                    msg.To.Add(ToTextBox.Text);
                }

                //Get and add attachment to the message
                if (ChooseAttachment.HasFile)
                {
                    string tempPath = System.IO.Path.GetTempPath() + ChooseAttachment.FileName;
                    //checks to see if it already exists, and if it does, deletes it
                    if (System.IO.File.Exists(tempPath))
                    {
                        System.IO.File.Delete(tempPath);
                    }
                    //saves attachment at temp location and then attaches it to the email
                    ChooseAttachment.SaveAs(tempPath);
                    msg.Attachments.Add(new System.Net.Mail.Attachment(tempPath));
                }

                //Gets the email message text and adds the time stamp a few lines down, then a random number
                msg.Body = MessageBodyTextBox.Text + "<br/><br/>" + stamp + "<br/><br/>"
                    + "This email was processed using this SMTP server: " + ClientSelectionList.Text + "<br/><br/>"
                     + "This email was processed using the KEI Email Testing Tool running on application server: " + Request.ServerVariables["SERVER_NAME"]
                     + "<br/><br/>" + "Version No.: " + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();

                //Want the body to be sent in HTML
                msg.IsBodyHtml = true;

                //Sends the message
                client.Send(msg);

                //This redirects the page after the email is sent
                Response.Redirect("~/Affirm.aspx");
            }
            catch(Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
        }



        #region events
        //Message Body Event Function
        protected void MessageText_TextChanged(object sender, EventArgs e)
        {

        }

        //"To" field Event Function
        protected void ToText_TextChanged(object sender, EventArgs e)
        {
            try {
                if (ToTextBox.Text != "" && ToTextBox.Text.Contains('@'))
                {
                    ValidityLabel.Text = "VALID";
                    ValidityLabel.Font.Bold = true;
                    ValidityLabel.ForeColor = System.Drawing.Color.Green;
                    ToTextBox.BackColor = System.Drawing.Color.LightGreen;
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Text = ex.Message;
            }
        }

        //"Subject" field Event Function
        protected void SubjectText_TextChanged(object sender, EventArgs e)
        {

        }

        //Controls the drop down box selections
        protected void ClientSelection_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        #endregion

    }
}