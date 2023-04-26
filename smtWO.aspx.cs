using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
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
                
                e.Row.Cells[0].Text = "Action";
                e.Row.Cells[1].Text = "ID";
                e.Row.Cells[2].Text = "WorkOrder";
                e.Row.Cells[3].Text = "Model";
                e.Row.Cells[4].Text = "Quantity";
                e.Row.Cells[5].Text = "InitialSN";
                e.Row.Cells[6].Text = "FinalSN";


            }
        }
        static string IDTable;
        protected void myTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            IDTable = myTable.SelectedRow.Cells[1].Text.ToString();
            inputID.Text = IDTable.ToString();
            inputWorkorder.Text = myTable.SelectedRow.Cells[2].Text.ToString();
            inputModel.Text = myTable.SelectedRow.Cells[3].Text.ToString();
            inputQty.Text = myTable.SelectedRow.Cells[4].Text.ToString();
            inputFirstQR.Text = myTable.SelectedRow.Cells[5].Text.ToString();
            inputLastQR.Text = myTable.SelectedRow.Cells[6].Text.ToString();

            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-info-circle-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Bounded Succesfully";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2000)</script>");
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            NewBtn.Visible = true;
            ClearBtn.Visible = true;
            EditBtn.Visible = true;


        }

      

        protected void NewBtn_Click(object sender, EventArgs e)
        {
            inputID.Text = null;
            inputWorkorder.Text = null;
            inputModel.Text = null;
            inputQty.Text = null;
            inputFirstQR.Text = null;
            inputLastQR.Text = null;
            ClearBtn.Visible = true;
            SaveBtn.Visible = true;
            DeleteBtn.Visible = false;
            NewBtn.Visible = false;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;


        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;


        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            DeleteBtn.Visible = false;
            SaveBtn.Visible = false;
            NewBtn.Visible = true;
            ClearBtn.Visible= false;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-warning  alert-dismissible ");
            alertText.Text = "Data Fileds Cleaned";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",1500)</script>");
            inputID.Text= null;
            inputWorkorder.Text= null;
            inputModel.Text= null;
            inputQty.Text= null;
            inputFirstQR.Text = null;
            inputLastQR.Text = null;

        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            NewBtn.Visible = false;
            DeleteBtn.Visible = true;
            SaveBtn.Visible = true;
            ClearBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            /*IF DATA IS AVAILABLE*/
            EditBtn.Visible = true;
            SaveBtn.Visible= false;
            DeleteBtn.Visible= false;
            EditBtn.Visible = true;
            NewBtn.Visible = true;
            ClearBtn.Visible = true;


        }

        protected void inputWorkorder_TextChanged(object sender, EventArgs e)
        {
            SearchBtn.Visible = true;
            EditBtn.Visible = false;
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            EditBtn.Visible = false;
            NewBtn.Visible = true;
            ClearBtn.Visible = true;
        }
    }
}