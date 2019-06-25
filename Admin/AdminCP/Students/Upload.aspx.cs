using System;
using DCCMSNameSpace;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using System.Drawing;
using DCCMSNameSpace.Zecurity;
using System.Data.SqlClient;
using Excel;

public partial class AdminStudentsUpload : AdminMasterPage
{

    #region ---------------Page_Load---------------
    //-----------------------------------------------
    //Page_Load
    //-----------------------------------------------
    private void Page_Load(object sender, System.EventArgs e)
    {
        lblResult.Text = "";
        if (!IsPostBack)
        {
            this.Page.Title = "ÇáãÓÊÔÇÑíä";
        }
    }
    //-----------------------------------------------
    #endregion
    
    #region ---------------btnSave_Click---------------
    //-----------------------------------------------
    //btnSave_Click
    //-----------------------------------------------
    protected void btnSave_Click(object sender, EventArgs e)
    {
        
            if (!Page.IsValid)
            {
                return;
            }

            int FileID = 0;
            string Titel = "";
            string FileName = "";
            string FileExtention = "";

            //-------------
            FileExtention = Path.GetExtension(fuFile.FileName);
            FileName = fuFile.FileName;
            Titel = txtTitle.Text;
            //-----------------------------------------------------------------
            AddNewStudentsFile(out  FileID, Titel, FileName, FileExtention);

            
            if (FileID>0)
            {

                //Photo-----------------------------
                if (fuFile.HasFile)
                {
                    string filesPath = "/Content/UpFiles/Excel/";// Server.MapPath() n;
                    string PhysicalPath = DCServer.MapPath(filesPath) + FileID + FileExtention;

                    fuFile.SaveAs(PhysicalPath);
                    DataTable dtNumbersAndMsgs = ReadExcelFile(PhysicalPath, FileExtention, FileID);
                    bool result = SaveExcelData(dtNumbersAndMsgs);
                }
                General.MakeAlertSucess(lblResult, Resources.AdminText.SavingDataSuccessfuly);
                //LoadList();
                //ClearControls();
            }
            else
            {

                General.MakeAlertError(lblResult, Resources.AdminText.SavingDataFaild);
            }
    }
    //-----------------------------------------------
    #endregion


    protected DataTable ReadExcelFile(string physicalPath, string ext, int FileID)
    {
        FileStream stream = File.Open(physicalPath, FileMode.Open, FileAccess.Read);
        IExcelDataReader excelReader = null;
        if (ext.Equals(".xls"))
        {
            //1. Reading from a binary Excel file ('97-2003 format; *.xls)
             excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
        }
        else if (ext.Equals(".xlsx"))
        {
            //2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
             excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
        }

        DataTable dtNumbersAndMsgs = new DataTable();
        dtNumbersAndMsgs.Columns.Add("ID", typeof(Int32));
        dtNumbersAndMsgs.Columns.Add("Name",typeof(string));
        dtNumbersAndMsgs.Columns.Add("No",typeof(string));
        dtNumbersAndMsgs.Columns.Add("Title",typeof(string));
        dtNumbersAndMsgs.Columns.Add("FileID", typeof(Int32));
        //-------------------------------------------------------------------
        DataRow newRow = null;
        DataRow row = null;
        DataSet result = excelReader.AsDataSet();
        if (result.Tables[0].Columns.Count > 1)
        {
            for (int i = 1; i < result.Tables[0].Rows.Count; i++)
            {
                row = result.Tables[0].Rows[i];
                if (row.ItemArray.Length > 0)
                {
                    newRow = dtNumbersAndMsgs.NewRow();

                    if (row.ItemArray.Length > 0 && row[0] != DBNull.Value)
                    { newRow["Name"] = (string)row[0].ToString(); }
                    if (row.ItemArray.Length > 1 && row[1] != DBNull.Value)
                    { newRow["No"] = (string)row[1].ToString(); }
                    if (row.ItemArray.Length > 2 && row[2] != DBNull.Value)
                    { newRow["Title"] = (string)row[2].ToString(); }
                    newRow["FileID"] = FileID;
                    dtNumbersAndMsgs.Rows.Add(newRow);
                }
            }
        }
        return dtNumbersAndMsgs;
    }
    #region --------------GetSqlConnection--------------
    public SqlConnection GetSqlConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["Connectionstring"].ToString());
    }
    //------------------------------------------
    #endregion
    public void AddNewStudentsFile(out int FileID, string Titel, string FileName, string FileExtention)
    {
        FileID = 0;
        using (SqlConnection myConnection = GetSqlConnection())
        {
            SqlCommand myCommand = new SqlCommand("StudentsFiles_Create", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            // Set the parameters
            myCommand.Parameters.Add("@FileID", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
            myCommand.Parameters.Add("@Titel", SqlDbType.NVarChar).Value = Titel;
            myCommand.Parameters.Add("@FileName", SqlDbType.NVarChar).Value = FileName;
            myCommand.Parameters.Add("@FileExtention", SqlDbType.VarChar).Value = FileExtention;
            //----------------------------------------------------------------------------------------------
            // Execute the command
            bool status = false;
            myConnection.Open();
            if (myCommand.ExecuteNonQuery() > 0)
            {
                status = true;
                //Get ID value from database and set it in object
                FileID = (int)myCommand.Parameters["@FileID"].Value;
            }
            myConnection.Close();
        }
    
    }

    public bool SaveExcelData(DataTable dt) {
            bool Result = false;
            using (SqlConnection myConnection = GetSqlConnection())
            {
                myConnection.Open();
                using (SqlBulkCopy bulkCopy = new SqlBulkCopy(myConnection))
                {
                    bulkCopy.DestinationTableName = "[dbo].[StudentsData]";
                    try
                    {
                        // Write from the source to the destination.
                        bulkCopy.WriteToServer(dt);
                        Result = true;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        bulkCopy.Close();
                    }
                }
            }
            return Result;
        //--------------------------------------------------------
    }
    /*
    public void SaveExcelData()
    {
        using (SqlConnection myConnection = GetSqlConnection())
        {
            myConnection.Open();
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(myConnection))
            {
                sqlBulkCopy.ColumnMappings.Add("ID", "ID");
                sqlBulkCopy.ColumnMappings.Add("Name", "Name");
                sqlBulkCopy.ColumnMappings.Add("No", "No");
                sqlBulkCopy.ColumnMappings.Add("Title", "Title");
                sqlBulkCopy.ColumnMappings.Add("FileID", "FileID");
                sqlBulkCopy.BatchSize = 300;
                sqlBulkCopy.DestinationTableName = "Students";
                sqlBulkCopy.WriteToServer(dtNumbersAndMsgs);
            }
        }
    }
    */
    /*
    #region --------------LoadList--------------
    //---------------------------------------------------------
    //LoadList
    //---------------------------------------------------------
    protected void LoadList()
    {
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
        {
            int itemID = Convert.ToInt32(Request.QueryString["ID"]);

            List<ItemsFilesEntity> photosList = ItemsFilesFactory.GetAll(itemID, FileType);
            if (photosList != null && photosList.Count > 0)
            {
                rPhotos.DataSource = photosList;
                //rPhotos.DataKeyField = "FileID";
                rPhotos.DataBind();
                rPhotos.Visible = true;
            }
            else
            {
                rPhotos.Visible = false;

            }
        }
        else
        {
            Response.Redirect("/Admin/");
        }
    }
    //--------------------------------------------------------
    #endregion
    */
    
    /*
    protected void ddlItems_SelectedIndexChanged(object sender, EventArgs e)
    {
        int itemID = Convert.ToInt32(ddlItems.SelectedValue);
        LoadList();
    }
    protected void rPhotos_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            bool result = ItemsFilesFactory.Delete(id);
            if (result)
            {
                LoadList();
            }
            else
            {

                General.MakeAlertError(lblResult, Resources.AdminText.DeletingOprationFaild);
            }
        }
    }
    protected void rPhotos_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            Button lbtnDelete = (Button)e.Item.FindControl("lbtnDelete");
            lbtnDelete.Attributes.Add("onclick", "return confirm('" + Resources.AdminText.DeleteActivation + "')");
            if (!ZecurityManager.UserCanExecuteCommand(CommandName.Delete))
                lbtnDelete.Visible = false;
        }
    }
    */
}

