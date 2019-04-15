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
    <link href="/includes/gridview.css" rel="stylesheet" />
    <link href="/includes/gridviewstyle.css" rel="stylesheet" />
    <style type="text/css">
        .right {
            float: right;
            margin-right: 190px;
            margin-top: 40px;
        }

        .auto-style2 {
            height: 26px;
            width: 22px;
        }
        .auto-style4 {
            height: 27px;
        }
        .auto-style5 {
            height: 76px;
        }
        .auto-style6 {
            left: 0px;
            top: 0px;
        }
        .auto-style7 {
            height: 27px;
            width: 1159px;
        }
        .auto-style8 {
            width: 1159px;
        }
        .auto-style10 {
            height: 26px;
            width: 285px;
        }
        .auto-style12 {
            width: 22px;
        }
        .auto-style14 {
            width: 285px;
        }
        #btnFilter {
            border-color: darkred;
            color: purple;
        }

            #btnFilter:hover {
                background-color: lightcoral;
                color: white;
            }
          .btn-outline-info {
            border-color:blue;
            color: crimson;
        }
        .btn-outline-info:hover {
            background-color: #f36666;
            color:white;
            border-color:blue;
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
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Instructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submission</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <label class="mr-4"><%: Context.User.Identity.GetUserName()  %></label>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>
        <div class="container">

            <div class="col-lg-4 float-right mt-5">
                <div class="cardright border border-secondary rounded p-2" style="margin-top:55px">
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
            <div class="col-lg-8"> <%--CHANGED HERE FORM COL-1 TO COL-LG-8--%>
            <div class="auto-style6">
                <h2 class="mt-3">Search Criterias:</h2>
                <br />
                <asp:Panel ID="panelSearchEditor" runat="server">
                    <table class="w-100 text-left">
                        <tr>
                            <td class="auto-style4">Title:</td>
                            <td class="auto-style4">
                                <asp:TextBox CssClass="form-control" ID="txtTitleFilter" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Current Status:</td>
                            <td class="auto-style4">
                                <asp:DropDownList CssClass="form-control" ID="ddlFilterStatus" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="dsStatusDDL" DataTextField="Name" DataValueField="Id">
                                    <asp:ListItem Value="2">Select..</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td>Date between:<br />
                                <br />
                                and</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="txtDateStart" runat="server" TextMode="Date"></asp:TextBox>
                                &nbsp;<asp:TextBox CssClass="form-control" ID="txtDateEnd" runat="server" TextMode="Date"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelSearchAuthor" runat="server">
                    My Journal Posts - Search<br />
                    <table class="w-100 text-left">
                        <tr>
                            <td class="auto-style4">Title:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtTitleAuthor" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td>Current Status:</td>
                            <td>
                                <asp:DropDownList ID="ddlStatusAuthor" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="form-control" DataSourceID="dsStatusDDL" DataTextField="Name" DataValueField="Id">
                                    <asp:ListItem Value="0">Select..</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Date between:<br />
                                <br />
                                and</td>
                            <td class="auto-style5">
                                <asp:TextBox ID="txtDateStartAuthor" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtDateEndAuthor" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </td>
                            <td class="auto-style5"></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="panelSearchAssociate" runat="server">
                    Articles to be reviewed - Search<br />
                    <table class="w-100 text-left">
                        <tr>
                            <td class="auto-style7">Title:</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtTitleAssociate" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td class="auto-style4"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">Date between:<br />
                                <br />
                                and</td>
                            <td>
                                <asp:TextBox ID="txtDateStartAssociate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                &nbsp;<asp:TextBox ID="txtDateEndAssociate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <asp:Button CssClass="btn btn-outline-info" style="margin-left:300px" ID="btnFilter" runat="server" Text="Apply" Width="160px" />
                <br />
                </div>
            </div>

            <div>
                <br />
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
                <br />
                <asp:GridView CssClass="table table-bordered table-sm" ID="DashBoardGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="postDS" OnSelectedIndexChanged="DashBoardGV_SelectedIndexChanged">
                <FooterStyle CssClass="GridViewFooterStyle" />
                <RowStyle CssClass="GridViewRowStyle" />    
                <PagerStyle CssClass="GridViewPagerStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />    
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="Current Status" HeaderText="Status" SortExpression="Current Status" />
                        <asp:BoundField DataField="CreatedOn" HeaderText="Date" SortExpression="CreatedOn" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                        <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" Visible="False" />
                        <asp:BoundField DataField="PostId" HeaderText="PostId" SortExpression="PostId" Visible="False" />
                        <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Details" ControlStyle-CssClass="btn btn-outline-info">
                            <ControlStyle CssClass="btn btn-outline-info" ></ControlStyle>
                        </asp:ButtonField>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        There are no records that fit your search query, try changing Search Criterias
                    </EmptyDataTemplate>
                    <HeaderStyle CssClass=" thead-light" />

                </asp:GridView>
                <br />

                <%--PANEL ASSIGNING--%>
                <asp:Panel ID="panelAssociate" Visible="false" runat="server" Width="602px">
                    <table class="w-100">
                        <tr>
                            <td class="auto-style10">
                                <asp:Label ID="lblddlUP1" runat="server" Text="Associate Editor 1"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style10">
                                <asp:Label ID="lblddlUP2" runat="server" Text="Associate Editor 2"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:DropDownList CssClass="form-control" ID="ddlAssEdit1" runat="server" AppendDataBoundItems="True" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">
                                <asp:DropDownList ID="ddlAssEdit2" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataSourceID="allUsersDS" DataTextField="Users" DataValueField="Id">
                                    <asp:ListItem Value="-1">Select one..</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="lblAss1Name" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">
                                <asp:Label ID="lblAss2Name" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label CssClass="m-3" ID="lblAss1toEditor" runat="server" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">
                                <asp:Label CssClass="m-3" ID="lblAss2toEditor" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="lblass1toAuthor" runat="server" CssClass="m-3" Visible="False"></asp:Label>
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">
                                <asp:Label ID="lblass2toAuthor" runat="server" CssClass="m-3" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                &nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-outline-success" style="margin-bottom:400px" OnClick="btnSave_Click" Text="Save" />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnGoBack" runat="server" CssClass="btn btn-outline-primary" style="margin-bottom:400px" Text="Go Back" />
                            </td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                <%--END PANEL ASSIGNING--%>

                <br />
                <asp:Panel ID="panelReview" runat="server">
                    <h2 class="mt-3">Articles to be reviewed</h2>
                    <asp:GridView ID="gvReview" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-sm" DataKeyNames="Id" DataSourceID="dsReviews" OnSelectedIndexChanged="gvReview_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="Name" HeaderText="Status" SortExpression="Name" />
                            <asp:BoundField DataField="CreatedOn" DataFormatString="{0:d}" HeaderText="Created On" SortExpression="CreatedOn" />
                            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Review" />
                        </Columns>
                        <EmptyDataTemplate>
                            You do not have any Revision assigned to you yet.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </asp:Panel>
                <br />
            </div>
            <div>
                <br />
                <br />
                <asp:Panel ID="panelArticles" runat="server">
                    <h2 class="mt-3">My Journal Posts</h2>
                    <asp:GridView ID="gvArticles" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-sm" DataKeyNames="Id" DataSourceID="dsArticlesAuthor">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                            <asp:BoundField DataField="Name" HeaderText="Status" SortExpression="Name" />
                            <asp:BoundField DataField="CreatedOn" DataFormatString="{0:d}" HeaderText="Created On" SortExpression="CreatedOn" />
                            <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" />
                            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Comments.aspx?post={0}" Text="View Comments" />
                        </Columns>
                        <EmptyDataTemplate>
                            You do not have any submitted articles yet.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </asp:Panel>
            </div>
            <div>
            </div>
            <asp:SqlDataSource ID="postDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, AspNetUserRoles.UserId, AspNetUserRoles.RoleId, AspNetUserRoles.PostId, Post.PublishedOn, Status.Name AS [Current Status] FROM Post INNER JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId INNER JOIN Status ON Post.CurrentStatusId = Status.Id WHERE (Post.CurrentStatusId = @status) AND (Post.Title LIKE '%' + @title + '%') AND (Post.CreatedOn BETWEEN @start AND @end )">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlFilterStatus" DefaultValue="2" Name="status" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtTitleFilter" ConvertEmptyStringToNull="False" DefaultValue="" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateStart" DefaultValue="01/01/0001" Name="start" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateEnd" DefaultValue="12/30/3000" Name="end" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="allUsersDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT { fn CONCAT(AspNetUsers.FirstName + ' ', AspNetUsers.LastName) } AS Users, AspNetUsers.Id, AspNetRoles.Id AS RolesID FROM AspNetUsers INNER JOIN AspNetUserRoles ON AspNetUsers.Id = AspNetUserRoles.UserId INNER JOIN AspNetRoles ON AspNetUserRoles.RoleId = AspNetRoles.Id WHERE (AspNetRoles.Id = N'2')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="addAssociateDS" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" InsertCommand="INSERT INTO AspNetUserRoles(UserId, RoleId, PostId) VALUES (@selectUser, N'2', @post)" SelectCommand="SELECT AspNetUserRoles.* FROM AspNetUserRoles">
                <InsertParameters>
                    <asp:Parameter Name="selectUser" />
                    <asp:Parameter Name="post" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsStatusDDL" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, Name FROM Status"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsReviews" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, Post.PublishedOn, Post.[Content], Post.Keywords, AspNetUserRoles.Id AS Expr1, AspNetUserRoles.UserId, AspNetUserRoles.RoleId, AspNetUserRoles.PostId, Status.Id AS Expr2, Status.Name, Status.Description FROM Post INNER JOIN AspNetUserRoles ON Post.Id = AspNetUserRoles.PostId INNER JOIN Status ON Status.Id = Post.CurrentStatusId WHERE (AspNetUserRoles.RoleId = 2) AND (Post.CurrentStatusId = 3) AND (AspNetUserRoles.UserId = @User ) AND (Post.Title LIKE '%' + @title + '%') AND (Post.CreatedOn BETWEEN @start AND @end )">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="User" QueryStringField="currentUserId" />
                    <asp:ControlParameter ControlID="txtTitleAssociate" ConvertEmptyStringToNull="False" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateStartAssociate" DefaultValue="01/01/0001" Name="start" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateEndAssociate" DefaultValue="12/30/3000" Name="end" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsArticlesAuthor" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Post.Id, Post.Title, Post.CurrentStatusId, Post.CreatedOn, Post.CreatedBy, Post.LastModifiedOn, Post.LastModifiedBy, Post.PublishedOn, Post.[Content], Post.Keywords, Status.Id AS Expr1, Status.Name, Status.Description FROM Post INNER JOIN Status ON Status.Id = Post.CurrentStatusId WHERE (Post.CreatedBy = @CreatedBy) AND (Post.CurrentStatusId = @status OR @status = 0) AND (Post.Title LIKE '%' + @title + '%') AND (Post.CreatedOn BETWEEN @start AND @end )">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="CreatedBy" QueryStringField="currentUserId" Type="String" />
                    <asp:ControlParameter ControlID="ddlStatusAuthor" Name="status" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtTitleAuthor" ConvertEmptyStringToNull="False" Name="title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateStartAuthor" DefaultValue="01/01/0001" Name="start" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtDateEndAuthor" DefaultValue="12/30/3000" Name="end" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblhiddenPostID" runat="server"></asp:Label>
            <br />
            <asp:SqlDataSource ID="DSComment" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT Id, [Content], RecommendationId, PostId, CommentedBy, ConfidentialToEditor, FileId FROM Comment WHERE (PostId = @PostId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblhiddenPostID" DefaultValue="0" Name="PostId" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:SqlDataSource ID="DSasses12" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT AspNetUserRoles.Id AS Expr1, AspNetUserRoles.UserId AS Expr2, AspNetUserRoles.RoleId AS Expr3, AspNetUserRoles.PostId AS Expr4, { fn CONCAT(AspNetUsers.FirstName + ' ', AspNetUsers.LastName) } AS Users FROM AspNetUserRoles INNER JOIN AspNetUsers ON AspNetUserRoles.UserId = AspNetUsers.Id WHERE (AspNetUserRoles.PostId = @Param1) AND (AspNetUserRoles.RoleId = '2')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblhiddenPostID" DefaultValue="0" Name="Param1" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
