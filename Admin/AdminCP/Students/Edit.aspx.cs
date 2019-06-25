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
            LoadData();
        }

    }
    //-----------------------------------------------
    #endregion


    #region ---------------LoadData---------------
    //-----------------------------------------------
    //LoadData
    //-----------------------------------------------
    protected void LoadData()
    {
        int ID = 0;
        if (MoversFW.Components.UrlManager.ChechIsValidIntegerParameter("id"))
        {
            ID = Convert.ToInt32(Request.QueryString["id"]);
        }
        else
        {
            Response.Redirect("ViewData.aspx");
        }
        //if (!Page.IsValid)
        //{
        //    return;
        //}

        //-------------
        string Name = txtName.Text;
        string No = txtNo.Text;
        string Titel = txtTitle.Text;
        //-----------------------------------------------------------------
        DataTable dt = GetStudent(ID);
        if (dt != null && dt.Rows.Count > 0)
        {
            txtName.Text = dt.Rows[0]["Name"].ToString();
            txtNo.Text = dt.Rows[0]["No"].ToString();
            txtTitle.Text = dt.Rows[0]["Title"].ToString();
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
        int ID = 0;
        if (MoversFW.Components.UrlManager.ChechIsValidIntegerParameter("id"))
        {
            ID = Convert.ToInt32(Request.QueryString["id"]);
        }
      

        //-------------
        string Name = txtName.Text;
        string No = txtNo.Text;
        string Titel = txtTitle.Text;
        //-----------------------------------------------------------------
        bool result = UpdateStudent(ID, Name, No, Titel);
        if (result)
        {

            General.MakeAlertSucess(lblResult, Resources.AdminText.SavingDataSuccessfuly);

        }
        else
        {

            General.MakeAlertError(lblResult, Resources.AdminText.SavingDataFaild);
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
    public DataTable GetStudent(int ID)
    {
        using (SqlConnection myConnection = GetSqlConnection())
        {
            string command = string.Format("Select * From [dbo].[StudentsData] WHERE ID = {0}", ID);
            SqlCommand myCommand = new SqlCommand(command, myConnection);
            myCommand.CommandType = CommandType.Text;
            // Execute the command
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(myCommand);
            myConnection.Open();
            da.Fill(dt);
            myConnection.Close();
            return dt;
        }

    }
    public bool UpdateStudent(int ID, string Name, string No, string Titel)
    {
        using (SqlConnection myConnection = GetSqlConnection())
        {
            string command = string.Format("UPDATE [dbo].[StudentsData] SET Name='{0}' , No='{1}',Title='{2}' WHERE ID = {3}",
                Name, No, Titel, ID);
            SqlCommand myCommand = new SqlCommand(command, myConnection);
            myCommand.CommandType = CommandType.Text;
            // Execute the command
            bool status = false;
            myConnection.Open();
            if (myCommand.ExecuteNonQuery() > 0)
            {
                status = true;
            }
            myConnection.Close();
            return status;
        }
    
    }

    
    
}

