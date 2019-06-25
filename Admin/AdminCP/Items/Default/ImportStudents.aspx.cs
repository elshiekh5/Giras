using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel;


public partial class GenevaAribitation_ImportStudents : System.Web.UI.Page
{

    DataTable dtNumbersAndMsgs = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    public static SqlConnection GetSqlConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string filePath = MapPath(fuFile.FileName);

        string ext = System.IO.Path.GetExtension(fuFile.PostedFile.FileName);

        string FileName = Guid.NewGuid().ToString().Substring(0, 4) + fuFile.PostedFile.FileName.Remove(0, fuFile.PostedFile.FileName.LastIndexOf("."));

        fuFile.PostedFile.SaveAs(HttpContext.Current.Server.MapPath("~/GenevaAribitation/UploadsFiles/") + FileName);
        //fuFile.SaveAs(FileName);

        FileStream stream = File.Open(HttpContext.Current.Server.MapPath("~/GenevaAribitation/UploadsFiles/") + FileName, FileMode.Open, FileAccess.Read);

        if (ext.Equals(".xls"))
        {
            //1. Reading from a binary Excel file ('97-2003 format; *.xls)
            IExcelDataReader excelReader = ExcelReaderFactory.CreateBinaryReader(stream);
            getexcelcontacts(FileName, excelReader);
        }
        else if (ext.Equals(".xlsx"))
        {
            //2. Reading from a OpenXml Excel file (2007 format; *.xlsx)
            IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(stream);
            getexcelcontacts(FileName, excelReader);
        }
        else
        {
             
            return;
        }

        try
        {
            using (SqlConnection myConnection = GetSqlConnection())
            {
                myConnection.Open();
                using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(myConnection))
                {

                    sqlBulkCopy.ColumnMappings.Add("StudentName", "StudentName");
                    sqlBulkCopy.ColumnMappings.Add("StudentNo", "StudentNo");
                    sqlBulkCopy.BatchSize = 300;
                    sqlBulkCopy.DestinationTableName = "Students";
                    sqlBulkCopy.WriteToServer(dtNumbersAndMsgs);
                }
            }
        }
        catch
        {
        }

       
    }

    public void getexcelcontacts(string _filepath, IExcelDataReader excelReader)
    {
        dtNumbersAndMsgs.Columns.Add("StudentName");
        dtNumbersAndMsgs.Columns.Add("StudentNo");
        dtNumbersAndMsgs.Columns[0].DataType = System.Type.GetType("System.String");
        dtNumbersAndMsgs.Columns[1].DataType = System.Type.GetType("System.String");


        DataSet result = excelReader.AsDataSet();
        if (result.Tables[0].Columns.Count > 1)
        {
            foreach (DataRow row in result.Tables[0].Rows)
            {
                if (row[0] == DBNull.Value) 
                { break; }

                dtNumbersAndMsgs.Rows.Add(row[0].ToString(), row[1].ToString());
            }
        }
       
    }

   

}