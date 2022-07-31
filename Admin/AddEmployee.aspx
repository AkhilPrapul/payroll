<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    MaintainScrollPositionOnPostback="true" CodeFile="AddEmployee.aspx.cs" Inherits="Admin_AddEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Employee Registration</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2>
                    Add Employee</h2>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-9">
                        <table class="table-sm" width="100%">
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" CssClass=" form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Designation
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlDesignation" CssClass=" form-control" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    UserName
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" CssClass=" form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" CssClass=" form-control" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    FatherName
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" CssClass=" form-control" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 146px">
                                    DOB(DD-MM-YYYY)
                                </td>
                                <td style="width: 42px">
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBox6_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="TextBox6" Format="dd-MM-yyyy">
                                    </cc1:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass=" form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    MobileNo
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass=" form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox9" runat="server" CssClass=" form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Basic Salary
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox10" runat="server" CssClass=" form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 146px">
                                    DOJ
                                </td>
                                <td style="width: 42px">
                                    <asp:TextBox ID="TextBox11" runat="server" ReadOnly="True" CssClass=" form-control"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" OnClick="Button1_Click"
                                        Text="Add Emp" Height="38px" Width="104px" />
                                    <a href="#" class="last">
                                        <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Style="margin-left: 16px"
                                            Text="Cancel" Width="71px" OnClick="Button2_Click" Height="38px" />
                                </td>
                                <td style="text-align: center">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="table table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table table-sm table-condensed table-hover"
                        AutoGenerateColumns="false" runat="server" EmptyDataText="Record Not Found..."
                        DataKeyNames="ID" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="50" PagerSettings-Mode="Numeric"
                        PagerSettings-NextPageText="&gt;" Font-Size="7pt">
                        <Columns>
                            <asp:TemplateField HeaderText="#">
                                <ItemTemplate>
                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Name" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditFullName" runat="server" Text='<%# Eval("Name")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Designation">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1DesiName" runat="server" Text='<%# Eval("DesignationName")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditGV1DesignID" runat="server" Text='<%# Eval("DesignationID")%>'
                                        Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlGV1Designation" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UserName">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1UserName" runat="server" Text='<%# Eval("UserName")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditUserName" runat="server" Text='<%# Eval("UserName")%>'
                                        Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Password" runat="server" Text='<%# Eval("Password")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditPassword" runat="server" Text='<%# Eval("Password")%>'
                                        Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fathername">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Fathername" runat="server" Text='<%# Eval("Fathername")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditFathername" runat="server" Text='<%# Eval("Fathername")%>'
                                        Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1DOB" runat="server" Text='<%# Eval("DOB")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditDOB" runat="server" Text='<%# Eval("DOB")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Address" runat="server" Text='<%# Eval("Address")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditAddress" runat="server" Text='<%# Eval("Address")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Mobile" runat="server" Text='<%# Eval("MobileNo")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditMobile" runat="server" Text='<%# Eval("MobileNo")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1Email" runat="server" Text='<%# Eval("Email")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditEmail" runat="server" Text='<%# Eval("Email")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="BasicSalary">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1BasicSalary" runat="server" Text='<%# Eval("BasicSalary")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditBasicSalary" runat="server" Text='<%# Eval("BasicSalary")%>'
                                        Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DOJ">
                                <ItemTemplate>
                                    <asp:Label ID="lblGV1DOJ" runat="server" Text='<%# Eval("DOJ")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtGV1EditDOJ" runat="server" Text='<%# Eval("DOJ")%>' Style="text-transform: uppercase"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" ControlStyle-CssClass="btn btn-sm btn-primary" />
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-danger btn-sm" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
