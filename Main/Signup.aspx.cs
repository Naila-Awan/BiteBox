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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] != null) // user already logged in
            {
                Response.Redirect("~/Main/Home.aspx");
            }
        }

        protected void btnCustomerSignUp_Click(object sender, EventArgs e)
        {
            string pwd = txtCPassword.Text;
            string confirmPwd = txtCConfirmPassword.Text;

            if(pwd != confirmPwd)
            {
                signupErrorMsg.Text = "Passwords do not match!";
                return;
            }

            string email = txtCEmail.Text;
            string name = textCName.Text;
            string phone = txtCPhone.Text;
            string location = ddlCLocation.SelectedValue;
            string address = CAddress.Text;

            location = String.Concat(location, ": ", address);


            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.Customersignup(email, pwd, name, phone, location);

            if (error == "")
            {
                // ---------------redirecting-----------
                Response.Redirect("~/Main/Login.aspx");
            }
            else
            {
                signupErrorMsg.Text = error;
            }
        }

        protected void btnRestaurantSignUp_Click(object sender, EventArgs e)
        {
            string pwd = txtRestPassword.Text;
            string confirmPwd = txtRestConfirmPassword.Text;

            if (pwd != confirmPwd)
            {
                signupErrorMsgRest.Text = "Passwords do not match!";
                return;
            }

            string email = txtRestEmail.Text;
            string name = textRestName.Text;
            string descr = txtRestDescr.Text;

            string location = ddlRestLocation.SelectedValue;
            string address = RestAddress.Text;
            location = String.Concat(location, ": ", address);

            int orderLead = int.Parse(RestLeadT.Text);
            int deliveryTime = int.Parse(DeliveryextraT.Text);
            int salesTax = int.Parse(SalestaxT.Text);
            float salesTaxP = (float)Math.Round(salesTax / 100.0, 2);

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.Restaurantsignup(email, pwd, name, descr, location, orderLead, deliveryTime, salesTaxP);

            if (error == "")
            {
                // ---------------redirecting-----------
                Response.Redirect("~/Main/Login.aspx");
            }
            else
            {
                signupErrorMsgRest.Text = error;
            }
        }

        protected void btnRiderSignUp_Click(object sender, EventArgs e)
        {
            string pwd = txtRPassword.Text;
            string confirmPwd = txtRConfirmPassword.Text;

            if (pwd != confirmPwd)
            {
                signupErrorMsgR.Text = "Passwords do not match!";
                return;
            }

            string email = textEmailR.Text;
            string name = textNameR.Text;
            string phone = textPhoneR.Text;
            string lic = textLicR.Text;

            string location = ddlLocationR.SelectedValue;
            string address = textAddrR.Text;
            location = String.Concat(location, ": ", address);

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string error = dbAccessor.Ridersignup(email, pwd, name, phone, lic, location);

            if (error == "")
            {
                // ---------------redirecting-----------
                Response.Redirect("~/Main/Login.aspx");
            }
            else
            {
                signupErrorMsgR.Text = error;
            }
        }
    }
}