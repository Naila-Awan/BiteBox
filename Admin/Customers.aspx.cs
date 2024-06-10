using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using BiteBox.DAL;

namespace BiteBox.Admin
{
    public partial class Customers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomersGrid();
            }
        }

        protected void BindCustomersGrid()
        {
            List<BiteBox.DAL.Customer> customers = BiteBoxDAL.GetCustomers();
            GridViewCustomers.DataSource = customers;
            GridViewCustomers.DataBind();
        }

        protected void GridViewCustomers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int customerId = Convert.ToInt32(GridViewCustomers.DataKeys[e.RowIndex].Value);
            BiteBoxDAL.DeleteCustomer(customerId);
            BindCustomersGrid();
        }

        protected void GridViewCustomers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewCustomers.Rows[e.RowIndex];
            int customerId = Convert.ToInt32(GridViewCustomers.DataKeys[e.RowIndex].Value);
            string name = (row.FindControl("txtName") as TextBox).Text;
            string email = (row.FindControl("txtEmail") as TextBox).Text;
            string password = (row.FindControl("txtPassword") as TextBox).Text;
            string phone = (row.FindControl("txtPhone") as TextBox).Text;
            string location = (row.FindControl("txtLocation") as TextBox).Text; // Ensure Cust_location is obtained

            BiteBox.DAL.Customer updatedCustomer = new BiteBox.DAL.Customer
            {
                Cust_id = customerId,
                Cust_Name = name,
                Cust_email = email,
                Cust_password = password,
                Cust_phone = phone,
                Cust_location = location, // Pass Cust_location
                                          // Include other properties
            };

            BiteBoxDAL.UpdateCustomer(updatedCustomer);

            GridViewCustomers.EditIndex = -1;
            BindCustomersGrid();
        }



        protected void GridViewCustomers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCustomers.EditIndex = e.NewEditIndex;
            BindCustomersGrid();
        }

        protected void GridViewCustomers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCustomers.EditIndex = -1;
            BindCustomersGrid();
        }
    }
}
