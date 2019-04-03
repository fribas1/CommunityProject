<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CommWebApp.Forms.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function ValidateCheckBoxList(sender, args) {
            var checkBoxList = document.getElementById("<%=cblExpertise.ClientID %>");
            var checkboxes = checkBoxList.getElementsByTagName("input");
            var isValid = false;
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    isValid = true;
                    break;
                }
            }
            args.IsValid = isValid;
        }
    </script>
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
        #cblExpertise label {
            margin-left:5px;
            margin-right:10px;
        }
        .btn-outline-info {
            border-color: mediumpurple;
            color: mediumpurple;
        }
        .btn-outline-info:hover {
            background-color: mediumpurple;
            color:white;
            border-color:mediumpurple;
        }
        .btn-outline-primary {
            border-color: purple;
            color: purple;
        }
        .btn-outline-primary:hover {
            background-color: purple;
            color:white;
            border-color:purple;
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
                <div class=" offset-md-3 col-md-6 col-lg-4 offset-lg-4">
                    <h4 class="mb-4 text-center">Create a new Account</h4>

                    <hr class="mb-4" />

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

                    <br />

                    <asp:Label CssClass="form-check-label" ID="lblExpertise" runat="server" Text="Expertise" AssociatedControlID="cblExpertise"></asp:Label>
                    <hr />
                    <asp:CheckBoxList CssClass="ml-3" ID="cblExpertise" runat="server" DataSourceID="dsExpertises" DataTextField="Name" DataValueField="Id" RepeatColumns="2"></asp:CheckBoxList>
                    <asp:CustomValidator runat="server" ClientValidationFunction="ValidateCheckBoxList"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="At least one expertise is required." />
                    <hr />

                    <asp:CheckBox CssClass="ml-3" runat="server" ID="chkConsider" />
                    <asp:Label CssClass="form-check-label" runat="server" AssociatedControlID="chkConsider">Check to be eligible as an Associate Editor</asp:Label>
                    <br />
                    <asp:Button CssClass="mt-3 btn btn-outline-primary float-left" runat="server" OnClick="CreateUser_Click" Text="Register" />
                    <asp:Button CssClass="mt-3 btn btn-outline-info float-right" runat="server" Text="Go Back" ID="btnBack" OnClick="btnBack_Click" />

                </div>
            </div>
        </div>

       
        <p>
            &nbsp;
        </p>
        <asp:SqlDataSource ID="dsExpertises" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Tag] ORDER BY [Name]"></asp:SqlDataSource>
    </form>
</body>
</html>
