<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructionPage.aspx.cs" Inherits="CommWebApp.Forms.InstructionPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


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
                <label class="mr-4"><%: Context.User.Identity.GetUserName()  %></label>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class="container mt-3">
            <h1>Instructions</h1>
            <br />
            <br />
            <asp:Label ID="lblCurrentEdit" Text="" Visible="false" runat="server" />

            <asp:Panel Visible="true" ID="pnlMain" runat="server">
                <asp:Label CssClass="h2" ID="associateEditors" runat="server" Text="Associate Editors"></asp:Label>
                &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-primary mb-2" ID="editAssEditor" Text="Edit Instructions" runat="server" OnClick="editAssEditor_Click" />
                <br />
                <asp:TextBox Height="300px" Width="1000px" ID="txtAssEditorIns" runat="server" BorderStyle="None" ReadOnly="True" TextMode="MultiLine" Text="Associate editors receive two blinded papers (Editor 1 and Editor 2) Editor 1-responsible to give feedback on content and overall organization of paper Editor 2-responsible for overall grammar and spelling "></asp:TextBox>
                <br />
                <br />
                <asp:Label CssClass="h2" ID="authors" Text="Authors" runat="server" />
                &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-primary mb-2" ID="editAuthorIns" Text="Edit Instructions" runat="server" OnClick="editAuthorIns_Click" />
                <br />
                <asp:TextBox Height="300px" Width="1000px" ID="txtAuthIns" runat="server" BorderStyle="None" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
            </asp:Panel>


            <br />
            <asp:Panel Visible="false" ID="pnlEditAss" runat="server">
                <asp:TextBox ID="txtEditAssEditor"  CssClass="form-control" runat="server" Height="300px" Width="1000px" TextMode="MultiLine" />
                <br />
                <asp:Button CssClass="btn btn-primary" Text="Save" ID="btnSaveAss"  runat="server" OnClick="btnSaveAss_Click" />

            </asp:Panel>

            <asp:Panel Visible="false" ID="pnlEditAuthor" runat="server">
                            <asp:TextBox ID="txtEditAuthor"  CssClass="form-control" runat="server" Height="300px" Width="1000px" TextMode="MultiLine" />
            <br />
            <asp:Button CssClass="btn btn-primary" Text="Save" ID="btnSaveAuthor"  runat="server" OnClick="btnSaveAuthor_Click" />

            </asp:Panel>

        </div>








    </form>
</body>
</html>
