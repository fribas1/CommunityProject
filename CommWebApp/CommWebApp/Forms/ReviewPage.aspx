<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="CommWebApp.Forms.ReviewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <style type="text/css">
        .auto-style1 {
            width: 400px;
            height: 100px;
        }

        .auto-style2 {
            width: 400px;
            height: 100px;
        }

        .right {
            float: right;
            margin: 300px;
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


        <div class="right mt-4 border border-dark rounded p-1">
            <img src="/images/article.jpg" alt="article picture" height="525" width="372" />
        </div>


        <div class=" container">
            <div class="row">
                <div class="">
                    <h2 class="mt-4">Review [File_Name]</h2>
                    <h3 class="mt-4">Recommendation</h3>
                    <div class="form-check col-lg-5">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">Accept
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">Reject
                        </label>
                    </div>
                    <hr class="mt-4" />
                    <h4 class="mt-4">Comments to the Author </h4>
                    <textarea id="TextArea1" class="auto-style1 form-control" name="S1"></textarea>
                                        <hr class="mt-4" />
                    <h4 class="mt-4">Confidential comments to the Author</h4>
                    <textarea id="TextArea2" class="auto-style2 mb-5 form-control" name="S2"></textarea>
                    <asp:Button Text="Submit" CssClass="btn btn-outline-success" runat="server" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
