<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitPage.aspx.cs" Inherits="CommWebApp.Forms.SubmitPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TRPR | Journal Submission</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function UploadFront(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUploadFront.ClientID %>").click();
            }
        }
    </script>
    <script type="text/javascript">
        function UploadFile(fileUpload) {
            if (fileUpload.value != '') {
                document.getElementById("<%=btnUploadFile.ClientID %>").click();
            }
        }
    </script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
    $( function() {
        $( "#tabs" ).tabs();
    } );
    </script>
    <style type="text/css">
        body {
            margin: auto;
            font-size: 16px;
            font-family: Arial;
            max-width: 100%;
            height: 100%;
            background-size: cover;
        }

        .checkbox label {
            margin-left: 5px;
            margin-right: 20px;
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
                    <li class="nav-item"><a class="nav-link" href="/Forms/InstructionPage.aspx">Instructions</a></li>
                    <li class="nav-item"><a class="nav-link" href="/Forms/SubmitPage.aspx">Submission</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <label class="mr-4">Hello <%: Context.User.Identity.GetUserName()  %></label>
                <asp:Button runat="server" ID="btnLogout" OnClick="btnLogout_Click" CssClass="btn btn-outline-danger my-2 my-sm-0" Text="Log Out"></asp:Button>
            </div>
        </nav>

        <%--END OF NAV BAR--%>

        <div class=" container">
            <div class="row">
                <div class="col-lg-6 container mt-4">
                    <h2>Journal Submission</h2>
                    <asp:Panel ID="pnlContent" runat="server">
                        <div class="col-lg-6 mt-3">
                            <h4>Front Page</h4>
                            <div class="input-group mt-2 mb-2">
                                <div class="input-group-prepend">
                                    <asp:Button CssClass=" input-group-text" ID="btnUploadFront" Font-Bold="true" runat="server" Text="Upload" OnClick="UploadFront" Style="display: none" /><br />
                                </div>
                                <div class="custom-file">
                                    <asp:FileUpload CssClass="custom-file-input" ID="FileUploadFront" runat="server" />
                                    <asp:Label CssClass="custom-file-label" ID="lblFrontName" runat="server" Text="No file selected" Visible="True"></asp:Label>
                                </div>
                            </div>
                            <asp:Label ID="lblMessageFront" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
                            <br />
                        </div>
                        <div class="col-lg-6 mt-3">
                            <h4>Article Content</h4>
                            <div class="input-group mt-2 mb-2">
                                <div class="input-group-prepend">
                                    <asp:Button CssClass=" input-group-text" ID="btnUploadFile" Font-Bold="true" runat="server" Text="Upload" OnClick="UploadFile" Style="display: none" /><br />
                                </div>
                                <div class="custom-file">
                                    <asp:FileUpload CssClass="custom-file-input" ID="FileUploadArticle" runat="server" />
                                    <asp:Label CssClass="custom-file-label" ID="lblFileName" runat="server" Text="No file selected" Visible="True"></asp:Label>
                                </div>
                            </div>
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
                            <br />
                        </div>
                        <h3 class="mt-3 mb-3">Author Details</h3>
                        <div class="col-lg-8">
                            <asp:Label Text="First Name" runat="server" />
                        <asp:TextBox  CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label Text="Last Name" runat="server" />
                        <asp:TextBox  CssClass="form-control" runat="server" />
                            <br />
                            <asp:Label Text="Co-Authors:" runat="server" />
                            <p>Please provide First name and Last name of any Co-Authors followed by comma sign (,)</p>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"  TextMode="MultiLine"></asp:TextBox><br />
                            </div>
                        <h3 class="mt-3">Article Details</h3>
                        <div class=" mt-3  col-lg-8">
                            <asp:Label ID="lblTitle" runat="server" Text="Title:" AssociatedControlID="txtTitle"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server" Height="30px"  AssociatedControlID="txtTitle"></asp:TextBox>
                            <asp:Label ID="lblTitleValid" runat="server" CssClass="text-danger" Visible="False"></asp:Label><br />

                            <asp:Label ID="lblContent" runat="server" Text="Content:" AssociatedControlID="txtContent"></asp:Label>
                            <asp:TextBox ID="txtContent" CssClass="form-control" runat="server"  TextMode="MultiLine"></asp:TextBox><br />

                            <asp:Label ID="lblTags" runat="server" Text="Tags:" AssociatedControlID="cblTags"></asp:Label>
                            <asp:CheckBoxList CssClass="checkbox mt-2" ID="cblTags" runat="server" DataSourceID="dsTags" DataTextField="Name" DataValueField="Id" RepeatColumns="2"></asp:CheckBoxList>
                            <asp:Label ID="lblError" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
                            <br />

                            <div class="btn-group">
                                <asp:Button ID="btnSubmit" type="button" CssClass="btn btn-outline-success" runat="server" Text="Submit Article" Style="text-align: center" Height="50px" Width="180px" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                        <br />
                    </asp:Panel>
                    <asp:Panel ID="pnlSuccess" runat="server" Visible="False">
                        <h3>Your article has been successfully created.</h3>
                        <asp:LinkButton ID="btnBack" runat="server" Text="Click here to return" OnClick="btnBack_Click" />
                    </asp:Panel>
                </div>
                <div id="tabs" class="mt-5 col-lg-6 border-0">
                    <ul>
                        <li><a href="#tabs-1">Front Page</a></li>
                        <li><a href="#tabs-2">Article Content</a></li>
                    </ul>
                    <div id="tabs-1">
                        <iframe src="/ViewerJS/#../Uploads/<%=hdFrontName.Value %>" width='525' height='680' allowfullscreen webkitallowfullscreen></iframe>
                    </div>
                    <div id="tabs-2">
                        <iframe src="/ViewerJS/#../Uploads/<%=hdFileName.Value %>" width='525' height='680' allowfullscreen webkitallowfullscreen></iframe>
                    </div>
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

        <asp:SqlDataSource ID="dsTags" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Tag] ORDER BY [Name]"></asp:SqlDataSource>
        <asp:HiddenField ID="hdFileName" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hdFrontName" runat="server" />
        <asp:HiddenField ID="hdFilePath" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hdFileExtension" runat="server"></asp:HiddenField>
        <asp:HiddenField ID="hdFileSize" runat="server"></asp:HiddenField>
    </form>
</body>
</html>
