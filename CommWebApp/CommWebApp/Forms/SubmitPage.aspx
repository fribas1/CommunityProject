<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitPage.aspx.cs" Inherits="CommWebApp.Forms.SubmitPage" %>

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
            background-size: cover;
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
            margin: 300px;
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
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Incstructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submistion</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class=" container">
            <div class="row">
        <div class="col-lg-6 container mt-4">
            <h2>Article Submission</h2>
                <div class="col-lg-6 mt-3">
                    <div class="input-group mt-2 mb-2">
                        <div class="input-group-prepend">
                            <asp:Button CssClass=" input-group-text" ID="btnUploadFile" Font-Bold="true" runat="server" Text="Upload" OnClick="btnUploadFile_Click" /><br />
                        </div>
                        <div class="custom-file">
                            <asp:FileUpload CssClass="custom-file-input" ID="FileUpload1" runat="server" />
                            <asp:Label CssClass="custom-file-label" ID="lblFilePath" Font-Bold="True" runat="server" Text="..." Visible="True"></asp:Label>
                        </div>
                    </div>
                    <asp:Label ID="lblMessage" runat="server" Text="" Visible="False"></asp:Label>
                    <br />
                </div>
                <h3 class="mt-3">Article Details</h3>
                <div class="ml-3 mt-3">
                    <asp:Label CssClass="" ID="lblTitle" runat="server" Text="Title:"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server" Height="30px" Width="180px"></asp:TextBox><br />
                    <asp:Label CssClass="" ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtFirst" runat="server" Height="30px" Width="180px"></asp:TextBox><br />
                    <asp:Label CssClass="" ID="lblLast" runat="server" Text="Last Name:"></asp:Label>
                    <asp:TextBox CssClass="form-control mb-3" ID="txtLast" runat="server" Height="30px" Width="180px"></asp:TextBox>
                    <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlCategory" runat="server" AppendDataBoundItems="True" Height="30px" Width="180px">
                        <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lblTags" runat="server" Text="Tags:"></asp:Label>
                    <asp:TextBox ID="txtTags" runat="server" CssClass="form-control" Height="80px" Width="180px"></asp:TextBox>
                    <br />
                    <div class="btn-group">
                        <asp:Button ID="btnSubmit" type="button" CssClass="btn btn-outline-success" runat="server" Text="Submit Article" Style="text-align: center" Height="50px" Width="180px" />
                    </div>
                </div>

                <br />

        </div>
                    <div class="mt-4 border border-dark rounded p-1 bg-white col-lg-6">
            <asp:Panel ID="pnlViewer" runat="server" Visible="False">
                <iframe src="/ViewerJS/#../Uploads/<%=fileName %>" width='389' height='550' allowfullscreen webkitallowfullscreen></iframe>
            </asp:Panel>
        </div>
                </div>
            </div>

        
            <div class="footer">
            <div id="button"></div>
            <div id="container">
                <div id="cont">
                    <div class="footer_center">
                        <h3>Footer Text Will Go Here When Available</h3>
                    </div>
                </div>
            </div>
        </div>
        <p>
            &nbsp;
        </p>

    </form>
</body>
</html>
