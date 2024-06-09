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
    public partial class BiteBoxRestaurant : System.Web.UI.MasterPage
    {
        public void Page_Load(object sender, EventArgs e)
        {
            //------------If not logged in as a restaurant
            if (Session["UserEmail"] == null || !(Session["UserType"].ToString().Equals("Restaurant")))
            {
                Response.Redirect("../Main/Login.aspx");
            }
        }
        public object getRestInfo(string email, string column)
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            object info = dbAccessor.RestaurantInfo(email, column);

            return info;
        }
    }
}