<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CommWebApp.Forms.Registration" %>

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
        <div class="m-3">
            <img src="/images/trpr.png" width="96" height="54" alt="trpr-logo" />
        </div>

        <div class="container">
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <div class="row">
                <div class=" offset-4 col-sm-3">
                    <h4 class="mb-4">Create a new account</h4>

                    <hr class="mb-4" />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" ID="lblValidate" />

                    <asp:TextBox placeholder="First Name *" CssClass="form-control" runat="server" ID="FirstName" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                        CssClass="text-danger" ErrorMessage="The first name field is required." />

                    <asp:TextBox CssClass="form-control" placeholder="Last Name *" runat="server" ID="LastName" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                        CssClass="text-danger" ErrorMessage="The last name field is required." />

                    <asp:TextBox CssClass="form-control" placeholder="Phone Number" runat="server" ID="Phone" TextMode="Phone" /><br />

                    <asp:TextBox CssClass="form-control" placeholder="Email *" runat="server" ID="Email" TextMode="Email" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage="The email field is required." />

                    <asp:TextBox CssClass="form-control" placeholder="Password *" runat="server" ID="Password" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />

                    <asp:TextBox CssClass="form-control" placeholder="Confirm Password *" runat="server" ID="ConfirmPassword" TextMode="Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />

                    <asp:Button CssClass=" mt-4 btn btn-outline-primary" runat="server" OnClick="CreateUser_Click" Text="Register" />
                    <asp:Button CssClass=" mt-4 btn btn-outline-info float-right" runat="server" Text="Go Back" />

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
