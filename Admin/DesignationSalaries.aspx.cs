using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Admin_DesignationSalaries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack) 
        { 
            
            BindName();
            BindDesignation();
            txtNoOfLeaves.Text = "0";
            
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
    protected void btnCalcuate_Click(object sender, EventArgs e)
    {
        try
        {
            //Calculate salary
            // No. of Leaves
            int i3 = int.Parse(txtNoOfLeaves.Text);

            // basic salary & salary per day


            float i1 = float.Parse(Session["BasicSalary"].ToString());
            float i2 = i1 / 31;
            txtSalaryPerDay.Text = i2.ToString();

            //------------------HRA
            float i4 = i2 * i3;

            float f11 = float.Parse(Session["BasicSalary"].ToString());
            float f2 = 20 * f11 / 100;
            txtHRA.Text = f2.ToString();

            //-------------DA
            float f12 = 10 * f11 / 100;
            txtDA.Text = f12.ToString();

            //-------------------TA
            float f13 = 2 * f11 / 100;
            txtTA.Text = f13.ToString();

            //------------MA

            float f14 = 1 * f11 / 100;
            txtMA.Text = f14.ToString();

            //---------------professionalfund
            float f15 = 3 * f11 / 100;
            txtProfesionalfund.Text = f15.ToString();

            //---------foodallowance
            float f16 = 4 * f11 / 100;
            txtFoodAllowance.Text = f16.ToString();

            //------------Earnings
            float f17 = f2 + f12 + f13 + f14;
            txtEarnings.Text = f17.ToString();

            //---------------------
            float f18 = i4 + f15 + f16;

            //-----------deduction

            float f19 = (f2 + f12 + f13 + f14) - (f18 = i4 + f15 + f16);
            txtDeductions.Text = f19.ToString();

            //---------NetSalary

            float f20 = (i1 + f17) - (f19);
            txtNetSalary.Text = f20.ToString();



            //-------insert record into databasse
            SqlCommand cmd = new SqlCommand("insert into DesignationSalaries(Name,Designation,BasicSalary,SalaryPerDay,HRA,DA,TA,MA,ProffesionalFund,FoodAllowance,NoOfLeaves,Earnings,Deductions,NetSalary,Month,Year,CreatedBy,CreatedDate) values(@Name,@Designation,@BasicSalary,@SalaryPerDay,@HRA,@DA,@TA,@MA,@ProffesionalFund,@FoodAllowance,@NoOfLeaves,@Earnings,@Deductions,@NetSalary,@Month,@Year,@CreatedBy,GETDATE())");
            cmd.Parameters.AddWithValue("@Name",ddlName.SelectedValue);
            cmd.Parameters.AddWithValue("@Designation",ddlDesignation.SelectedValue );
            cmd.Parameters.AddWithValue("@BasicSalary",Convert.ToDouble(Session["BasicSalary"].ToString()));
            cmd.Parameters.AddWithValue("@SalaryPerDay",Convert.ToDouble(txtSalaryPerDay.Text));
            cmd.Parameters.AddWithValue("@HRA",Convert.ToDouble(txtHRA.Text));
            cmd.Parameters.AddWithValue("@DA",Convert.ToDouble(txtDA.Text) );
            cmd.Parameters.AddWithValue("@TA",Convert.ToDouble(txtTA.Text));
            cmd.Parameters.AddWithValue("@MA",Convert.ToDouble(txtMA.Text) );
            cmd.Parameters.AddWithValue("@ProffesionalFund",Convert.ToDouble(txtProfesionalfund.Text) );
            cmd.Parameters.AddWithValue("@FoodAllowance",Convert.ToDouble(txtFoodAllowance.Text));
            cmd.Parameters.AddWithValue("@NoOfLeaves",Convert.ToDouble(txtNoOfLeaves.Text) );
            cmd.Parameters.AddWithValue("@Earnings",Convert.ToDouble(txtEarnings.Text));
            cmd.Parameters.AddWithValue("@Deductions",Convert.ToDouble(txtDeductions.Text));
            cmd.Parameters.AddWithValue("@NetSalary", Convert.ToDouble(txtNetSalary.Text));
            cmd.Parameters.AddWithValue("@Month",ddlMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Year",txtYear.Text);
             cmd.Parameters.AddWithValue("@CreatedBy", Session["UserName"].ToString());
             if (InsertUpdateData2(cmd))
             {

                 Session["Name"] = ddlName.SelectedItem.Text;
                 Session["Designation"] = ddlDesignation.SelectedItem.Text;
                 Session["SalaryPerDay"] = txtSalaryPerDay.Text;
                 Session["Deductions"] = txtDeductions.Text;
                 Session["Netsalary"] = txtNetSalary.Text;
                 Session["Earnings"] = txtEarnings.Text;
                 Session["NoOfLeaves"] = txtNoOfLeaves.Text;
                 Session["month"] = ddlMonth.SelectedItem.Text;
                 Session["year"] = txtYear.Text;
                 Response.Write("<script>alert('Record Saved')</script>");
                 Response.Redirect("Payslips.aspx");
             }

             
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('"+ex.Message+"')</script>");
        }
    }
    protected void ddlName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("select BasicSalary from addemployee where Id=@ID", con);
        cmd.Parameters.AddWithValue("ID",ddlName.SelectedValue );
       
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        da.Fill(ds, "dt");
        con.Close();
        if (ds.Tables[0].Rows.Count > 0)
        {
            Session["BasicSalary"] = ds.Tables[0].Rows[0]["BasicSalary"].ToString();
            //txtNetSalary.Text = Session["BasicSalary"].ToString();
        }
        else
        {
            Session["BasicSalary"] = 0;
        }
    }
}