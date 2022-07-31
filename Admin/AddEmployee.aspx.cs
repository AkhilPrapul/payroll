using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_AddEmployee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)  {  BindDesignation(); BindGrid();  }        
    }
    private void BindDesignation()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("select distinct ID,Designation from tblDesignation with(nolock) where Designation!=''", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);  DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ddlDesignation.DataSource = dt;
            ddlDesignation.DataTextField = "Designation";
            ddlDesignation.DataValueField = "ID";
            ddlDesignation.DataBind();
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

    //------------------
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != string.Empty && TextBox3.Text != string.Empty && TextBox4.Text != string.Empty && TextBox8.Text != string.Empty)
        {
            if(IsRecordExixt()) {
                Response.Write("<script>alert('Record already exist try again');</script>");
            }
            else        {
                SqlCommand cmd = new SqlCommand("spInsertEmp");
                cmd.Parameters.AddWithValue("@Name", TextBox1.Text);               
                cmd.Parameters.AddWithValue("@Designation", ddlDesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@Username", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Password", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Fathername", TextBox5.Text);
                cmd.Parameters.AddWithValue("@DOB", TextBox6.Text);
                cmd.Parameters.AddWithValue("@Address", TextBox7.Text);
                cmd.Parameters.AddWithValue("@MobileNo", TextBox8.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox9.Text);
                cmd.Parameters.AddWithValue("@BasicSalary", Convert.ToDouble(TextBox10.Text));
                cmd.Parameters.AddWithValue("@DOJ", DateTime.Now);
                if (Convert.ToInt32(InsertUpdateData(cmd)) >= 1)  {
                    Response.Write("<script>alert('Save successfull');</script>");  clr(); BindGrid();
                }
                else   {   Response.Write("<script>alert('operation fail error');</script>");     }
            }
        }
        else {   Response.Write("<script>alert('Validation error');</script>"); }

    }

    private bool IsRecordExixt()
    {
        try
        {   SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)  {   con.Open();  }
            SqlCommand cmd = new SqlCommand("select Name,Designation,Username,Password,MobileNo,Email from  dbo.addemployee where Name@Name and Designation=@Designation and Username=@Username and Password=@Password and MobileNo=@MobileNo and Email=@Email ", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@Designation", ddlDesignation.SelectedValue);
            cmd.Parameters.AddWithValue("@Username", TextBox3.Text);
            cmd.Parameters.AddWithValue("@Password", TextBox4.Text);
            cmd.Parameters.AddWithValue("@MobileNo", TextBox8.Text);
            cmd.Parameters.AddWithValue("@Email", TextBox9.Text);           
            SqlDataAdapter da = new SqlDataAdapter(cmd); DataTable dt = new DataTable();
            da.Fill(dt);  con.Close();
            if (dt.Rows.Count >= 1) {  return true;  }  else  {  return false;   }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('exception error "+ex.Message+"');</script>");    
            return false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    private void clr()
    {
        TextBox1.Text = string.Empty;    TextBox3.Text = string.Empty;
        TextBox4.Text = string.Empty;        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;        TextBox8.Text = string.Empty;
        TextBox7.Text = string.Empty;        TextBox9.Text = string.Empty;
        TextBox10.Text = string.Empty;        TextBox11.Text = string.Empty;
        ddlDesignation.SelectedIndex = -1;
    }

    private void BindGrid()
    {
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("select t1.Id,t1.Name,t1.Designation as DesignationID ,t2.Designation as DesignationName, t1.Username,t1.Password,t1.Fathername,t1.DOB,t1.Address,t1.MobileNo,t1.Email,t1.BasicSalary,t1.DOJ from addemployee as t1 inner join tblDesignation as t2 on t2.ID=t1.Designation", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;  GridView1.DataBind();
        } else  {
            GridView1.DataSource = null;  GridView1.DataBind();
        }
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid();    

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();  

    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //--Delete Selected Row
        Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblID"));
        int id2 = Convert.ToInt32(id.Text);
        SqlConnection con = new SqlConnection(GetConnectionString());
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        string cmdstr = "DELETE FROM addemployee WHERE ID=@ID;";
        SqlCommand cmd = new SqlCommand(cmdstr, con);
        cmd.Parameters.AddWithValue("@ID", id2);
        cmd.ExecuteNonQuery();
        con.Close();
        GridView1.EditIndex = -1;
        BindGrid();

    }
    
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label idq = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblID"));
        int id2 = Convert.ToInt32(idq.Text);
        TextBox txtEditFullNameUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditFullName");
        DropDownList ddlGV1DesignationUpdate = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlGV1Designation");
        TextBox txtEditUsernameUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditUserName");
        TextBox txtEditPasswordUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditPassword");
        TextBox txtEditFatherNameUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditFathername");
        TextBox txtEditDOBUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditDOB");
        TextBox txtEditAddressUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAddress");
        TextBox txtEditmobileUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditMobile");
        TextBox txtEditEmailUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
        TextBox txtEditSalaryUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditBasicSalary");
        TextBox txtEditDOJUpdate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGV1EditDOJ");          
        SqlConnection con = new SqlConnection(GetConnectionString());
        SqlCommand cmd = new SqlCommand("update addemployee set Name=@Name,Designation=@Designation,Username=@Username,Password=@Password,Fathername=@Fathername,DOB=@DOB,Address=@Address,MobileNo=@MobileNo,Email=@Email,BasicSalary=@BasicSalary,DOJ=@DOJ where ID=@ID", con);
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        if (con.State == ConnectionState.Closed)
        {
            cmd.Connection.Open();
        }
        cmd.Parameters.AddWithValue("@Name",txtEditFullNameUpdate.Text );
        cmd.Parameters.AddWithValue("@Designation",ddlGV1DesignationUpdate.SelectedValue );
        cmd.Parameters.AddWithValue("@Username", txtEditUsernameUpdate.Text);
        cmd.Parameters.AddWithValue("@Password",txtEditPasswordUpdate.Text );
        cmd.Parameters.AddWithValue("@Fathername",txtEditFatherNameUpdate.Text );
        cmd.Parameters.AddWithValue("@DOB",txtEditDOBUpdate.Text );
        cmd.Parameters.AddWithValue("@Address",txtEditAddressUpdate.Text );
        cmd.Parameters.AddWithValue("@MobileNo",txtEditmobileUpdate.Text );
        cmd.Parameters.AddWithValue("@Email",txtEditEmailUpdate.Text );
        cmd.Parameters.AddWithValue("@BasicSalary", Convert.ToDouble(txtEditSalaryUpdate.Text));
        cmd.Parameters.AddWithValue("@DOJ", txtEditDOJUpdate.Text);
        cmd.Parameters.AddWithValue("@ID", id2);
        cmd.ExecuteNonQuery();
        cmd.Connection.Close();
        GridView1.EditIndex = -1;
        BindGrid();

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlEditBindDesignation = (DropDownList)e.Row.FindControl("ddlGV1Designation");

            //------------------------Bind Designation ----------------
            SqlConnection con1 = new SqlConnection(GetConnectionString());
            SqlCommand cmd1 = new SqlCommand("select distinct ID,Designation from tblDesignation where Designation!=''", con1);
            if (con1.State == ConnectionState.Closed)
            {
                con1.Open();
            }
            cmd1.CommandType = CommandType.Text;
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            con1.Close();
            if (dt1.Rows.Count > 0)
            {
                ddlEditBindDesignation.DataSource = dt1;
                ddlEditBindDesignation.DataValueField = "ID";
                ddlEditBindDesignation.DataTextField = "Designation";
                ddlEditBindDesignation.DataBind();
                ListItem ddlw3 = new ListItem("Select Option", "-1");
                ddlEditBindDesignation.Items.Insert(0, ddlw3);

                Label lblDesigID = (Label)e.Row.FindControl("lblEditGV1DesignID");
                ddlEditBindDesignation.SelectedValue = lblDesigID.Text;
            }
            else
            {
                ddlEditBindDesignation.DataSource = null;
                ddlEditBindDesignation.DataBind();
                //ddlEditMT.Items.Clear();
                ddlEditBindDesignation.SelectedIndex = -1;
            }

            //-------------------------End------------------

        }

        //----------Confirm Delete after delete button click event---
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string item = e.Row.Cells[0].Text;
            foreach (Button button in e.Row.Cells[13].Controls.OfType<Button>())
            {
                if (button.CommandName == "Delete")
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete  " + e.Row.Cells[0].Text + "?')){ return false; };";
                }
            }
        }
        //-----------------End
    }
}