using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BiteBox.DAL;

namespace BiteBox.Admin
{
    public partial class Riders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRidersGrid();
            }
        }

        protected void BindRidersGrid()
        {
            GridViewRiders.DataSource = BiteBoxDAL.GetAllRiders();
            GridViewRiders.DataBind();
        }

        protected void GridViewRiders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int riderId = Convert.ToInt32(GridViewRiders.DataKeys[e.RowIndex].Value);
            BiteBoxDAL.DeleteRider(riderId);
            BindRidersGrid();
        }

         protected void btnGiveSalary_Click(object sender, EventArgs e)
        {
            Button btnGiveSalary = (Button)sender;
            int riderId = Convert.ToInt32(btnGiveSalary.CommandArgument);
            decimal salaryAmount = 1000; // Example: You can change this to the actual salary amount
            BiteBoxDAL.GiveSalary(riderId, salaryAmount);
            BindRidersGrid();
        }
    }
}