<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleInstructions.aspx.cs" Inherits="CommWebApp.Submition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TRPR | Inst</title>
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
           background-image: url("/images/bginst.jpg");
            
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
   <!--Navbar -->
<nav class="mb-1 navbar navbar-default navbar-expand-lg ">
  <a class="navbar-brand" href="#">Therapeudic Recreation</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
    aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home
          <span class="sr-only">(current)</span>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Submission</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false" href="#">Review
        </a>
        <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto nav-flex-icons">
      <li class="nav-item">
        <a class="nav-link waves-effect waves-light">
          <i class="fab fa-twitter"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link waves-effect waves-light">
          <i class="fab fa-google-plus-g"></i>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true"
          aria-expanded="false">
          <i class="fas fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
          <a class="dropdown-item" href="#">Log Out</a>
        </div>
      </li>
    </ul>
  </div>
</nav>
<!--/.Navbar -->

    <form id="form1" runat="server">
                  
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
        <p class="lead"> Log in privileges to see all submissions and disseminate blinded
                        submissions to the associate editors.</p>
                </li>
              <h3>&#9658Associate Editors</h3>
               <li>
        <p class="lead">Online review process of each “blinded” submission from the
                        editor (after associate editors have <br /> finished with the review process the reviews
                        should go back to the editor to look over before<br /> going back to the submitters)</p>
                </li>
              <h3>&#9658Submission</h3>
              <li>
        <p class="lead">Log in- people can create and use the log in to submit their practice<br />
                        and research journals to the online review process</p>
                </li>
        </ul>
          <!--Review Process -->
          <h1>Review Process</h1>
          <h3>&#9658Editor</h3>
          <ul>
              <li>
        <p class="lead">Associate editors receive two blinded papers (Editor 1 and Editor 2)
                       <br /> ▪ Editor 1- responsible to give feedback on content and overall
                        organization of paper
                        <br />▪ Editor 2- responsible for overall grammar and spelling </p>
                </li>
              
               <li>
        <p class="lead">Feedback templates should be available online for associate editors to leave
                        comments in a<br /> “fill-in-the-blank” style (to email authors within the platform)</p>
                </li>
              <li>
        <p class="lead">“Overview page” for the Editor to track the progress of each paper being
            reviewed </p>
                </li>
        </ul>

      </div>

    </main><!-- /.container -->
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
