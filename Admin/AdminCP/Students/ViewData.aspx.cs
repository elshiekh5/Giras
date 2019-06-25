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

public partial class AdminStudentsViewData : AdminMasterPage
{
    public int Index = 0;
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
            LoadFilesData();
        }
    }
    //-----------------------------------------------
    #endregion
    
    


    #region --------------GetSqlConnection--------------
    public SqlConnection GetSqlConnection()
    {
        return new SqlConnection(ConfigurationManager.ConnectionStrings["Connectionstring"].ToString());
    }
    //------------------------------------------
    #endregion
    public void LoadFilesData()
    {
        DataTable dt = new DataTable();
        using (SqlConnection myConnection = GetSqlConnection())
        {
            SqlCommand myCommand = new SqlCommand("Select * from [dbo].[StudentsFiles] Order By FileID DESC", myConnection);
            myCommand.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(myCommand);
            myConnection.Open();
            da.Fill(dt);
            myConnection.Close();
             
        }
        if (dt!=null && dt.Rows.Count > 0)
        {
        ddlStudentsFiles.DataSource = dt;
        ddlStudentsFiles.DataTextField = "Titel";
        ddlStudentsFiles.DataValueField = "FileID";
        ddlStudentsFiles.DataBind();
        
            int firstFileID = Convert.ToInt32(dt.Rows[0][0]);
            LoadGridData(firstFileID);
        }

    }

  
    
    
    
    protected void StudentsFiles_SelectedIndexChanged(object sender, EventArgs e)
    {
        int fileID = Convert.ToInt32(ddlStudentsFiles.SelectedValue);
        LoadGridData(fileID);
    }

    protected void LoadGridData(int fileID)
    {
        DataTable dt = new DataTable();
        using (SqlConnection myConnection = GetSqlConnection())
        {
            SqlCommand myCommand = new SqlCommand(string.Format("Select * from [dbo].[StudentsData] Where FileID ={0} Order By Name ASC", fileID), myConnection);
            myCommand.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(myCommand);
            myConnection.Open();
            da.Fill(dt);
            myConnection.Close();

        }
        dgStudents.DataSource = dt;
        dgStudents.DataKeyField = "ID";
        dgStudents.DataBind();
    }

    protected bool DeleteStudent(int ID)
    {
        int result = 0;
        string command = string.Format("Delete From [dbo].[StudentsData] WHERE ID = {0}", ID);
        using (SqlConnection myConnection = GetSqlConnection())
        {
            SqlCommand myCommand = new SqlCommand(command, myConnection);
            myCommand.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(myCommand);
            myConnection.Open();
            result = myCommand.ExecuteNonQuery();
            myConnection.Close();


        }
        if (result > 0)
            return true;
        else
            return false;
        
    }
    protected void dgStudents_ItemDataBound(object sender, DataGridItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            e.Item.Cells[0].Text =(++Index).ToString();
        }
    }
    protected void dgStudents_DeleteCommand(object source, DataGridCommandEventArgs e)
    {
        int itemID = Convert.ToInt32(dgStudents.DataKeys[e.Item.ItemIndex]);
       bool result = DeleteStudent(itemID);
        if(result)
       {
           int fileID = Convert.ToInt32(ddlStudentsFiles.SelectedValue);
           LoadGridData(fileID);
       }
    }
}

