<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="DesignationSalaries.aspx.cs" Inherits="Admin_DesignationSalaries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Designation & Salaries</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">

<table class="table">
<tr>
<td>Name:</td>
 <td> 
     <asp:DropDownList ID="ddlName" CssClass="form-control" runat="server" 
         AutoPostBack="True" onselectedindexchanged="ddlName_SelectedIndexChanged">
     <asp:ListItem Text="Select" Value="Select" Selected="True"></asp:ListItem>
     </asp:DropDownList>
 </td>
<td>Designation: </td>
 <td>
 <asp:DropDownList ID="ddlDesignation" CssClass="form-control" runat="server">
 <asp:ListItem Text="Select" Value="Select" Selected="True"></asp:ListItem>
 </asp:DropDownList>
   </td>
<td>SalaryPerDay</td>
 <td>
     <asp:TextBox ID="txtSalaryPerDay" CssClass="form-control" runat="server"></asp:TextBox>
 </td>


</tr>

<tr>
<td>HRA </td>
<td><asp:TextBox ID="txtHRA" CssClass="form-control" runat="server"></asp:TextBox> </td>

<td>DA </td>   <td> <asp:TextBox ID="txtDA" CssClass="form-control" runat="server"></asp:TextBox> </td>

<td>TA </td>   <td> <asp:TextBox ID="txtTA" CssClass="form-control" runat="server"></asp:TextBox> </td>

</tr>

<tr>
<td> MA</td>   <td> <asp:TextBox ID="txtMA" CssClass="form-control" runat="server"></asp:TextBox> </td>
<td>Month </td> 

  <td> 
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
<td>Year </td>
   <td> <asp:TextBox ID="txtYear" CssClass="form-control" runat="server"></asp:TextBox> </td>

</tr>

<tr>
<td> Profesionalfund</td>   <td> <asp:TextBox ID="txtProfesionalfund" CssClass="form-control" runat="server"></asp:TextBox> </td>
<td>FoodAllowance </td>   <td> <asp:TextBox ID="txtFoodAllowance" CssClass="form-control" runat="server"></asp:TextBox> </td>
<td>NoOfLeaves </td>   <td> <asp:TextBox ID="txtNoOfLeaves" CssClass="form-control" runat="server"></asp:TextBox> </td>

</tr>


<tr>
<td> Earnings</td>   <td> <asp:TextBox ID="txtEarnings" CssClass="form-control" runat="server"></asp:TextBox> </td>
<td>Deductions </td>   <td> <asp:TextBox ID="txtDeductions" CssClass="form-control" runat="server"></asp:TextBox> </td>
<td>NetSalary </td>   <td> <asp:TextBox ID="txtNetSalary" CssClass="form-control" runat="server"></asp:TextBox> </td>

</tr>

<tr>
<td> 
    <asp:Button ID="btnCalcuate" CssClass="btn btn-success" runat="server" 
        Text="Calculate" onclick="btnCalcuate_Click" /></td>
<td><asp:Button ID="btnCancel" CssClass="btn btn-warning" runat="server" Text="Cancel" /></td>
<td><asp:Button ID="btnClear" CssClass="btn btn-danger" runat="server" Text="Clear" /></td>
</tr>

</table>
</div>
</asp:Content>

