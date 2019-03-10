<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="CommWebApp.Forms.DashBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--#include file="/includes/bootstrap.html"-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style type="text/css">
        .right {
            float: right;
            margin-right: 190px;
            margin-top: 40px;
        }

        .auto-style1 {
            height: 26px;
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
        <div class="container">

            <div class="col-lg-4 float-right">
                <div class="cardright border border-secondary rounded p-1">
                    <article class="card-group-item">
<%--                        <header class="card-header">
                            <h6 class="title">Useful Information </h6>
                        </header>--%>
                        <div class="filter-content">
                            <div class="list-group list-group-flush">
                                <a href="#" class="list-group-item">New submissions<span class="float-right badge badge-light round">142</span> </a>
                                <a href="#" class="list-group-item">Articles in review<span class="float-right badge badge-light round">3</span>  </a>
                                <a href="#" class="list-group-item">Proof pages complete<span class="float-right badge badge-light round">32</span>  </a>
                                <a href="#" class="list-group-item">Ready for final publication <span class="float-right badge badge-light round">12</span>  </a>
                            </div>
                            <!-- list-group .// -->
                        </div>
                    </article>
                    <!-- card-group-item.// -->
                </div>
            </div>

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
                                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" ></asp:Label>
                <asp:GridView CssClass="table table-bordered table-sm text-center" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="postDS" OnSelectedIndexChanged="DashBoardGV_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Current Status" HeaderText="Current Status" SortExpression="Current Status" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="CreatedOn" SortExpression="CreatedOn" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                        <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                        <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" value="Associate" onclick="DashBoardGV_SelectedIndexChanged">
                                    Associates</button>
                            </ItemTemplate>
                            <ControlStyle CssClass="btn" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle CssClass=" thead-light" />
                </asp:GridView>
                <br />


                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Heading</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <asp:Panel ID="panelAssociate" runat="server" Width="464px">
                                    <table class="w-100">
                                        <tr>
                                            <td class="auto-style1">Associate Editor 1</td>
                                            <td class="auto-style1">Associate Editor 2</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddlAssEdit1" runat="server" AppendDataBoundItems="True" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlAssEdit2" runat="server" AppendDataBoundItems="True" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>


                <br />
                <br />
            </div>
            <asp:SqlDataSource ID="postDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, AspNetUserRoles.UserId, AspNetUserRoles.RoleId, AspNetUserRoles.PostId, Post.PublishedOn, Status.Name AS [Current Status] FROM Post INNER JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId INNER JOIN Status ON Post.CurrentStatusId = Status.Id WHERE (Post.CurrentStatusId = 2)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="allUsersDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT { fn CONCAT(AspNetUsers.FirstName + ' ', AspNetUsers.LastName) } AS Users, AspNetUsers.Id, AspNetRoles.Id AS RolesID FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id WHERE (AspNetRoles.Id = N'2')"></asp:SqlDataSource>
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
