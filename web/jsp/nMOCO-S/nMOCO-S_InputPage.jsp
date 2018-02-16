<%-- 
    Document   : nMOCOS_InputPage
    Created on : Jun 22, 2016, 8:09:43 PM
    Author     : gokhanceyhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-114316991-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-114316991-1');
        </script>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Job Submission</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/jqBootstrapValidation.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../../css/nMOCO-S_InputPage.css" rel="stylesheet">


        <!-- Custom javascript files -->
        <script src="../../js/nMOCO-S_InputPage.js"></script>

    </head>

    <body>

        <div class="container">

            <nav class="navbar navbar-inverse">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="../../index.jsp">MOCO-S</a>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="../../index.jsp">Home</a></li>
                            <li><a href="../about.jsp">About</a></li>
                            <li><a href="../contact.jsp">Contact</a></li>
                            <li><a href="../libMOCO-S/libMOCO-S.jsp">Library</a></li>
                            <li><a href="nMOCO-S_Home.jsp">Solvers</a></li>
                            <li><a href="../guide/guide.jsp">Guide</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>
            <div class="jumbotron">

                <form id="uploadForm" name="uploadForm" method="post" action="../../UploadServlet" class="form-nMOCOS" enctype="multipart/form-data" novalidate>

                    <div class="container">

                        <div class="row">  

                            <div class="col-md-6">
                                <legend> Solver Parameters: <a href="../guide/guide.jsp#nMOCO-S_Input"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a></legend>
                                <fieldset class="control-group form-group" id="nMOCOS_SolverParams">
                                    <label for="nMOCOS_SolverType">Solver Type</label>
                                    <select class="form-control" id="nMOCOS_SolverType" name="SolverType" onchange="updateSolverParamsLists();">
                                        <option value="nMOCO-S" selected="selected">nMOCO-S: Generate all nondominated points</option>
                                        <option value="rMOCO-S_sba">rMOCO-S1: Subset Based Algorithm (SBA)</option>
                                        <option value="rMOCO-S_tda">rMOCO-S2: Territory Defining Algorithm (TDA)</option>
                                    </select>
                                    <p class="help-block"></p>
                                </fieldset>
                                <fieldset class="control-group form-group" id="nMOCOS_TimeLimit">
                                    <label for="nMOCOS_TimeLimit">Time Limit in seconds (Default = 600)</label>
                                    <input type="number" class="form-control" id="nMOCOS_timeLimit" name="TimeLimit" placeholder=""
                                           value="600"
                                           min="0"
                                           max="600"
                                           />
                                    <p class="help-block"></p>
                                </fieldset>
                                <fieldset class="control-group form-group" id="nMOCOS_PointLimit" style="display: none">
                                    <label for="nMOCOS_PointLimit">Number of points to generate (Default = -1(ALL))</label>
                                    <input type="number" class="form-control" id="nMOCOS_pointLimit" name="PointLimit" placeholder=""
                                           value="-1"
                                           min="-1"
                                           step="1"
                                           data-validation-integer ="true"
                                           data-validation-integer-message="The value is not an integer" 
                                           />
                                    <p class="help-block"></p>
                                </fieldset>
                                <fieldset class="control-group form-group" id="nMOCOS_Delta" style="display: none">
                                    <label for="nMOCOS_Delta">Coverage gap target (Default = 0.1)</label>
                                    <input type="number" class="form-control" id="nMOCOS_delta" name="delta" placeholder=""
                                           value="0.1"
                                           min="0"
                                           max="1"                          
                                           />
                                    <p class="help-block"></p>
                                </fieldset>
                                <fieldset class="control-group form-group" >
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input id="email" type="email" class="form-control" name="email" placeholder="Email" required data-validation-required-message="Please enter your email address.">                                           
                                    </div>
                                    <p class="help-block"></p>
                                </fieldset>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="nMOCOS_agreement" name="aggrement"
                                               checked
                                               minchecked="1"
                                               data-validation-checkone-message=
                                               "You must agree to the terms and conditions"
                                               >
                                        I agree with the <a data-toggle="modal" data-target="#termsModal">terms and conditions</a> 
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div>
                                        <button type="submit" class="btn btn-primary" id="uploadBtn" name="upload" value="upload">Upload</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <legend> Input Parameters: <a href="../guide/guide.jsp#nMOCO-S_Input"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a></legend>
                                <fieldset class="control-group form-group" id="nMOCOS_InputParams1">
                                    <label for="nMOCOS_InputType">Input Type</label>
                                    <select class="form-control" id="nMOCOS_InputType" name="InputType" onchange="updateInputParamsLists();">
                                        <option value="Model" selected="selected">Model File (.lp)</option>
                                        <option value="Data" >Data File</option>   
                                    </select>
                                    <p class="help-block"></p>
                                </fieldset>

                                <fieldset class="control-group form-group" id="nMOCOS_InputParams2">
                                    <label for="nMOCOS_numOfObjectives">Number of Objectives</label>
                                    <input type="number" class="form-control" id="nMOCOS_numOfObjectives" name="numOfObj" placeholder="" 
                                           required
                                           min="3"
                                           step="1"
                                           data-validation-integer ="true"
                                           data-validation-integer-message="The value is not an integer"
                                           />
                                    <p class="help-block"></p>
                                </fieldset>

                                <fieldset class="form-group" id="nMOCOS_InputParams3" style="display: none">
                                    <label for="nMOCOS_ProblemType">Problem Type</label>
                                    <select class="form-control" id="nMOCOS_ProblemType" name="ProblemType" onchange="updateInputParamsLists();">                         
                                        <option value="Knapsack" selected="selected">Knapsack Problem</option>
                                        <option value="Assignment">Assignment Problem</option>
                                    </select>
                                </fieldset>

                                <fieldset class="form-group" id="nMOCOS_ProblemParams" style="display: none">
                                    <legend> Problem Parameters:</legend>

                                    <fieldset class="control-group form-group" id="nMOCOS_KnapsackParams1">
                                        <label for="nMOCOS_numOfKnapsacks">Number of Knapsacks</label>
                                        <input type="number" class="form-control" id="nMOCOS_numOfKnapsacks" name="numOfKnapsacks" placeholder=""
                                               value="1"
                                               min="1"
                                               step="1"
                                               data-validation-integer ="true"
                                               data-validation-integer-message="The value is not an integer"
                                               />
                                        <p class="help-block"></p>
                                    </fieldset>

                                    <fieldset class="control-group form-group" id="nMOCOS_KnapsackParams2">
                                        <label for="nMOCOS_numOfItems">Number of Items</label>
                                        <input type="number" class="form-control" id="nMOCOS_numOfItems" name="numOfItems" placeholder=""
                                               value="1"
                                               min="1"
                                               step="1"
                                               data-validation-integer ="true"
                                               data-validation-integer-message="The value is not an integer"
                                               />
                                        <p class="help-block"></p>
                                    </fieldset>

                                    <fieldset class="control-group form-group" id="nMOCOS_AssignmentParams1">
                                        <label for="nMOCOS_numOfJobs">Number of Jobs</label>
                                        <input type="number" class="form-control" id="nMOCOS_numOfJobs" name="numOfJobs" placeholder=""
                                               value="1"
                                               min="1"
                                               step="1"
                                               data-validation-integer ="true"
                                               data-validation-integer-message="The value is not an integer"
                                               />
                                        <p class="help-block"></p>
                                    </fieldset>

                                </fieldset>

                                <fieldset class="control-group form-group" id="nMOCOS_fileUpload">
                                    <label for="nMOCOS_InputFile">File Input</label>
                                    <input type="file" class="form-control-file" id="nMOCOS_InputFile" name="uploadFile"
                                           required
                                           data-validation-required-message="Please upload the input file."
                                           />
                                    <p class="help-block"></p>
                                </fieldset>

                            </div>

                        </div>

                    </div>

                </form>

                <!-- Terms and conditions modal -->
                <div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="Terms and conditions" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3 class="modal-title">Terms and conditions</h3>
                            </div>

                            <div class="modal-body">
                                <p>
                                    You understand and agree that in using the provided solvers, 
                                    IBM authorizes You to use IBM ILOG CPLEX solely for academic, non-commercial research purposes,
                                    and that IBM shall have the right to enforce any violation of this
                                    limitation directly against You.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>



            </div>


        </div> <!-- /container -->

    </body>
</html>



