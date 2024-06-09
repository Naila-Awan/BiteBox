using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BiteBox.DAL;

namespace BiteBox.Rider
{
    public partial class RiderDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BiteBoxRider masterPage = this.Master as BiteBoxRider;
            masterPage.Page_Load(sender, e);
            LoadGrid();
            getSalary();
        }

        public void LoadGrid()
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string email = Session["UserEmail"].ToString();
            string error = "";
            RiderOrders.DataSource = dbAccessor.SelectRiderOrders(email, ref error);
            if (error == "")
            {
                RiderOrders.DataBind();
            }

        }

        public void btnConfirmDelivery_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int orderId = Convert.ToInt32(btn.CommandArgument);

            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string email = Session["UserEmail"].ToString();
            dbAccessor.ConfirmDelivery(orderId);
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void RiderOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btnConfirmDel = (Button)e.Row.FindControl("btnConfirmDel");
                Label txtorderstatus = (Label)e.Row.FindControl("txtorderstatus");

                if (txtorderstatus.Text.Equals("Completed", StringComparison.OrdinalIgnoreCase))
                {
                    btnConfirmDel.Text = "Delivery Confirmed";
                    btnConfirmDel.Enabled = false;
                }
                else 
                {
                    btnConfirmDel.Text = "Confirm Delivery";
                    btnConfirmDel.Enabled = true;
                }
            }
        }

        protected void gridOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView gridOrderItems = (GridView)e.Row.FindControl("gridOrderItems");
                if (gridOrderItems != null)
                {
                    int orderID = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "order_id"));
                    BindOrderItems(gridOrderItems, orderID);
                }
            }

            RiderOrders_RowDataBound(sender, e);


        }

        protected void BindOrderItems(GridView gridOrderItems, int orderID)
        {
            //string email = Session["UserEmail"].ToString();
            string error = "";
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            gridOrderItems.DataSource = dbAccessor.SelectOrderItemsRider(orderID, ref error);
            if (error == "")
            {
                gridOrderItems.DataBind();

            }
        }

        protected void getSalary()
        {
            string email = Session["UserEmail"].ToString();
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            object result = dbAccessor.RiderInfo(email, "rider_balance");
            riderSalaryvalue.Text = result.ToString();
        }
    }
}