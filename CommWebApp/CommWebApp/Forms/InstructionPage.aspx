<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructionPage.aspx.cs" Inherits="CommWebApp.Forms.InstructionPage" %>

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
            <h1>Role Instructions</h1>
            <br />
            <br />

        </div>
        <div class="right">
        </div>
        <main role="main" class="container">
            <div class="starter-template">

                <h1>Login Pages</h1>
                <h3>&#9658Editor</h3>
                <ul>
                    <li>
                        <p class="lead">
                            Log in privileges to see all submissions and disseminate blinded
                        submissions to the associate editors.
                        </p>
                    </li>
                    <h3>&#9658Associate Editors</h3>
                    <li>
                        <p class="lead">
                            Online review process of each “blinded” submission from the
                        editor (after associate editors have
                            <br />
                            finished with the review process the reviews
                        should go back to the editor to look over before<br />
                            going back to the submitters)
                        </p>
                    </li>
                    <h3>&#9658Submission</h3>
                    <li>
                        <p class="lead">
                            Log in- people can create and use the log in to submit their practice<br />
                            and research journals to the online review process
                        </p>
                    </li>
                </ul>
                <!--Review Process -->
                <h1>Review Process</h1>
                <h3>&#9658Editor</h3>
                <ul>
                    <li>
                        <p class="lead">
                            Associate editors receive two blinded papers (Editor 1 and Editor 2)
                       <br />
                            ▪ Editor 1- responsible to give feedback on content and overall
                        organization of paper
                        <br />
                            ▪ Editor 2- responsible for overall grammar and spelling
                        </p>
                    </li>

                    <li>
                        <p class="lead">
                            Feedback templates should be available online for associate editors to leave
                        comments in a<br />
                            “fill-in-the-blank” style (to email authors within the platform)
                        </p>
                    </li>
                    <li>
                        <p class="lead">
                            “Overview page” for the Editor to track the progress of each paper being
            reviewed
                        </p>
                    </li>
                </ul>

            </div>

        </main><!-- /.container -->
        </asp:Panel>
            <br />
        </div>
           
        </div>
         
    
        <p>
            &nbsp;
        </p>


    </form>
</body>
</html>
