<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Payslips.aspx.cs" Inherits="Admin_Payslips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Payslips</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
<table  class=" table ">
        <tr>
           
            <td  style="font-family: Algerian; font-size: x-large; font-style: italic; color: #339966; text-align: center">
                PAYSLIPS GENERATE</td>
            <td>  &nbsp;</td>
        </tr>
        <tr>
            
            <td style="width: 25px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="color: #000000; width: 173px">
                Email</td>
            <td >
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="color: #000000; width: 173px">
                Name</td>
            <td >
               <asp:DropDownList ID="ddlName" CssClass="form-control" runat="server" >
     
     </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td style="color: #000000; width: 173px">
                Designation</td>
            <td >
                <asp:DropDownList ID="ddlDesignation" CssClass="form-control" runat="server">
 
 </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td style="color: #000000; width: 173px">
                Month</td>
            <td >
                 <asp:DropDownList ID="ddlMonth" CssClass="form-control" runat="server">
  <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
  <asp:ListItem Text="Jan" Value="Jan"></asp:ListItem>
  <asp:ListItem Text="Feb" Value="Feb"></asp:ListItem>
  <asp:ListItem Text="Mar" Value="Mar"></asp:ListItem>
  <asp:ListItem Text="Apr" Value="Apr"></asp:ListItem>
  <asp:ListItem Text="May" Value="May"></asp:ListItem>
  <asp:ListItem Text="Jun" Value="Jun"></asp:ListItem>
  <asp:ListItem Text="Jul" Value="Jul"></asp:ListItem>
  <asp:ListItem Text="Aug" Value="Aug"></asp:ListItem>
  <asp:ListItem Text="Sep" Value="Sep"></asp:ListItem>
  <asp:ListItem Text="Oct" Value="Oct"></asp:ListItem>
  <asp:ListItem Text="Nov" Value="Nov"></asp:ListItem>
  <asp:ListItem Text="Dec" Value="Dec"></asp:ListItem>
 </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                Year</td>
            <a href="#" class="last" style="text-decoration: none">
            <td style="width: 25px">
                <asp:TextBox ID="txtYear" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                NoOfWorkingDays</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtNoOfWorkingDays" runat="server" ReadOnly="True" CssClass="form-control">31</asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                BasicSalary</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtBasicSalary" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                SalaryPerDay</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtSalaryPerDay" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                Earnings</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtEarnings" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                NoOfLeaves</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtNoOfLeaves" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                Deductions</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtDeductions" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <a href="#" class="last">
            <td style="color: #333333; width: 173px">
                NetSalary</td>
            <td style="width: 25px">
                <asp:TextBox ID="txtNetSalary" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
            
        </tr>
        <tr>
            <td style="color: #333333; width: 173px">
                &nbsp;</td>
            <td style="width: 25px">
                &nbsp;</td>
            
        </tr>
        <tr>
            <td colspan="2" style="color: #333333; text-align: center">
                <asp:Button ID="Button1" runat="server" Height="32px" Text="SUBMIT"  CssClass="btn btn-success"
                    Width="87px"  />
&nbsp;
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Height="32px" Text="CANCEL" 
                    Width="76px"  />
            </td>
            
        </tr>
        <tr>
            <td style="color: #333333; width: 173px">
                &nbsp;</td>
            <td style="width: 25px">
                &nbsp;</td>
            
        </tr>
    </table>

</div>
    </a>
</asp:Content>

