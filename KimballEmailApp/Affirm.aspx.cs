using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KimballEmailApp
{
    public partial class Affirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //when user acknowledges the email has been sent, will redirect to a refreshed Index page
            Response.Redirect("~/Index.aspx");
        }
    }
}