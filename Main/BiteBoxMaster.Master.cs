using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiteBox.DAL;

namespace BiteBox
{
    public partial class biteboxmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setProfileIconLink();

        }

        protected void setProfileIconLink()
        {
            string link = "Login.aspx";
            string usertype = "";

            if (Session["UserType"] != null)
            {
                usertype = Session["UserType"].ToString();
            }

            if (usertype == "Customer")
            {
                link = "../Customer/HomeCustomer.aspx";
            }
            else if (usertype == "Restaurant")
            {
                link = "../Restaurant/MenuManager.aspx";
            }
            else if (usertype == "Rider")
            {
                link = "../Rider/RiderDashboard.aspx";
            }
            else if (usertype == "Admin")
            {
                link = "../Admin/Customers.aspx";
            }

            userLink.Attributes["href"] = link;

        }
    }
}