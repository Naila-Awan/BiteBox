using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiteBox.DAL;

namespace BiteBox
{
    public partial class BrowseRestaurants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Load data only on initial load
            {
                LoadGrid();
            }
        }

        public void LoadGrid()
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            ItemGrid.DataSource = dbAccessor.DisplayMenu(GetCustomerId()); // Set data source for this Grid
            ItemGrid.DataBind(); // Bind the data source to this grid
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button btnAddToCart = (Button)sender;
            GridViewRow row = (GridViewRow)btnAddToCart.NamingContainer;
            TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
            int menuId = Convert.ToInt32(btnAddToCart.CommandArgument);
            int quantity = Convert.ToInt32(txtQuantity.Text);
            int custId = GetCustomerId(); // Assuming you have a method to get customer ID

            if (custId > 0)
            {
                string result = AddToCart(custId, menuId, quantity);
                if (result == "success")
                {
                    // Display confirmation alert
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartSuccess", "alert('Item added to cart successfully.');", true);
                }
                else
                {
                    // Display error alert
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "addToCartError", "alert('" + result + "');", true);
                }
            }
            else
            {
                // Display invalid customer ID alert
                ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidCustomerId", "alert('Invalid customer ID. Try logging in again');", true);
            }
        }

        private int GetCustomerId()
        {
            string email = Session["UserEmail"]?.ToString();
            BiteBoxCustomer masterPage = this.Master as BiteBoxCustomer;

            if (email == null)
            {
                Response.Redirect("../Main/Home.aspx");
            }

            int custID = Convert.ToInt32(masterPage.getRestInfo(email, "Cust_id"));
            return custID;
        }

        private string AddToCart(int custId, int menuId, int quantity)
        {
            string result = "";
            try
            {
                BiteBoxDAL dbAccessor = new BiteBoxDAL();
                dbAccessor.AddToCart(custId, menuId, quantity);
                result = "Item added to cart successfully.";
            }
            catch (Exception ex)
            {
                result = "An error occurred: " + ex.Message;
            }
            return result;
        }

    }
}
