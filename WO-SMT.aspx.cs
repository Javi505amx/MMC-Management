using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ManageWO
{
    public partial class WO_SMT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

  

        protected void Search_Click(object sender, EventArgs e)
        {

        }


        protected void myTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "WorkOrder";
                e.Row.Cells[1].Text = "Model";
                e.Row.Cells[2].Text = "Quantity";
                e.Row.Cells[3].Text = "InitialSN";
                e.Row.Cells[4].Text = "FinalSN";

            }
        }
    }
}