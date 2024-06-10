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
    public partial class RestaurantOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BiteBoxRestaurant masterPage = this.Master as BiteBoxRestaurant;
            masterPage.Page_Load(sender, e);
            BindOrders();
        }

        protected void BindOrders()
        {
            string email = Session["UserEmail"].ToString();
            string error = "";
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            gridOrders.DataSource = dbAccessor.SelectOrders(email, ref error);
            if (error == "")
            {
                gridOrders.DataBind();
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
        }

        protected void BindOrderItems(GridView gridOrderItems, int orderID)
        {
            string email = Session["UserEmail"].ToString();
            string error = "";
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            gridOrderItems.DataSource = dbAccessor.SelectOrderItems(email, orderID, ref error);
            if (error == "")
            {
                gridOrderItems.DataBind();
            }
        }
    }
}