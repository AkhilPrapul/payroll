using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Payslips : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            if(!IsPostBack)
            {
                BindName();
                BindDesignation();

               txtSalaryPerDay.Text= Session["SalaryPerDay"].ToString(); 
                txtDeductions.Text=Session["Deductions"] .ToString(); 
               txtNetSalary.Text= Session["Netsalary"] .ToString(); 
                txtEarnings.Text=Session["Earnings"] .ToString(); 
                txtNoOfLeaves.Text=Session["NoOfLeaves"] .ToString(); 
                ddlMonth.SelectedItem.Text=Session["month"].ToString();
                txtYear.Text=Session["year"].ToString();
                txtBasicSalary.Text = Session["BasicSalary"].ToString();

                txtEmail.Text = Session["UserEmail"].ToString();
                ddlName.SelectedItem.Text=Session["Name"].ToString();
                ddlDesignation.SelectedItem.Text= Session["Designation"].ToString(); 

            }
        }
        else
        {
            Response.Redirect("~/logout.aspx");
        }
    }
    //--------------------Resuable method-------------------
    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["PMS"].ConnectionString;
    }

    private Boolean InsertUpdateData(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private Boolean InsertUpdateData2(SqlCommand cmd)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
            return false;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    //------------------

    private void BindName()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("select distinct ID,Name from addemployee", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd); DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ddlName.DataSource = dt;
            ddlName.DataTextField = "Name";
            ddlName.DataValueField = "ID";
            ddlName.DataBind();
            ddlName.Items.Insert(0, new ListItem("--Select--", "0"));

        }

    }

    private void BindDesignation()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("select distinct ID,Designation from tblDesignation with(nolock) where Designation!=''", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd); DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ddlDesignation.DataSource = dt;
            ddlDesignation.DataTextField = "Designation";
            ddlDesignation.DataValueField = "ID";
            ddlDesignation.DataBind();
            ddlDesignation.Items.Insert(0, new ListItem("--Select--", "0"));
        }

    }
}