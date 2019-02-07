<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Submission.aspx.cs" Inherits="CommWebApp.Submition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TRPR | Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.js"></script>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script src="Scripts/popper.js"></script>
    <style type="text/css">
        body {
            margin: auto;
            font-size: 16px;
            font-family: Arial;
            max-width: 100%;
            height: 100%;
            background-size: cover;
           background-image: url("/images/submitbg.jpg");
            
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
        .footer #button{
	width:35px;
	height:35px;
	border: #727172 12px solid;
	border-radius:35px;
	margin:0 auto;
	position:relative;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
}
.footer #button:hover{
	width:35px;
	height:35px;
	border: #3A3A3A 12px solid;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	position:relative;
}
.footer {
	bottom:0;
	left:0;
	position:fixed;
    width: 100%;
    height: 2em;
    overflow:hidden;
    margin:0 auto;
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	z-index:999;
}
.footer:hover {
	-webkit-transition: all 1s ease;
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -ms-transition: all 1s ease;
    transition: all 1s ease;
	height: 10em;
}
.footer #container{
	margin-top:5px;
	width:100%;
height:100%;
  position:relative;
  top:0;
  left:0;
	background: #3A3A3A;
}
.footer #cont{
  position:relative;
  top:-45px;
  right:190px;
	width:150px;
	height:auto;
	margin:0 auto;
}
.footer_center{
	width:500px;
	float:left;
  text-align:center;
}
.footer h3{
	font-family: 'Helvetica';
	font-size: 30px;
	font-weight: 100;
	margin-top:70px;
	margin-left:40px;
}
.right{
    float:right;
    padding-right:500px;
   
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <div class="container mt-4">
            <div class="row">
                <div class="col-lg-4">
                    <h2>Therapeutic Recreation</h2>
                </div>
            </div>
        </div>
        
        <div class="container mt-3">
            <h2>Article Submission</h2>
            <div class="btn-group">
                                <asp:Button ID="btnBrowse" type="button" CssClass="btn btn-info" runat="server" Text="browse..." style="text-align: center" Height="30px" Width="100px" /> 
                            </div>
        </div>
                    <div class="right">                                                 
                    <asp:Image ID="Image1" runat="server" Height="684px" Width="533px" BorderColor="#0099FF" BorderStyle="Ridge" BorderWidth="2px" />
                    </div>
       <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <asp:Panel ID="panelFilters" runat="server">
                            <br />
                            <h3>Article Details</h3>

                            <asp:Label CssClass="" ID="lblFirst" runat="server" Text="First Name:"></asp:Label>
                            <asp:TextBox CssClass="form-control" ID="txtFirst" runat="server" Height="30px" Width="180px"></asp:TextBox><br />
                            <asp:Label CssClass="" ID="lblLast" runat="server" Text="Last Name:"></asp:Label>
                            <asp:TextBox CssClass="form-control mb-3" ID="txtLast" runat="server" Height="30px" Width="180px"></asp:TextBox>
                            <asp:Label ID="lblCategory" runat="server" Text="Category:"></asp:Label>
                            <asp:DropDownList CssClass="form-control" ID="ddlCategory" runat="server" AppendDataBoundItems="True" Height="30px" Width="180px">
                                <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <div class="btn-group">
                                <asp:Button ID="btnSubmit" type="button" CssClass="btn btn-info" runat="server" Text="Submit Article for Review" style="text-align: center" Height="50px" Width="220px" /> 
                            </div>
                    </div>
                    </asp:Panel>
            <br />
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
            &nbsp;</p>
    </form>

     </body>
</html>
