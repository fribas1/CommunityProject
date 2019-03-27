<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="CommWebApp.Forms.Comments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--#include file="/includes/bootstrap.html"-->
    <style type="text/css">
        body {
            margin: auto;
            font-size: 16px;
            font-family: Arial;
            max-width: 100%;
            height: 100%;
        }


        .center {
            margin: 0 auto;
            width: 30%;
            padding: 70px 0;
            text-align: center;
            position: center;
        }

        .txtbox {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            width: 150px;
            border: 1.3px solid #848484;
            border-color: deepskyblue;
        }

        .footer #button {
            width: 35px;
            height: 35px;
            border: #727172 12px solid;
            border-radius: 35px;
            margin: 0 auto;
            position: relative;
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            -ms-transition: all 1s ease;
            transition: all 1s ease;
        }

            .footer #button:hover {
                width: 35px;
                height: 35px;
                border: #3A3A3A 12px solid;
                -webkit-transition: all 1s ease;
                -moz-transition: all 1s ease;
                -o-transition: all 1s ease;
                -ms-transition: all 1s ease;
                transition: all 1s ease;
                position: relative;
            }

        .footer {
            bottom: 0;
            left: 0;
            position: fixed;
            width: 100%;
            height: 2em;
            overflow: hidden;
            margin: 0 auto;
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            -ms-transition: all 1s ease;
            transition: all 1s ease;
            z-index: 999;
        }

            .footer:hover {
                -webkit-transition: all 1s ease;
                -moz-transition: all 1s ease;
                -o-transition: all 1s ease;
                -ms-transition: all 1s ease;
                transition: all 1s ease;
                height: 10em;
            }

            .footer #container {
                margin-top: 5px;
                width: 100%;
                height: 100%;
                position: relative;
                top: 0;
                left: 0;
                background: #3A3A3A;
            }

            .footer #cont {
                position: relative;
                top: -45px;
                right: 190px;
                width: 150px;
                height: auto;
                margin: 0 auto;
            }

        .footer_center {
            width: 500px;
            float: left;
            text-align: center;
        }

        .footer h3 {
            font-family: 'Helvetica';
            font-size: 30px;
            font-weight: 100;
            margin-top: 70px;
            margin-left: 40px;
        }

        .right {
            float: right;
            padding-right: 500px;
        }
        /* navbar */
        .navbar-default {
            background-color: #F8F8F8;
            border-color: #E7E7E7;
        }
            /* Title */
            .navbar-default .navbar-brand {
                color: #0099D7;
            }

                .navbar-default .navbar-brand:hover,
                .navbar-default .navbar-brand:focus {
                    color: #5E5E5E;
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
                <label class="mr-4">Hello <%: Context.User.Identity.GetUserName()  %></label>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class="container mt-3">
            <h3>Comments for Article #<%=Request.QueryString["post"] %></h3>
            <br />
            <br />
            <asp:GridView ID="gvComments" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsComments">
                <Columns>
                    <asp:BoundField DataField="Content" HeaderText="Comment" SortExpression="Content" />
                </Columns>
                <EmptyDataTemplate>
                    There is no comment for this post yet.
                </EmptyDataTemplate>
            </asp:GridView>

        </div>
        <asp:SqlDataSource ID="dsComments" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Comment] WHERE ([PostId] = @PostId)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="PostId" QueryStringField="post" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
