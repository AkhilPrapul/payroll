using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class signin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string GetConnectionString()
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings["PMS"].ConnectionString;
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        if (IsFormValid())
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("usp_UsersCheckLoginDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@UserName", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }


                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {

                            if (chk_remember.Checked)
                            {
                                HttpCookie co = new HttpCookie(txtEmail.Text, txtPassword.Text);
                                co.Expires = DateTime.Now.AddMonths(1);
                                Response.Cookies.Add(co);
                            }
                            if (CheckBox2.Checked)
                            {
                                HttpCookie co1 = new HttpCookie("erplastid", txtEmail.Text);
                                co1.Expires = DateTime.Now.AddMonths(1);
                                Response.Cookies.Add(co1);

                                HttpCookie co2 = new HttpCookie("erplastpass", txtPassword.Text);
                                co2.Expires = DateTime.Now.AddMonths(1);
                                Response.Cookies.Add(co2);
                            }

                            Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "')</script>");
                            Session["UserName"] = dr.GetValue(0).ToString();
                            Session["UserEmail"] = dr.GetValue(1).ToString();

                            Session["UserType"] = dr.GetValue(3).ToString();

                        }
                        if (Session["UserType"].ToString() == "Admin")
                        {
                            Response.Redirect("Admin/Home.aspx");
                        }
                        else if (Session["UserType"].ToString() == "Manager")
                        {
                            Response.Redirect("Manager/Home.aspx");
                        }

                        else if (Session["UserType"].ToString() == "Employee")
                        {
                            Response.Redirect("Employee/Home.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/logout.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid UserID or Password...Try again')</script>");
                        txtEmail.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                        pnl_warning.Visible = true;
                        lbl_warning.Text = "Use correct email and password</br>";
                    }
                }
                catch (Exception ex)
                {
                    pnl_warning.Visible = true;
                    lbl_warning.Text = "Something went wrong! Contact your devloper </br>" + ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }
        else
        {
            pnl_warning.Visible = true;
            lbl_warning.Text = "Please fill all the requirements";
        }
    }

    private bool IsFormValid()
    {
        if (txtEmail.Text == string.Empty)
        {
            Response.Write("<script>alert('UserID is required')</script>");
            txtEmail.Text = string.Empty;
            txtEmail.Focus();
            return false;
        }
        if (txtPassword.Text == string.Empty)
        {
            Response.Write("<script>alert('UserID is required')</script>");
            txtPassword.Text = string.Empty;
            txtPassword.Focus();
            return false;
        }
        return true;

    }
}