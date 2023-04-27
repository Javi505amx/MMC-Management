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
            if (!this.IsPostBack)
            {
                DisableFields();
                BindGridView();
            }

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
            CancelBtn.Visible = false;
            QueryBtn.Visible = true;
            RefreshBtn.Visible = true;
            SearchBtn.Visible = false;


        }



        protected void NewBtn_Click(object sender, EventArgs e)
        {
            //inputID.Text = null;
            //inputWorkorder.Text = null;
            //inputModel.Text = null;
            //inputQty.Text = null;
            //inputFirstQR.Text = null;
            //inputLastQR.Text = null;
            inputWorkorder.Focus();
            ClearBtn.Visible = true;
            SaveBtn.Visible = true;
            DeleteBtn.Visible = false;
            NewBtn.Visible = false;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            RefreshBtn.Visible = true;
            BindGridView();
            EnableFields();

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            CancelBtn.Visible = false;
            QueryBtn.Visible = true;
            RefreshBtn.Visible = true;
            DisableFields();
            BindGridView();

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            RefreshBtn.Visible = true;
            BindGridView();
            DisableFields();
        }

        protected void ClearBtn_Click(object sender, EventArgs e)
        {
            DeleteBtn.Visible = false;
            SaveBtn.Visible = false;
            NewBtn.Visible = true;
            ClearBtn.Visible = false;
            EditBtn.Visible = false;
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-warning  alert-dismissible ");
            alertText.Text = "Data Fields Cleaned";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",1500)</script>");
            clearFields();
            BindGridView();
            DisableFields();

        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            NewBtn.Visible = false;
            DeleteBtn.Visible = true;
            SaveBtn.Visible = true;
            ClearBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            RefreshBtn.Visible = true;
            //BindGridView();
            EnableFields();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {

            //string ConDB = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //SqlConnection sqlcon = new SqlConnection(ConDB);
            //sqlcon.Open();
            //SqlCommand sqlcmd = new SqlCommand();
            //string sqlquery = "select * from [dbo].[WODetails] where workorder like '%'+@Workorder+'%'";
            //sqlcmd.CommandText = sqlquery;
            //sqlcmd.Connection = sqlcon;
            //sqlcmd.Parameters.AddWithValue("workorder", filterText.Text);
            //DataTable dt = new DataTable();
            //SqlDataAdapter adapter = new SqlDataAdapter(sqlcmd);
            //adapter.Fill(dt);
            //myTable.DataSource = dt;
            //myTable.DataBind();
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("GetWOSMTFilter", connection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                connection.Open();
                sqlCommand.Parameters.Add("@Workorder", SqlDbType.VarChar, 30).Value = filterText.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                DataSet data = new DataSet();
                adapter.Fill(data);
                if (data.Tables.Count > 0)
                {
                    DisableFields();
                    myTable.DataSource = data.Tables[0];
                    myTable.AllowPaging = true;
                    myTable.DataBind();
                    connection.Close();
                    /*IF DATA IS AVAILABLE*/
                    EditBtn.Visible = false;
                    SaveBtn.Visible = false;
                    DeleteBtn.Visible = false;
                    NewBtn.Visible = true;
                    ClearBtn.Visible = true;
                    RefreshBtn.Visible = true;
                    AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Query Executed Succesfully ";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Work Order Not Found";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }

        }

        protected void inputWorkorder_TextChanged(object sender, EventArgs e)
        {
            //SearchBtn.Visible = true;
            //EditBtn.Visible = false;
            //SaveBtn.Visible = false;
            //DeleteBtn.Visible = false;
            //EditBtn.Visible = false;
            //NewBtn.Visible = true;
            //ClearBtn.Visible = true;
        }

        private void BindGridView()
        {

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("GetLast100WOSMT", connection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                DataSet data = new DataSet();
                adapter.Fill(data);
                if (data.Tables.Count > 0)
                {
                    myTable.DataSource = data.Tables[0];
                    myTable.AllowPaging = true;
                    myTable.DataBind();
                    connection.Close();
                    AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Query Executed Succesfully ";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Work Order Not Found";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }

            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            RefreshBtn.Visible = true;
        }

        protected void myTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            myTable.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void RefreshBtn_Click(object sender, EventArgs e)
        {
            DisableFields();
            clearFields();
            ClearBtn.Visible = false;
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            EditBtn.Visible = false;
            NewBtn.Visible = true;
            SearchBtn.Visible = false;
            RefreshBtn.Visible = true;
            QueryBtn.Visible = true;
            BindGridView();
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-list-check");
            alert.Attributes.Add("class", " alert alert-primary  alert-dismissible ");
            alertText.Text = "Updated Succesfully";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");

        }
        public void clearFields()
        {
            inputID.Text = null;
            inputWorkorder.Text = null;
            inputModel.Text = null;
            inputQty.Text = null;
            inputFirstQR.Text = null;
            inputLastQR.Text = null;
            filterText.Text = null;

        }

        protected void filterText_TextChanged(object sender, EventArgs e)
        {
            DisableFields();
            using (SqlConnection connection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString))
            {
                SqlCommand sqlCommand1 = new SqlCommand("GetWOSMTFilterLike", connection1);
                sqlCommand1.CommandType = CommandType.StoredProcedure;
                connection1.Open();
                sqlCommand1.Parameters.Add("@data", SqlDbType.VarChar, 100).Value = filterText.Text;
                SqlDataAdapter adapter1 = new SqlDataAdapter(sqlCommand1);
                DataSet data1 = new DataSet();
                adapter1.Fill(data1);
                if (data1.Tables.Count > 0)
                {
                    myTable.DataSource = data1.Tables[0];
                    myTable.AllowPaging = true;
                    myTable.DataBind();
                    connection1.Close();
                    /*IF DATA IS AVAILABLE*/
                    EditBtn.Visible = false;
                    SaveBtn.Visible = false;
                    DeleteBtn.Visible = false;
                    NewBtn.Visible = true;
                    ClearBtn.Visible = true;
                    RefreshBtn.Visible = false;
                    SearchBtn.Visible = true;
                    CancelBtn.Visible = true;
                    AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Query Executed Succesfully ";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Data Not Found, Try Again";
                    ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }

        }

        protected void QueryBtn_Click(object sender, EventArgs e)
        {
            filterText.BackColor = System.Drawing.Color.LightYellow;
            filterText.Enabled = true;
            filterText.Focus();
            SearchBtn.Visible = true;
            RefreshBtn.Visible = false;
            QueryBtn.Visible = false;
            CancelBtn.Visible = true;
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-database-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Query Enabled";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            DisableFields();
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            filterText.BackColor = System.Drawing.Color.White;
            filterText.Enabled = false;
            SearchBtn.Visible = false;
            RefreshBtn.Visible = true;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            EditBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            clearFields();
            inputWorkorder.Focus();
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
            alertText.Text = "Query Aborted";
            ClientScript.RegisterStartupScript(this.GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            DisableFields();
        }

        public void EnableFields()
        {
            inputWorkorder.Enabled = true;
            inputQty.Enabled = true;
            inputLastQR.Enabled = true;
            inputFirstQR.Enabled = true;
            inputLastQR.Enabled = true;
            inputModel.Enabled = true;
        }

        public void DisableFields()
        {
            inputWorkorder.Enabled = false;
            inputQty.Enabled = false;
            inputLastQR.Enabled = false;
            inputFirstQR.Enabled = false;
            inputLastQR.Enabled = false;
            inputModel.Enabled = false;
        }

    }
}