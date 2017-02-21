<%-- 
    Document   : eMOCOS_InputPage
    Created on : Jun 22, 2016, 8:09:43 PM
    Author     : gokhanceyhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>nMOCO-S</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/jqBootstrapValidation.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../../css/nMOCO-S_Input.css" rel="stylesheet">


        <!-- Custom javascript files -->
        <script src="../../js/nMOCO-S.js"></script>

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
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="nMOCO-S_InputPage.jsp">nMOCO-S</a></li>
                                    <li><a href="#">rMOCO-S</a></li>
                                    <li><a href="#">iMOCO-S</a></li>

                                    <!--li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li-->
                                </ul>
                            </li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>
            <div class="jumbotron">

                <form id="uploadForm" class="form-eMOCOS" method="post" action="../../UploadServlet" enctype="multipart/form-data" novalidate>
                    <div class="container">
                        <div class="row">           
                            <div class="col-md-6">
                                <legend> Input Parameters: <a href="../guide/guide.jsp#nMOCO-S_Input"><span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span></a></legend>

                                <fieldset class="form-group" id="eMOCOS_InputParams" style="display: block">

                                    <fieldset class="control-group form-group" id="eMOCOS_InputParams1">
                                        <label for="eMOCOS_InputType">Input Type</label>
                                        <select class="form-control validation-field" id="eMOCOS_InputType" name="InputType" onchange="updateInputParamsLists();" 
                                                required 
                                                data-validation-required-message="Please choose an input type.">
                                            <option value="" disabled="disabled" selected="selected">Select File Type</option>
                                            <option value="Model">Model File (.lp)</option>
                                            <option value="Data" >Data File</option>
                                        </select>
                                        <p class="help-block"></p>
                                    </fieldset>

                                    <fieldset class="form-group" id="eMOCOS_InputParams2">
                                        <label for="eMOCOS_ProblemType">Problem Type</label>
                                        <select class="form-control" id="eMOCOS_ProblemType" name="ProblemType" onchange="updateInputParamsLists();">
                                            <option value="" disabled="disabled" selected="selected">Select Problem Type</option>
                                            <option value="Knapsack">Knapsack Problem</option>
                                            <option value="Assignment">Assignment Problem</option>
                                        </select>
                                    </fieldset>

                                    <fieldset class="control-group form-group" id="eMOCOS_InputParams3">
                                        <label for="eMOCOS_numOfObjectives">Number of Objectives</label>
                                        <input type="text" class="form-control" id="eMOCOS_numOfObjectives" name="numOfObj" placeholder="" 
                                               required
                                               data-validation-required-message="Please enter a positive integer value."
                                               type="number"
                                               min="1"
                                               data-validation-number-message="Please enter a positive integer value."
                                               />
                                        <p class="help-block"></p>
                                    </fieldset>

                                </fieldset>

                                <fieldset class="form-group" id="eMOCOS_ProblemParams" style="display: none">
                                    <legend> Problem Parameters:</legend>

                                    <fieldset class="form-group" id="eMOCOS_KnapsackParams1">
                                        <label for="eMOCOS_numOfKnapsacks">Number of Knapsacks</label>
                                        <input type="text" class="form-control" id="eMOCOS_numOfKnapsacks" name="numOfKnapsacks" placeholder="">
                                    </fieldset>

                                    <fieldset class="form-group" id="eMOCOS_KnapsackParams2">
                                        <label for="eMOCOS_numOfItems">Number of Items</label>
                                        <input type="text" class="form-control" id="eMOCOS_numOfItems" name="numOfItems" placeholder="">
                                    </fieldset>

                                    <fieldset class="form-group" id="eMOCOS_AssignmentParams1">
                                        <label for="eMOCOS_numOfJobs">Number of Jobs</label>
                                        <input type="text" class="form-control" id="eMOCOS_numOfJobs" name="numOfJobs" placeholder="">
                                    </fieldset>

                                </fieldset>

                                <fieldset class="control-group form-group" id="eMOCOS_fileUpload">
                                    <label for="eMOCOS_InputFile">File Input</label>
                                    <input type="file" class="form-control-file" id="eMOCOS_InputFile" name="uploadFile"
                                           accept=".lp,.txt"
                                           />
                                </fieldset>

                                <fieldset class="control-group form-group" id="eMOCOS_filePermission">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="allowFile"> Allow to store the uploaded input data in the library. 
                                        </label>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-md-6">
                                <legend>User info:</legend>

                                <div class="control-group form-group">

                                    <fieldset class="control-group form-group">
                                        <label for="eMOCOS_userinfo"></label>
                                        <div class="input-group">                               
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <input id="name" type="text" class="form-control" name="username" placeholder="Name" required data-validation-required-message="Please enter your name.">
                                        </div>
                                        <p class="help-block"></p>
                                    </fieldset>

                                    <fieldset class="control-group form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                            <input id="email" type="email" class="form-control" name="email" placeholder="Email" required data-validation-required-message="Please enter your email address.">                                           
                                        </div>
                                        <p class="help-block"></p>
                                    </fieldset>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <div>
                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#termsModal">Agree with the terms and conditions</button>
                                <input type="hidden" name="agree" value="no" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div>
                                <button type="submit" class="btn btn-primary" name="upload" value="upload">Submit</button>
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
                                <p>CPLEX terms and conditions</p>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" id="agreeButton" data-dismiss="modal">Agree</button>
                                <button type="button" class="btn btn-default" id="disagreeButton" data-dismiss="modal">Disagree</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div> <!-- /container -->

    </body>
</html>



