<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewPage.aspx.cs" Inherits="CommWebApp.Forms.ReviewPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style type="text/css">
        .right {
            float: right;
            margin: 300px;
        }

        .rad1 label {
            margin-left: 5px;
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
                    <br />
                    <asp:Label ID="encName" runat="server" CssClass="h2" Text="Review "></asp:Label>
                    <br />
                    <br />

                    <asp:Panel ID="pnlQuestions" runat="server">
                        <h5>Would you be willing to review a revision of this manuscript?</h5>
                        <div class="form-check col-lg-10 ml-2 mt-2">

                            <asp:RadioButton ID="revisionR1" CssClass="rad1" GroupName="revisionR" runat="server" Text="Yes" />
                            <br />
                            <asp:RadioButton ID="revisionR2" CssClass="rad1" GroupName="revisionR" runat="server" Text="No" />

                            <br />
                            <asp:Label ID="notValid1" runat="server" ForeColor="Red" Visible="False" Text="You can not leave this section with no comment"></asp:Label>
                        </div>

                        <h5 class="mt-4">Marking Rubric</h5>
                        <hr />
                        <%--START ACCORDION--%>

                        <div class="ml-3 mr-3" id="accordion">

                            <div class="card">
                                <div class="card-header">
                                    <a class="card-link" data-toggle="collapse" href="#collapse1">Organization
                                    </a>
                                </div>
                                <div id="collapse1" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                                                               <h6>Organization, structure and presentation (style, clarity and readability)</h6>
                                        <hr />

                            <asp:RadioButton ID="org1" runat="server" GroupName="Organization" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="org2" CssClas="rad1" runat="server" GroupName="Organization" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="org3" CssClas="rad1" runat="server" GroupName="Organization" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="org4" CssClas="rad1" runat="server" GroupName="Organization" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid2" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse2">Rationale
                                    </a>
                                </div>
                                <div id="collapse2" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>A rationale for the study which includes a clear purpose statement and/or research questions addressed in the paper and a brief review of related literature including key citations.</h6>
                                        <hr />
                            <asp:RadioButton ID="rationale1" CssClas="rad1" runat="server" GroupName="rationale" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="rationale2" CssClas="rad1" runat="server" GroupName="rationale" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="rationale3" CssClas="rad1" runat="server" GroupName="rationale" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="rationale4" CssClas="rad1" runat="server" GroupName="rationale" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid3" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse3">Methodology
                                    </a>
                                </div>
                                <div id="collapse3" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>A methodology section which includes sample size, a description of the how the sample was selected and recruited, a description of the how the sample was selected and recruited, a description of the methodology, data collection strategies used and a description of the data analysis procedures.</h6>
                                        <hr />
                            <asp:RadioButton ID="methodology1" CssClas="rad1" runat="server" GroupName="methodology" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="methodology2" CssClas="rad1" runat="server" GroupName="methodology" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="methodology3" CssClas="rad1" runat="server" GroupName="methodology" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="methodology4" CssClas="rad1" runat="server" GroupName="methodology" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid4" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="card-link" data-toggle="collapse" href="#collapse4">Findings
                                    </a>
                                </div>
                                <div id="collapse4" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>Findings which highlight the key findings of the study making sure to address the study purpose and all research questions and including any tables, graphs and figures that help summarize the findings.</h6>
                                        <hr />
                            <asp:RadioButton ID="Findings1" CssClas="rad1" runat="server" GroupName="Findings" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Findings2" CssClas="rad1" runat="server" GroupName="Findings" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Findings3" CssClas="rad1" runat="server" GroupName="Findings" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Findings4" CssClas="rad1" runat="server" GroupName="Findings" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid5" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse5">Discussion
                                    </a>
                                </div>
                                <div id="collapse5" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>A Discussion of implications for TR proactive which describes the contribution the study makes to therapeutic recreation proactive and provides specific recommendations for practice.</h6>
                                        <hr />
                            <asp:RadioButton ID="Discussion1" CssClas="rad1" runat="server" GroupName="Discussion" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Discussion2" CssClas="rad1" runat="server" GroupName="Discussion" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Discussion3" CssClas="rad1" runat="server" GroupName="Discussion" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Discussion4" CssClas="rad1" runat="server" GroupName="Discussion" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid6" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse6">Abstract
                                    </a>
                                </div>
                                <div id="collapse6" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>Does it have an abstract that is approx. 250 words and also includes 5-6 keywords that best describe content of the article?</h6>
                                        <hr />
                            <asp:RadioButton ID="abstract1" CssClas="rad1" runat="server" GroupName="abstract" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="abstract2" CssClas="rad1" runat="server" GroupName="abstract" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="abstract3" CssClas="rad1" runat="server" GroupName="abstract" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="abstract4" CssClas="rad1" runat="server" GroupName="abstract" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid7" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="card-link" data-toggle="collapse" href="#collapse7">Manuscript
                                    </a>
                                </div>
                                <div id="collapse7" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>Is the length of manuscript a maximum number of 15 pages includeing references?</h6>
                                        <hr />
                            <asp:RadioButton ID="manuscript1" CssClas="rad1" runat="server" GroupName="manuscript" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="manuscript2" CssClas="rad1" runat="server" GroupName="manuscript" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="manuscript3" CssClas="rad1" runat="server" GroupName="manuscript" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="manuscript4" CssClas="rad1" runat="server" GroupName="manuscript" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid8" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse8">Proper Formatting
                                    </a>
                                </div>
                                <div id="collapse8" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>Is it formatted properly? Type manuscripts in <i>Microsoft Word</i>, Times New Roman (font size of 12), double-spaced, with 10-inch margins on all four sides. Tables must be original (created in your WORD document, or able to be edited in WORKD), figures must be of high quality (i.e. jpg file with high dpi).</h6>
                                        <hr />
                            <asp:RadioButton ID="formatted1" CssClas="rad1" runat="server" GroupName="formatted" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="formatted2" CssClas="rad1" runat="server" GroupName="formatted" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="formatted3" CssClas="rad1" runat="server" GroupName="formatted" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="formatted4" CssClas="rad1" runat="server" GroupName="formatted" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid9" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header">
                                    <a class="collapsed card-link" data-toggle="collapse" href="#collapse9">Citations
                                    </a>
                                </div>
                                <div id="collapse9" class="collapse" data-parent="#accordion">
                                    <div class="card-body">
                        <h6>Do the citations and referencing follow the guidelines laid out in the Publication Manual of the American Psychological Association, 6th edition guidelines for the text, labelling tables and figures, citations and references?</h6>
                                        <hr />
                            <asp:RadioButton ID="citations1" CssClas="rad1" runat="server" GroupName="citations" Text="Perfect" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="citations2" CssClas="rad1" runat="server" GroupName="citations" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="citations3" CssClas="rad1" runat="server" GroupName="citations" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="citations4" CssClas="rad1" runat="server" GroupName="citations" Text="Missing" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid10" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                                    </div>
                                </div>
                            </div>


                        </div>
                        
                        <%--END ACCORDION--%>

                        <h5 class="mt-3">Recommendation</h5>
                        <div class="form-check col-lg-10 ml-2 mt-2">
                            <asp:RadioButton ID="Recommendation1" CssClas="rad1" runat="server" GroupName="Recommendation" Text="Accept" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Recommendation2" CssClas="rad1" runat="server" GroupName="Recommendation" Text="Minor Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Recommendation3" CssClas="rad1" runat="server" GroupName="Recommendation" Text="Major Revision" CssClass="rad1" />
                            <br />
                            <asp:RadioButton ID="Recommendation4" CssClas="rad1" runat="server" GroupName="Recommendation" Text="Reject" CssClass="rad1" />
                            <br />
                            <asp:Label ID="notValid11" runat="server" ForeColor="Red" Visible="False">You can not leave this section with no comment</asp:Label>

                        </div>
                        <hr />
                        <h3>Confidential comments to the Editor</h3>
                        <br />
                        <asp:TextBox ID="txtConfEditor" CssClass="form-control" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        <br />
                        <br />
                        <hr />
                        <h3>Comments to the Author</h3>
                        <br />
                        <asp:TextBox ID="txtAuthor" CssClass="form-control" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                        &nbsp;<br />
                    </asp:Panel>
                    <asp:Button CssClass="btn btn-outline-success mt-4 mb-4" Width="80" Text="Submit" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                    <asp:Button CssClass="btn btn-outline-info m-4" Width="80" Text="Save" runat="server" ID="btnSave" />
                    <br />
                    <asp:Button CssClass="btn btn-outline-primary mt-4 mb-4" Width="80" Text="Go Back" runat="server" ID="btnBack" Visible="false" OnClick="btnBack_Click" />
                    <br />
                    <asp:Label ID="lblSucess" runat="server" ForeColor="green" Visible="False"></asp:Label>

                    <asp:Label ID="notValidSumm" runat="server" ForeColor="Red" Visible="False">You can not leave sections with no comments. Please provide all the feedback necessary</asp:Label>

                </div>
                <div id="divPic" class=" col-lg-6 float-right rounded p-1">
                    <img src="/images/article.jpg" alt="article picture" height="525" width="372" />
                </div>


            </div>
        </div>
    </form>
</body>
</html>
