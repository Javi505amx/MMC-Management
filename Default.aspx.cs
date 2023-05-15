using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManageWO
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (DateTime.Now.Hour < 12)
            {
                lblGreeting.Text = "Good Morning";
                lblDate.Text = Convert.ToString(DateTime.Now);
            }
            else if (DateTime.Now.Hour < 17)
            {
                lblGreeting.Text = "Good Afternoon";
                lblDate.Text = Convert.ToString(DateTime.Now);
            }
            else
            {
                lblGreeting.Text = "Good Evening";
                lblDate.Text = Convert.ToString(DateTime.Now);
            }
            string name = Session["fullName"].ToString();
            userDefault.Text = name;

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Home.aspx");
        }
    }
}