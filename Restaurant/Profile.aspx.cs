using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiteBox.DAL;

namespace BiteBox.Restaurant
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BiteBoxRestaurant masterPage = this.Master as BiteBoxRestaurant;
                masterPage.Page_Load(sender, e);
                LoadProfileData();
            }
                
        }

        protected void LoadProfileData()
        {
            string email = Session["UserEmail"].ToString();
            BiteBoxRestaurant masterPage = this.Master as BiteBoxRestaurant;

            if (email!=null)
            {
                textRestName.Text = masterPage.getRestInfo(email, "rest_name").ToString();
                textRestName.ReadOnly = true;
                txtRestEmail.Text = email;
                txtRestEmail.ReadOnly = true;
                textRestaurantLocation.Text = masterPage.getRestInfo(email, "rest_location").ToString();
                textRestaurantLocation.ReadOnly = true;

                txtRestDescr.Text = masterPage.getRestInfo(email, "rest_description").ToString();

                RestLeadT.Text = masterPage.getRestInfo(email, "order_lead_time").ToString();
                DeliveryextraT.Text = masterPage.getRestInfo(email, "delivery_extra_time").ToString();

                string salesTaxString = masterPage.getRestInfo(email, "sales_tax").ToString();
                float salesTax = float.Parse(salesTaxString);
                salesTax *= 100;
                int salesTaxInt = (int)(salesTax);

                SalestaxT.Text = salesTaxInt.ToString();
            }
            
        }

        protected void btnRestaurantUpdate_Click(object sender, EventArgs e)
        {
            BiteBoxRestaurant masterPage = this.Master as BiteBoxRestaurant;

            string entered_pwd = txtRestPassword.Text.ToString();
            string email = Session["UserEmail"].ToString();
            string pwd = masterPage.getRestInfo(email, "rest_password").ToString();

            if(entered_pwd != pwd)
            {
                updateErrorMsgRest.Text = "Incorrect password!";
                updateErrorMsgRest.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF0000");
                return;
            }

            string descr = txtRestDescr.Text.ToString();
            int orderLead = int.Parse(RestLeadT.Text);
            int deliveryTime = int.Parse(DeliveryextraT.Text);
            int salesTax = int.Parse(SalestaxT.Text);
            float salesTaxP = (float)Math.Round(salesTax / 100.0f, 2);
            
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string result = dbAccessor.updateRestaurant(email, descr, orderLead, deliveryTime, salesTaxP);
            updateErrorMsgRest.Text = result;

            if (result == "Profile Updated successfully")
            {
                updateErrorMsgRest.ForeColor = System.Drawing.ColorTranslator.FromHtml("#37C42B");
                LoadProfileData();
            }

        }
    }
}