using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiteBox.DAL;

namespace BiteBox.Admin
{
    public partial class Resturants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRestaurantsGrid();
            }
        }

        protected void BindRestaurantsGrid()
        {
            List<BiteBox.DAL.Restaurant> restaurants = BiteBoxDAL.GetRestaurants();
            GridViewRestaurants.DataSource = restaurants;
            GridViewRestaurants.DataBind();
        }

        protected void GridViewRestaurants_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRestaurants.EditIndex = e.NewEditIndex;
            BindRestaurantsGrid();
        }

        protected void GridViewRestaurants_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridViewRestaurants.Rows[e.RowIndex];
            if (row != null)
            {
                int restaurantId = Convert.ToInt32(GridViewRestaurants.DataKeys[e.RowIndex].Value);
                string name = (row.FindControl("txtName") as TextBox)?.Text;
                string location = (row.FindControl("txtLocation") as TextBox)?.Text;
                string email = (row.FindControl("txtEmail") as TextBox)?.Text;

                // Ensure name is provided and not empty
                if (!string.IsNullOrEmpty(name))
                {
                    BiteBoxDAL.UpdateRestaurant(restaurantId, name, location, email);

                    GridViewRestaurants.EditIndex = -1;
                    BindRestaurantsGrid();
                }
                else
                {
                    // Handle case where name is not provided
                    // Optionally display a message to the user indicating that name is required
                }
            }
        }




        protected void GridViewRestaurants_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int restaurantId = Convert.ToInt32(GridViewRestaurants.DataKeys[e.RowIndex].Value);
            BiteBoxDAL.DeleteRestaurant(restaurantId);
            BindRestaurantsGrid();
        }

        protected void GridViewRestaurants_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewRestaurants.EditIndex = -1;
            BindRestaurantsGrid();
        }
    }
}
