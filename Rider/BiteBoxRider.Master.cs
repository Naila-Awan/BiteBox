using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BiteBox
{
    public partial class BiteBoxRider : System.Web.UI.MasterPage
    {
        public void Page_Load(object sender, EventArgs e)
        {
            //------------If not logged in as a restaurant
            if (Session["UserEmail"] == null || !(Session["UserType"].ToString().Equals("Rider")))
            {
                Response.Redirect("../Main/Login.aspx");
            }
        }
    }
}