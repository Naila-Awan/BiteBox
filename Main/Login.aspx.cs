using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiteBox.DAL;

namespace BiteBox.Main
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null) // user already logged in
            {
                Response.Redirect("~/Main/Home.aspx");
            }
        }

        protected void btnCustomerLogin_Click(object sender, EventArgs e)
        {
            string email = txtCEmail.Text;
            string pwd = txtCPassword.Text;

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.CustomerLogin(email, pwd);

            if(error == "")
            {
                // ---------------Setting session variables and redirecting-----------
                Session["UserEmail"] = email;
                Session["UserType"] = "Customer";
                Response.Redirect("~/Customer/HomeCustomer.aspx");
            }
            else
            {
                loginErrorMsg.Text = error;
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string email = txtAEmail.Text;
            string pwd = txtAPassword.Text;

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.AdminLogin(email, pwd);

            if (error == "")
            {
                // ---------------Setting session variables and redirecting-----------
                Session["UserEmail"] = email;
                Session["UserType"] = "Admin";
                Response.Redirect("~/Admin/Customers.aspx");
            }
            else
            {
                loginErrorMsgA.Text = error;
            }
        }

        protected void btnRestaurantLogin_Click(object sender, EventArgs e)
        {
            string email = txtRestEmail.Text;
            string pwd = txtRestPassword.Text;

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.RestaurantLogin(email, pwd);

            if (error == "")
            {
                // ---------------Setting session variables and redirecting-----------
                Session["UserEmail"] = email;
                Session["UserType"] = "Restaurant";
                Response.Redirect("~/Restaurant/MenuManager.aspx");
            }
            else
            {
                loginErrorMsgRest.Text = error;
            }
        }

        protected void btnRiderLogin_Click(object sender, EventArgs e)
        {
            string email = txtREmail.Text;
            string pwd = txtRPassword.Text;

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.RiderLogin(email, pwd);

            if (error == "")
            {
                // ---------------Setting session variables and redirecting-----------
                Session["UserEmail"] = email;
                Session["UserType"] = "Rider";
                Response.Redirect("~/Rider/RiderDashboard.aspx");
            }
            else
            {
                loginErrorMsgR.Text = error;
            }
        }
    }
}