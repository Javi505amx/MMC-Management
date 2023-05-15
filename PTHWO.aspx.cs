using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ManageWO
{
    public partial class PTHWO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewBtn.Visible = true;
                SearchBtn.Visible = false;
                SaveBtn.Visible = false;
                DeleteBtn.Visible = false;
                CancelBtn.Visible = false;
                EditBtn.Visible = false;
                QueryBtn.Visible = false;
                ClearBtn.Visible = false;
                RefreshBtn.Visible = true;
                UpdateBtn.Visible = false;
                DisableFields();
                BindGridView();
                OriginalStateButton();
            }
        }

        protected void RegresarBtn_Click(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {

        }

        protected void NewBtn_Click(object sender, EventArgs e)
        {
            inputID.Text = null;
            inputWorkorder.Text = null;
            inputModel.Text = null;
            inputQty.Text = null;
            inputUPH.Text = null;
            inputMain.Text = null;
            inputUPH.Text = null;
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
            filterText.Enabled = false;
            UpdateBtn.Visible = false;
            EnableFields();
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {

            string conDBsmt = ConfigurationManager.ConnectionStrings["pth"].ConnectionString;
            string WO = inputWorkorder.Text;
            string Model = inputModel.Text;
            int Qty = int.Parse(inputQty.Text);
            string Main = inputMain.Text;
            int Rate = int.Parse(inputUPH.Text);
            double RateMin = double.Parse(inputUPHMIN.Text);

            SqlConnection connectionDBsmt = new SqlConnection(conDBsmt);
            SqlCommand cmdSP = new SqlCommand("AddInfoWOPTH", connectionDBsmt);
            cmdSP.CommandType = CommandType.StoredProcedure;
            connectionDBsmt.Open();
            cmdSP.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 30).Value = WO;
            cmdSP.Parameters.Add("@Model", SqlDbType.VarChar, 50).Value = Model;
            cmdSP.Parameters.Add("@Quantity", SqlDbType.Int).Value = Qty;
            cmdSP.Parameters.Add("@Main", SqlDbType.VarChar, 100).Value = Main;
            cmdSP.Parameters.Add("@Rate", SqlDbType.Int).Value = Rate;
            cmdSP.Parameters.Add("@RateMin", SqlDbType.Decimal).Value = RateMin;

            
            SqlDataReader sqlDataReader = cmdSP.ExecuteReader();
            sqlDataReader.Read();
            int int32 = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("rowAffected"));
            connectionDBsmt.Close();
            if (int32 == 1)
            {

                alert.Visible = true;
                AlertIcon.Attributes.Add("class", " bi bi-database-check");
                alert.Attributes.Add("class", " alert alert-success  alert-dismissible");
                alertText.Text = "WorkOrder Created Succesfully";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");

            }
            else
            {
                alert.Visible = true;
                AlertIcon.Attributes.Add("class", " bi bi-database-x");
                alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                alertText.Text = "WorkOrder Duplicated or something is missing";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");

                DisableFields();

            }
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            ClearBtn.Visible = false;
            NewBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            CancelBtn.Visible = false;
            QueryBtn.Visible = true;
            RefreshBtn.Visible = true;
            filterText.Enabled = false;
            UpdateBtn.Visible = false;

            clearFields();
            DisableFields();
            BindGridView();
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["pth"].ConnectionString;
            string WO = inputWorkorder.Text;
            int ID = int.Parse(inputID.Text);
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand4 = new SqlCommand("DeleteWOPTH", connection);
            sqlCommand4.CommandType = CommandType.StoredProcedure;
            connection.Open();
            sqlCommand4.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 30).Value = WO;
            sqlCommand4.Parameters.Add("@ID", SqlDbType.Int).Value = ID;

            SqlDataReader reader = sqlCommand4.ExecuteReader();
            reader.Read();
            int row = reader.GetInt32(reader.GetOrdinal("RowDeleted"));
            //sqlCommand4.ExecuteReader().Read();
            connection.Close();
            if (row == 1)
            {
                alert.Visible = true;
                AlertIcon.Attributes.Add("class", "bi bi-database-exclamation");
                alert.Attributes.Add("class", " alert alert-primary  alert-dismissible ");
                alertText.Text = "WorkOrder deleted ";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
            }
            else
            {
                alert.Visible = true;
                AlertIcon.Attributes.Add("class", "bi bi-database-fill-x");
                alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                alertText.Text = "Something went wrong, please contact IT dept";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
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
            filterText.Enabled = false;
            UpdateBtn.Visible = false;

            clearFields();
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
            CancelBtn.Visible = false;
            QueryBtn.Visible = true;
            SearchBtn.Visible = false;
            UpdateBtn.Visible = false;

            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-warning  alert-dismissible ");
            alertText.Text = "Data Fields Cleaned";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",1500)</script>");

            OriginalStateButton();
            clearFields();
            BindGridView();
            DisableFields();
            filterText.Enabled = false;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            NewBtn.Visible = false;
            DeleteBtn.Visible = true;
            SaveBtn.Visible = false;
            ClearBtn.Visible = true;
            EditBtn.Visible = false;
            SearchBtn.Visible = false;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            RefreshBtn.Visible = true;
            UpdateBtn.Visible = true;

            //BindGridView();
            ClearBtn.Text = "CANCEL";
            ClearBtn.Attributes.Add("class", " fw-bold btn btn-secondary ");
            icono.Attributes.Add("class", "bi bi-x-circle-fill");
            EnableFields();
            filterText.Enabled = false;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["pth"].ConnectionString;
            string WO = inputWorkorder.Text;
            string Model = inputModel.Text;
            string Main = inputMain.Text;
            int Qty = int.Parse(inputQty.Text);
            int Rate = int.Parse(inputUPH.Text);
            double RateMIN = double.Parse(inputUPHMIN.Text);
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand sqlCommand4 = new SqlCommand("UpdateInfoWOPTH2", connection);
            sqlCommand4.CommandType = CommandType.StoredProcedure;
            connection.Open();
            sqlCommand4.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 30).Value = WO;
            sqlCommand4.Parameters.Add("@Model", SqlDbType.VarChar, 50).Value = Model;
            sqlCommand4.Parameters.Add("@Quantity", SqlDbType.Int).Value = Qty;
            sqlCommand4.Parameters.Add("@Main", SqlDbType.VarChar, 100).Value = Main;
            sqlCommand4.Parameters.Add("@Rate", SqlDbType.Int).Value = Rate;
            sqlCommand4.Parameters.Add("@RateMin", SqlDbType.Decimal).Value = RateMIN ;

            SqlDataReader reader = sqlCommand4.ExecuteReader();
            reader.Read();
            int row = reader.GetInt32(reader.GetOrdinal("RowUpdated"));
            //sqlCommand4.ExecuteReader().Read();
            connection.Close();
            if (row == 1)
            {
                alert.Visible = true;
                AlertIcon.Attributes.Add("class", "bi bi-check2-circle");
                alert.Attributes.Add("class", " alert alert-success  alert-dismissible ");
                alertText.Text = "WorkOrder updated Succesfully";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
            }
            else
            {
                alert.Visible = true;
                AlertIcon.Attributes.Add("class", "bi bi-bug-fill");
                alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                alertText.Text = "Something went wrong, please contact IT dept";
                ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
            }
            UpdateBtn.Visible = false;
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
            DisableFields();
            BindGridView();

        }

        protected void AbortBtn_Click(object sender, EventArgs e)
        {

        }

        protected void QueryBtn_Click(object sender, EventArgs e)
        {
            clearFields();
            filterText.BackColor = System.Drawing.Color.LightYellow;
            filterText.Enabled = true;
            filterText.Focus();
            SearchBtn.Visible = true;
            RefreshBtn.Visible = false;
            QueryBtn.Visible = false;
            CancelBtn.Visible = true;
            ClearBtn.Visible = false;
            SaveBtn.Visible = false;
            NewBtn.Visible = true;
            alert.Visible = true;
            EditBtn.Visible = false;
            UpdateBtn.Visible = false;

            AlertIcon.Attributes.Add("class", "bi bi-database-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Query Enabled";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            DisableFields();
        }

        protected void filterText_TextChanged(object sender, EventArgs e)
        {
            DataFilter();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            DataFilter();
        }

        protected void RefreshBtn_Click(object sender, EventArgs e)
        {

            filterText.Enabled = false;
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
            UpdateBtn.Visible = false;

            BindGridView();
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-list-check");
            alert.Attributes.Add("class", " alert alert-primary  alert-dismissible ");
            alertText.Text = "Updated Succesfully";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");

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
            UpdateBtn.Visible = false;

            clearFields();
            inputWorkorder.Focus();
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
            alertText.Text = "Query Aborted";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            DisableFields();
        }

        protected void myTable_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

                e.Row.Cells[0].Text = "Select";
                e.Row.Cells[1].Text = "ID";
                e.Row.Cells[2].Text = "WorkOrder";
                e.Row.Cells[3].Text = "Model";
                e.Row.Cells[4].Text = "Main";
                e.Row.Cells[5].Text = "Quantity";

                e.Row.Cells[6].Text = "Rate";
                e.Row.Cells[7].Text = "RateMin";


            }
        }

        protected void myTable_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            myTable.PageIndex = e.NewPageIndex;
            BindGridView();
        }
        static string IDTable;
        protected void myTable_SelectedIndexChanged(object sender, EventArgs e)
        {
            SaveBtn.Visible = false;
            DeleteBtn.Visible = false;
            NewBtn.Visible = true;
            ClearBtn.Visible = true;
            EditBtn.Visible = true;
            CancelBtn.Visible = false;
            QueryBtn.Visible = true;
            RefreshBtn.Visible = true;
            SearchBtn.Visible = false;
            filterText.Enabled = false;
            UpdateBtn.Visible = false;

            OriginalStateButton();


            IDTable = myTable.SelectedRow.Cells[1].Text.ToString();
            inputID.Text = IDTable.ToString();
            inputWorkorder.Text = myTable.SelectedRow.Cells[2].Text.ToString();
            inputModel.Text = myTable.SelectedRow.Cells[3].Text.ToString();
            inputMain.Text = myTable.SelectedRow.Cells[4].Text.ToString();
            inputQty.Text = myTable.SelectedRow.Cells[5].Text.ToString();
            inputUPH.Text = myTable.SelectedRow.Cells[6].Text.ToString();
            inputUPHMIN.Text = myTable.SelectedRow.Cells[7].Text.ToString();


            alert.Visible = true;
            AlertIcon.Attributes.Add("class", " bi bi-info-circle-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Bounded Succesfully";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2000)</script>");


        }

        protected void ExportBtn_Click(object sender, EventArgs e)
        {

        }

        protected void RegresarBtn_Click1(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click1(object sender, EventArgs e)
        {

        }

        protected void inputWorkorder_TextChanged(object sender, EventArgs e)
        {

        }
        Boolean T = true;
        public void EnableFields()
        {
            
            inputWorkorder.Enabled = T;
            inputMain.Enabled = true;
            inputUPHMIN.Enabled = true;
            inputUPH.Enabled = true;
            inputQty.Enabled = true;
            inputModel.Enabled = true;
        }
        public void DisableFields()
        {
            inputWorkorder.Enabled = false;
            inputMain.Enabled = false;
            inputUPHMIN.Enabled = false;
            inputUPH.Enabled = false;
            inputQty.Enabled = false;
            inputModel.Enabled = false;

        }


        private void BindGridView()
        {

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["pth"].ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("GetLastWOPTH200", connection);
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
                    //AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    //alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    //alertText.Text = "Query Executed Succesfully ";
                    //ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Data Not Found";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
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
            filterText.Enabled = false;
            UpdateBtn.Visible = false;

            footer.Text = Convert.ToString(DateTime.Now);
            RefreshBtn.Visible = true;
        }

        public void OriginalStateButton()
        {
            ClearBtn.Attributes.Add("class", "boton btn btn-warning");
            icono.Attributes.Add("class", "bi bi-eraser-fill");
        }

        public void ModifyStateButton()
        {
            ClearBtn.Attributes.Add("class", "boton  fw-bold btn btn-secondary ");
            icono.Attributes.Add("class", "bi bi-x-circle-fill");
        }
        public void clearFields()
        {
            inputID.Text = null;
            inputWorkorder.Text = null;
            inputModel.Text = null;
            inputQty.Text = null;
            inputUPH.Text = null;
            inputUPHMIN.Text = null;
            filterText.Text = null;
            inputMain.Text = null;

        }

        public void DataFilter()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["pth"].ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("GetWOPTHFilterLike", connection);
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
                    UpdateBtn.Visible = false;

                    AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Query Executed Succesfully ";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Work Order Not Found";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }
        }
    }
}