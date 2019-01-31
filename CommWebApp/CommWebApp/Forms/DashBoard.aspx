<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
            <div class="container">
                        <div class="row">

                <div class="col-lg-8">
                    <br />
                    <asp:GridView CssClass="table table-striped table-bordered table-responsive-lg" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="TableDS">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="CurrentStatusId" HeaderText="Current Status" SortExpression="CurrentStatusId" />
                            <asp:CheckBoxField DataField="ReadyToPublish" HeaderText="Ready To Publish" SortExpression="ReadyToPublish" />
                            <asp:BoundField DataField="CreatedOn" HeaderText="Created On" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </div>
                <div class="col-lg-4 text-center jumbotron mt-4">
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
                            <td>Date: From <br /><br />
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
                <asp:ObjectDataSource ID="TableDS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TRPRLibrary.TRPR_databaseDataSetTableAdapters.PostTA"></asp:ObjectDataSource>
            </div>
        </div>
    </form>
</body>
</html>
