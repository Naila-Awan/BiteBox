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
    public partial class RestaurantDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BiteBoxRestaurant masterPage = this.Master as BiteBoxRestaurant;
            masterPage.Page_Load(sender, e);
            LoadGrid();
        }

        public void LoadGrid()
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string email = Session["UserEmail"].ToString();
            string error = "";
            menuItems.DataSource = dbAccessor.SelectItem(email, ref error);
            if(error == "")
            {
                menuItems.DataBind();
            }

        }
        protected void menuItems_rowdeleting(object sender, GridViewDeleteEventArgs e)
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string email = Session["UserEmail"].ToString();
            string error = "";

            GridViewRow row = menuItems.Rows[e.RowIndex];
            int ItemID = Convert.ToInt32(row.Cells[2].Text.ToString());
            int result = dbAccessor.DeleteItem(ItemID);
            if (result != 0)
            {
                menuItems.DataSource = dbAccessor.SelectItem(email, ref error);
                menuItems.DataBind();
            }
            else
            {
                string message = "No row deleted";
                ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", message.ToString());
            }

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void menuItems_RowEditing(object sender, GridViewEditEventArgs e)
        {
            menuItems.EditIndex = e.NewEditIndex;
            LoadGrid();
        }

        protected void menuItems_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            menuItems.EditIndex = -1;
            LoadGrid();
        }

        protected void menuItems_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)menuItems.Rows[e.RowIndex];
            //==== getting the value from the respective controls=====
            int menuId = Convert.ToInt32(menuItems.DataKeys[e.RowIndex].Value);
            string itemName = ((TextBox)row.FindControl("txtItemName")).Text;
            string category = ((TextBox)row.FindControl("txtCategory")).Text;
            string itemDescription = ((TextBox)row.FindControl("txtItemDescription")).Text;
            float itemPrice = Convert.ToSingle(((TextBox)row.FindControl("txtItemPrice")).Text);

            //=====updating the newly entered values in database====
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            dbAccessor.UpdateItem(menuId, itemName, category, itemDescription, itemPrice);

            //======================================================
            menuItems.EditIndex = -1;
            LoadGrid();
        }

        //------------------ADD ITEM FORM
        protected void btnMenuItem_Click(object sender, EventArgs e)
        {
            BiteBoxDAL dbAccessor = new BiteBoxDAL();
            string email = Session["UserEmail"].ToString();
            string error = "";
            string name = textItemName.Text.ToString();
            string categ = txtCateg.Text.ToString();
            string descr = textItemDescr.Text.ToString();
            float price = float.Parse(textItemPrice.Text);

            dbAccessor.AddMenuItem(email, name, categ, descr, price, ref error);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }
}