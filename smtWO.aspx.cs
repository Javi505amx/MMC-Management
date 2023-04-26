using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace ManageWO
{
    public partial class smtWO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void myTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                
                e.Row.Cells[0].Text = "ID";
                e.Row.Cells[1].Text = "WorkOrder";
                e.Row.Cells[2].Text = "Model";
                e.Row.Cells[3].Text = "Quantity";
                e.Row.Cells[4].Text = "InitialSN";
                e.Row.Cells[5].Text = "FinalSN";


            }
        }
        static string IDTable;
        protected void myTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            IDTable  = myTable.SelectedRow.Cells[0].Text.ToString();
            inputWorkorder.Text = myTable.SelectedRow.Cells[1].Text.ToString();
            inputModel.Text = myTable.SelectedRow.Cells[2].Text.ToString();
            inputQty.Text = myTable.SelectedRow.Cells[3].Text.ToString();
            inputFirstQR.Text = myTable.SelectedRow.Cells[4].Text.ToString();
            inputLastQR.Text = myTable.SelectedRow.Cells[5].Text.ToString();

            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-info-circle-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Bounded Succesfully";

        }
    }
}