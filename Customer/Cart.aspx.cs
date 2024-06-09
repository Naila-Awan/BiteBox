using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiteBox.DAL;

namespace BiteBox
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
                CalculateAndDisplayTotal();
            }
        }

        private void LoadCart()
        {
            int custId = GetCustomerId();
            if (custId > 0)
            {
                BiteBoxDAL dbAccessor = new BiteBoxDAL();
                DataTable cartItems = dbAccessor.GetCartInfo(custId);
                CartGrid.DataSource = cartItems;
                CartGrid.DataBind();
            }
            else
            {
                string errorMessage = "Invalid customer ID. Redirecting to the home page.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{errorMessage}'); window.location.href = '../Main/Home.aspx';", true);
            }
        }

        private void CalculateAndDisplayTotal()
        {
            int custId = GetCustomerId();
            if (custId > 0)
            {
                BiteBoxDAL dbAccessor = new BiteBoxDAL();
                float totalPrice = dbAccessor.CalculateCartTotal(custId);
                lblTotalPrice.Text = "Order Total: PKR " + totalPrice.ToString() + "/-"; 
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

        protected void CartGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int cartId = Convert.ToInt32(CartGrid.DataKeys[e.RowIndex].Value);
            DeleteCartItem(cartId);
            LoadCart();
            CalculateAndDisplayTotal();

        }

        private void DeleteCartItem(int cartId)
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            dbAccessor.DeleteCart(cartId);
        }

        protected void ConfirmOrderButton_Click(object sender, EventArgs e)
        {
            int customerId = GetCustomerId();
            if (customerId > 0)
            {
                BiteBoxDAL dbAccessor = new BiteBoxDAL();
                DataTable cartItems = dbAccessor.GetCart(customerId);

                Dictionary<int, List<DataRow>> restaurantOrderItems = new Dictionary<int, List<DataRow>>();

                foreach (DataRow row in cartItems.Rows)
                {
                    int menuId = Convert.ToInt32(row["menu_id"]);
                    int restaurantId = dbAccessor.GetRestaurantId(menuId);

                    if (!restaurantOrderItems.ContainsKey(restaurantId))
                    {
                        restaurantOrderItems[restaurantId] = new List<DataRow>();
                    }

                    restaurantOrderItems[restaurantId].Add(row);
                }

                foreach (var kvp in restaurantOrderItems)
                {
                    int restaurantId = kvp.Key;
                    float orderTotal = 0;
                    string orderStatus = "Pending";

                    foreach (DataRow item in kvp.Value)
                    {
                        orderTotal += Convert.ToSingle(item["total_price"]);
                    }

                    int orderId = dbAccessor.InsertOrder(orderTotal, customerId, restaurantId, orderStatus);

                    foreach (DataRow item in kvp.Value)
                    {
                        int menuId = Convert.ToInt32(item["menu_id"]);
                        int quantity = Convert.ToInt32(item["quantity"]);
                        dbAccessor.InsertOrderItem(orderId, menuId, quantity);
                    }
                }
                dbAccessor.ClearCart(customerId);

                LoadCart();
                CalculateAndDisplayTotal();


                // Alert after the order is confirmed
                string alertMessage = "Your order has been confirmed!";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{alertMessage}'); window.location.href = '../Customer/HomeCustomer.aspx';", true);
            }
            else
            {
                string errorMessage = "Invalid customer ID. Redirecting to the home page.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{errorMessage}'); window.location.href = '../Main/Home.aspx';", true);
            }
        }

        protected void CartGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CartGrid.EditIndex = -1;
            LoadCart();
            CalculateAndDisplayTotal();

        }

        protected void CartGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CartGrid.EditIndex = e.NewEditIndex;
            LoadCart();
            CalculateAndDisplayTotal();

        }

        protected void CartGrid_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)CartGrid.Rows[e.RowIndex];
            Label CartID = (Label)CartGrid.Rows[e.RowIndex].FindControl("CartID");
            TextBox Quantity = (TextBox)CartGrid.Rows[e.RowIndex].FindControl("txtQuantity");

            int cartNo = Convert.ToInt32(CartID.Text.ToString());
            int uQuantity = Convert.ToInt32(Quantity.Text.ToString());
            BiteBoxDAL obj = new BiteBoxDAL();

            obj.UpdateItem(cartNo, uQuantity);

            CartGrid.EditIndex = -1;
            LoadCart();
            CalculateAndDisplayTotal();
        }
    }
}
