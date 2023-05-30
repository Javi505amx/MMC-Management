using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Data.OleDb;
using System.Data.Common;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Web.DynamicData;
using SpreadsheetLight;
using SpreadsheetLight.Drawing;
using DocumentFormat.OpenXml.Spreadsheet;


namespace ManageWO
{
    public partial class FS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //NewBtn.Visible = false;
                BindGridView();
                QueryBtn.Visible = true;
            }
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {

        }

        protected void RegresarBtn_Click(object sender, EventArgs e)
        {

        }

        private void BindGridView()
        {

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["smt"].ConnectionString))
            {
                SqlCommand sqlCommand = new SqlCommand("GetLastFS", connection);
                sqlCommand.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlCommand);
                DataSet data = new DataSet();
                adapter.Fill(data);
                if (data.Tables.Count > 0)
                {
                    tableFS.DataSource = data.Tables[0];
                    tableFS.AllowPaging = true;
                    tableFS.DataBind();
                    connection.Close();
                    //AlertIcon.Attributes.Add("class", "bi bi-clipboard2-data");
                    //alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    //alertText.Text = "Query Executed Succesfully ";
                    //ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2500)</script>");
                }
                else
                {
                    //alert.Visible = true;
                    //AlertIcon.Attributes.Add("class", " bi bi-exclamation-octagon");
                    //alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    //alertText.Text = "Data Not Found";
                    //ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }

            //SaveBtn.Visible = false;
            //DeleteBtn.Visible = false;
            //ClearBtn.Visible = false;
            //NewBtn.Visible = true;
            //EditBtn.Visible = false;
            //SearchBtn.Visible = false;
            //QueryBtn.Visible = true;
            //CancelBtn.Visible = false;
            //filterText.Enabled = false;
            //UpdateBtn.Visible = false;

            //footer.Text = Convert.ToString(DateTime.Now);

            //RefreshBtn.Visible = true;
        }

        protected void inputWorkorder_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnFS_Click(object sender, EventArgs e)
        {

        }

        protected void tableFS_SelectedIndexChanged(object sender, EventArgs e)
        {
            //inputWorkorder.Text = tableFS.SelectedRow.Cells[1].Text.ToString();
            //inputModel.Text = tableFS.SelectedRow.Cells[2].Text.ToString();
        }

        protected void tableFS_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
        }

        protected void tableFS_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {

                
                e.Row.Cells[0].Text = "WorkOrder";
                e.Row.Cells[1].Text = "Model";
                e.Row.Cells[2].Text = "Download FS";
                e.Row.Cells[3].Text = "Delete FS";



            }
        }

        protected void tableFS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DownloadFS")
            {
                
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = tableFS.Rows[index];
                    string conString2 = ConfigurationManager.ConnectionStrings["smt"].ConnectionString;

                    SqlConnection sqlConnection00 = new SqlConnection(conString2);
                    SqlCommand sqlCommand00 = new SqlCommand("GetFS", sqlConnection00)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    sqlConnection00.Open();

                    sqlCommand00.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = row.Cells[0].Text.ToString();
                    SqlDataAdapter sqlDataAdapter00 = new SqlDataAdapter(sqlCommand00);
                    DataTable dt00 = new DataTable();
                    dt00.Load(sqlCommand00.ExecuteReader());
                    sqlConnection00.Close();
                    string date = DateTime.Now.ToString("dd/MM/yyyy");
                    date = date.Replace('/', '_');

                    //string pathFile00 = AppDomain.CurrentDomain.BaseDirectory + "BALANCE WO" + Session["wo"] + " " + Session["model"] + " " + date + ".xlsx";
                    //string pathFile = KnownFolders.Downloads.Path + "\\KIT SMT " + Session["model"] + " " + date + ".xlsx";
                    //AppDomain.CurrentDomain.BaseDirectory + "KIT SMT " + Session["model"] + " " + date  + ".xlsx";
                    string pathFile00 = HttpContext.Current.Server.MapPath(@"~/Files/" + "Feeder Setup" + Session["wo"] + " " + Session["model"] + "  " + date + ".xlsx");


                    SLDocument document00 = new SLDocument();
                    string TabName = row.Cells[1].Text.ToString();
                    document00.AddWorksheet(TabName);


                    string projectFolder = AppDomain.CurrentDomain.BaseDirectory;
                    string imgPath = Path.Combine(projectFolder, "Resources\\Images\\inv.png");

                    SLStyle styleHeader = document00.CreateStyle();
                    styleHeader.SetHorizontalAlignment(DocumentFormat.OpenXml.Spreadsheet.HorizontalAlignmentValues.Center);
                    styleHeader.Font.Bold = true;
                    document00.SetRowStyle(12, styleHeader);

                    SLStyle styleCenter = document00.CreateStyle();
                    styleCenter.SetHorizontalAlignment(DocumentFormat.OpenXml.Spreadsheet.HorizontalAlignmentValues.Center);
                    document00.SetColumnStyle(1, 5, styleCenter);

                    document00.MergeWorksheetCells("A2", "E2");
                    document00.SetActiveCell("A2");
                    document00.SetCellValue("A2", "FEEDER SETUP UPLOADED");
                    document00.SetCellStyle("A2", styleHeader);

                    SLPicture img = new SLPicture(imgPath);
                    img.SetPosition(6.5, 0.5);
                    img.ResizeInPixels(400, 130);
                    document00.InsertPicture(img);

                    document00.SetActiveCell("D5");
                    document00.SetCellValue("D5", "Work Order");
                    document00.SetCellStyle("D5", styleHeader);
                    document00.SetActiveCell("D6");
                    document00.SetCellValue("D6", "Model");
                    document00.SetCellStyle("D6", styleHeader);


                    document00.SetActiveCell("D11");
                    //document.SetCellValue("D11", "Establecer Formato FECHA Y HORA ");
                    //document.SetCellStyle("D11", styleHeader);

                    document00.SetActiveCell("D8");
                    document00.SetCellValue("D8", "Fecha");
                    document00.SetCellStyle("D8", styleHeader);

                    document00.SetActiveCell("E5");
                    document00.SetCellValue("E5", row.Cells[0].Text.ToString());

                    document00.SetActiveCell("E6");
                    document00.SetCellValue("E6", row.Cells[1].Text.ToString());

                    //document00.SetActiveCell("E7");
                    //document00.SetCellValue("E7", dataQtyWO.Text);

                    document00.SetActiveCell("E8");
                    document00.SetCellValue("E8", DateTime.Now.ToString("dd/MM/yyyy"));

                    document00.AutoFitColumn(6);
                    //document.Cells["D13"].NumberFormat= "m/d/yy h:mm";


                    SLStyle styleBorder = document00.CreateStyle();
                    styleBorder.Border.BottomBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.Thin;
                    styleBorder.Border.TopBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.Thin;
                    styleBorder.Border.LeftBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.Thin;
                    styleBorder.Border.RightBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.Thin;

                    SLStyle nonBorder = document00.CreateStyle();
                    nonBorder.Border.BottomBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.None;
                    nonBorder.Border.TopBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.None;
                    nonBorder.Border.LeftBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.None;
                    nonBorder.Border.RightBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.None;

                    document00.SetRowStyle(12, 12 + dt00.Rows.Count, styleBorder);

                    document00.SetActiveCell("A12");
                    document00.ImportDataTable("A12", dt00, true);
                    document00.CopyCellStyle("A12", "F12", "Q12");
                    document00.AutoFitColumn(1, 17);
                    //document00.SetColumnWidth(4, 14);

                    int rows = dt00.Rows.Count + 12;

                    //SLStyle bottomBorder = document00.CreateStyle();
                    //bottomBorder.Border.BottomBorder.BorderStyle = DocumentFormat.OpenXml.Spreadsheet.BorderStyleValues.Thin;

                    //string materialistSign = "B" + (rows + 10).ToString();
                    //string leaderSign = "D" + (rows + 10).ToString();

                    //document00.SetCellStyle(materialistSign, bottomBorder);
                    //document00.SetCellStyle(leaderSign, bottomBorder);

                    //string materialTitle = "B" + (rows + 11).ToString();
                    //string leaderTitle = "D" + (rows + 11).ToString();
                    //document00.SetActiveCell(materialTitle);
                    //document00.SetCellValue(materialTitle, "MATERIALISTA");

                    //document00.SetActiveCell(leaderTitle);
                    //document00.SetCellValue(leaderTitle, "LIDER AREA");

                    //document.

                    document00.DeleteWorksheet("Sheet1");
                    document00.SaveAs(pathFile00);
                    Response.ContentType = "application/octet-stream";

                    Response.AddHeader("Content-Disposition", "attachment; filename=" + "Feeder Setup  WO " + Session["wo"] + "  " + DateTime.Now + ".xlsx");

                    //Response.TransmitFile(Server.MapPath("BALANCE WO" + Session["wo"] + " " + Session["model"] + " " + date + ".xlsx"));

                    Response.TransmitFile(pathFile00);
                    Response.End();
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-info-circle-fill");
                    alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
                    alertText.Text = "Feeder Setup Downloades Succesfully";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2000)</script>");
                    BindGridView();

                }
                catch (Exception ex)
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi bi-bug-fill");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "You need to select a row of the table first";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",2000)</script>");
                    BindGridView();

                }

            }
            else if (e.CommandName == "DeleteFS")
            {
                try
                {
                    int index2 = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row2 = tableFS.Rows[index2];
                    string conString3 = ConfigurationManager.ConnectionStrings["smt"].ConnectionString;
                    SqlConnection sqlConnection001 = new SqlConnection(conString3);
                    SqlCommand sqlCommand001 = new SqlCommand("DeleteFSByWO", sqlConnection001)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    sqlConnection001.Open();
                    sqlCommand001.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = row2.Cells[0].Text.ToString();
                    sqlCommand001.ExecuteReader();
                    sqlConnection001.Close();
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-trash-fill");
                    alert.Attributes.Add("class", " alert alert-warning  alert-dismissible ");
                    alertText.Text = "Feeder Setup Deleted Succesfully";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
                    BindGridView();

                }
                catch(Exception ex )
                {
                    alert.Visible = true;
                    AlertIcon.Attributes.Add("class", " bi bi-info-circle-fill");
                    alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
                    alertText.Text = "Something went wrong";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",4000)</script>");
                    BindGridView();

                }
            }
        }

        protected void tableFS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            tableFS.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void NewBtn_Click(object sender, EventArgs e)
        {
            
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            DataFilter();
        }

        protected void RefreshBtn_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            filterText.BackColor = System.Drawing.Color.White;
            filterText.Enabled = false;
            SearchBtn.Visible = false;
            RefreshBtn.Visible = true;
            QueryBtn.Visible = true;
            CancelBtn.Visible = false;
            //SaveBtn.Visible = false;
            //DeleteBtn.Visible = false;
            //EditBtn.Visible = false;
            //ClearBtn.Visible = false;
            //NewBtn.Visible = false;
            //UpdateBtn.Visible = false;
            filterText.Text = null; 
            filterText.Enabled = false;
            
            //inputWorkorder.Focus();
            alert.Visible = true;
            AlertIcon.Attributes.Add("class", "bi bi-exclamation-diamond");
            alert.Attributes.Add("class", " alert alert-danger  alert-dismissible ");
            alertText.Text = "Query Aborted";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            
        }

        protected void filterText_TextChanged(object sender, EventArgs e)
        {
            DataFilter();
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
            //ClearBtn.Visible = false;
            //SaveBtn.Visible = false;
            //NewBtn.Visible = false;
            alert.Visible = true;
            //EditBtn.Visible = false;
            //UpdateBtn.Visible = false;

            AlertIcon.Attributes.Add("class", "bi bi-database-fill");
            alert.Attributes.Add("class", " alert alert-info  alert-dismissible ");
            alertText.Text = "Query Enabled";
            ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",3000)</script>");
            
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fuData.PostedFile != null && fuData.PostedFile.FileName != "")
            {
                try
                {
                    string path = string.Concat(Server.MapPath("~/FeederSetup/" + fuData.FileName));
                    fuData.SaveAs(path);
                    string excelCS = string.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=Excel 8.0", path);
                    using (OleDbConnection con = new OleDbConnection(excelCS))
                    {
                        OleDbCommand cmd = new OleDbCommand("SELECT * FROM [Hoja1$] WHERE WorkOrder <> ''", con);
                        con.Open();
                        DbDataReader dr = cmd.ExecuteReader();
                        string CS = ConfigurationManager.ConnectionStrings["smt"].ConnectionString;
                        SqlBulkCopy bulkInsert = new SqlBulkCopy(CS);
                        bulkInsert.DestinationTableName = "DataConcentrated";
                        bulkInsert.ColumnMappings.Add("WorkOrder", "WorkOrder");
                        bulkInsert.ColumnMappings.Add("KittingNote", "KittingNote");
                        bulkInsert.ColumnMappings.Add("Model", "Model");
                        bulkInsert.ColumnMappings.Add("PartNumber", "PartNumber");
                        bulkInsert.ColumnMappings.Add("Model&PartNumber", "Model&PartNumber");
                        bulkInsert.ColumnMappings.Add("Use", "Use");
                        bulkInsert.ColumnMappings.Add("Reference", "Reference");
                        bulkInsert.ColumnMappings.Add("FeederType", "FeederType");
                        bulkInsert.ColumnMappings.Add("Side", "Side");
                        bulkInsert.ColumnMappings.Add("Module", "Module");
                        bulkInsert.ColumnMappings.Add("Position", "Position");
                        bulkInsert.ColumnMappings.Add("Type", "Type");
                        bulkInsert.WriteToServer(dr);
                        con.Close();
                        
                        //Response.Write("<script language='Javascript'>alert('Archivo importado con exito');</script>");
                        AlertIcon.Attributes.Add("class", "bi bi-database-fill");
                        alert.Attributes.Add("class", " alert alert-success  alert-dismissible ");
                        alertText.Text = "Feeder Setup Uploaded Succesfully";
                        ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",6000)</script>");
                        BindGridView();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script language='Javascript'>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script language='Javascript'>alert('Sin archivo seleccionado');</script>");
            }
        }


        public void DataFilter()
        {
            
            using (SqlConnection connection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["smt"].ConnectionString))
            {
                SqlCommand sqlCommand1 = new SqlCommand("GetFSLike", connection1);
                sqlCommand1.CommandType = CommandType.StoredProcedure;
                connection1.Open();
                sqlCommand1.Parameters.Add("@data", SqlDbType.VarChar, 100).Value = filterText.Text;
                SqlDataAdapter adapter1 = new SqlDataAdapter(sqlCommand1);
                DataSet data1 = new DataSet();
                adapter1.Fill(data1);
                if (data1.Tables.Count > 0)
                {
                    tableFS.DataSource = data1.Tables[0];
                    tableFS.AllowPaging = true;
                    tableFS.DataBind();
                    connection1.Close();
                    /*IF DATA IS AVAILABLE*/
                    RefreshBtn.Visible = false;
                    SearchBtn.Visible = true;
                    CancelBtn.Visible = true;
                    

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
                    alertText.Text = "Data Not Found, Try Again";
                    ClientScript.RegisterStartupScript(GetType(), "HideLabel", "<script type=\"text/javascript\">setTimeout(\"document.getElementById('" + alert.ClientID + "').style.display='none'\",5000)</script>");
                }

            }
        }
    }
}