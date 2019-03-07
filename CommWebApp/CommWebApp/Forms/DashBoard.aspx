<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--#include file="/includes/bootstrap.html"-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style type="text/css">
        .right {
            float: right;
            margin-right: 190px;
            margin-top: 40px;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">

        <%--START OF NAV BAR --%>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/Forms/DashBoard.aspx">
                <img src="/images/trpr.png" width="96" height="54" alt="trpr-logo" /></a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link" href="/Forms/DashBoard.aspx">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Incstructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submistion</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class="col-lg-3 right">
        <div class="cardright border border-secondary rounded p-1">
            <article class="card-group-item">
                <header class="card-header">
                    <h6 class="title">Usefull Information </h6>
                </header>
                <div class="filter-content">
                    <div class="list-group list-group-flush">
                        <a href="#" class="list-group-item">Articles to Review <span class="float-right badge badge-light round">142</span> </a>
                        <a href="#" class="list-group-item">New Articles<span class="float-right badge badge-light round">3</span>  </a>
                        <a href="#" class="list-group-item">Some Info <span class="float-right badge badge-light round">32</span>  </a>
                        <a href="#" class="list-group-item">Ready to Submit <span class="float-right badge badge-light round">12</span>  </a>
                    </div>
                    <!-- list-group .// -->
                </div>
            </article>
            <!-- card-group-item.// -->
        </div>
            </div>

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
                <asp:Button CssClass="btn" ID="btnA" runat="server" Text="Associate" OnClick="btnA_Click" />
                <asp:Button CssClass="btn" ID="btnR" runat="server" Text="Review " OnClick="btnR_Click" Visible="False" />
                <br />

            </div>

            <div>
                <br />
                <asp:GridView CssClass="table table-bordered table-sm" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="postDS" OnSelectedIndexChanged="DashBoardGV_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Current Status" HeaderText="Current Status" SortExpression="Current Status" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                        <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                        <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Associate" />
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />
                </asp:GridView>
                <asp:GridView CssClass="table table-bordered table-sm" ID="AssociateGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Associate Editor 1">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlAssEdit1" runat="server" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Associate Editor 2">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlAssEdit2" runat="server" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />

                </asp:GridView>
                <asp:TextBox ID="txtTest" runat="server"></asp:TextBox>
                <br />
            </div>
            <asp:SqlDataSource ID="postDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, AspNetUserRoles.UserId, AspNetUserRoles.RoleId, AspNetUserRoles.PostId, AspNetUsers.FirstName, AspNetUsers.LastName, AspNetUsers.UserName, Post.PublishedOn, Status.Name AS [Current Status] FROM Post INNER JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId INNER JOIN AspNetUsers ON AspNetUserRoles.UserId = AspNetUsers.Id INNER JOIN Status ON Post.CurrentStatusId = Status.Id WHERE (AspNetUserRoles.UserId = { fn IFNULL( @user , AspNetUserRoles.UserId) })">
                <SelectParameters>
                    <asp:QueryStringParameter Name="user" QueryStringField="currentUserId" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="allUsersDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT { fn CONCAT(FirstName + ' ', LastName) } AS Users, Id FROM AspNetUsers"></asp:SqlDataSource>
            <asp:SqlDataSource ID="addAssociateDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO AspNetUserRoles(UserId, RoleId, PostId) VALUES (@selectUser, N'2', @post)" SelectCommand="SELECT AspNetUserRoles.* FROM AspNetUserRoles">
                <InsertParameters>
                    <asp:Parameter Name="selectUser" />
                    <asp:Parameter Name="post" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
