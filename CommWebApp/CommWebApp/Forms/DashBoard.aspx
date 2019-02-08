<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<!--#include file="/includes/bootstrap.html"--></head>
<body>
    <form id="form1" runat="server">

        <%--START OF NAV BAR --%>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/Forms/DashBoard.aspx">
                <img src="/images/trpr.png" width="100" height="45" alt="trpr-logo" /></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="/Forms/DashBoard.aspx">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Incstructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Submistion</a></li>         
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class="container">
            <div class=" col-lg-5">
                <h2 class="mt-3">Search Criterias:</h2>
                <br />
                <table class="w-100 text-left">
                    <tr>
                        <td>Title:</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtTitleFilter" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Current Status:</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddlFilterStatus" runat="server">
                            </asp:DropDownList>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Date: From
                                <br />
                            <br />
                            To</td>
                        <td>
                            <input type="date" name="date" class="form-control" value="" />
                            <input type="date" name="date0" class="form-control mt-2" value="" /></td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button CssClass="btn btn-outline-info" ID="btnFilter" runat="server" Text="Apply" />
                <br />

            </div>

            <div>
                <br />
                <asp:GridView CssClass="table table-bordered table-sm" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TableDS">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="CurrentStatusId" HeaderText="Current Status" SortExpression="CurrentStatusId" />
                        <asp:CheckBoxField DataField="ReadyToPublish" HeaderText="Ready To Publish" SortExpression="ReadyToPublish" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:TemplateField HeaderText="Associate Editor 1">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DSRoles" DataTextField="Name" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Associate Editor 2 ">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="DSRoles" DataTextField="Name" DataValueField="Id">
                                    <asp:ListItem Selected="True" Value="0">Select</asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />
                </asp:GridView>
                <br />
                <br />
            </div>
            <asp:ObjectDataSource ID="TableDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TRPRLibrary.TRPR_databaseDataSetTableAdapters.PostTA"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="DSRoles" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TRPRLibrary.TRPR_databaseDataSetTableAdapters.TARoles" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_Id" Type="String" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Original_Id" Type="String" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
