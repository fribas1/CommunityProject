<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="CommWebApp.Forms.ReviewPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/mdb.min.css" rel="stylesheet" />

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
                <div class="col-lg-6">
                    <h2 class="mt-4">Review [Encrupted_Name]</h2>
                    <br />
                    <br />
                    <h5>Would you be willing to review a revision of this manuscript?</h5>
                    <div class="form-check col-lg-10 ml-2 mt-2">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">Yes
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="recommendation">No
                        </label>
                    </div>


                    <hr />
                    <h6>Organization, structure and presentation (style, clarity and readability)</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Organization">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Organization">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Organization">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Organization">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>A rationale for the study which includes a clear purpose statement and/or research questions addressed in the paper and a brief review of related literature including key citations.</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="rationale">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="rationale">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="rationale">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="rationale">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>A methodology section which includes sample size, a description of the how the sample was selected and recruited, a description of the how the sample was selected and recruited, a description of the methodology, data collection strategies used and a description of the data analysis procedures.</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="methodology">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="methodology">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="methodology">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="methodology">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>Findings which highlight the key findings of the study making sure to address the study purpose and all research questions and including any tables, graphs and figures that help summarize the findings.</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Findings">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Findings">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Findings">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Findings">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>A Discussion of implications for TR proactive which describes the contribution the study makes to therapeutic recreation proactive and provides specific recommendations for practice.</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Discussion">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Discussion">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Discussion">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="Discussion">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>Does it have an abstract that is approx. 250 words and also includes 5-6 keywords that best describe content of the article?</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="abstract">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="abstract">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="abstract">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="abstract">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>Is the length of manuscript a maximum number of 15 pages includeing references?</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="manuscript">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="manuscript">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="manuscript">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="manuscript">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>Is it formatted properly? Type manuscripts in <i>Microsoft Word</i>, Times New Roman (font size of 12), double-spaced, with 10-inch margins on all four sides. Tables must be original (created in your WORD document, or able to be edited in WORKD), figures must be of high quality (i.e. jpg file with high dpi).</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="formatted">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="formatted">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="formatted">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="formatted">Missing
                        </label>
                    </div>
                    <hr />
                    <h6>Do the citations and referencing follow the guidelines laid out in the Publication Manual of the American Psychological Association, 6th edition guidelines for the text, labelling tables and figures, citations and references?</h6>
                    <div class="form-check col-lg-10 ml-2 mt-3">
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="citations">Great
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="citations">Minor Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="citations">Major Revision
                        </label>
                        <br />
                        <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="citations">Missing
                        </label>
                    </div>


                    <hr />
                    <h6>Recommendation</h6>
                    <div class="form-check col-lg-10 ml-2 mt-2">
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
                    <hr />
                    <h3>Confidential comments to the Editor</h3>
                    <br />
                    <textarea id="TextArea1" class="auto-style1 form-control" name="S1"></textarea><br />
                    <br />
                    <hr />
                    <h3>Comments to the Author</h3>
                    <br />
                    <textarea id="TextArea2" class="auto-style2 form-control" name="S2"></textarea>
                    <br />
                    <asp:Button CssClass="btn btn-outline-success mt-4 mb-4" Width="80" Text="Submit" runat="server" />
                    <asp:Button CssClass="btn btn-outline-info m-4" Width="80" Text="Save" runat="server" />
                </div>
                <div class=" col-lg-6 float-right rounded p-1">
                    <img src="/images/article.jpg" alt="article picture" height="525" width="372" />
                </div>


            </div>
        </div>
    </form>
</body>
</html>
