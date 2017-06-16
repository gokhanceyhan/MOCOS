<%-- 
    Document   : nMOCO-S_JobQueue
    Created on : Feb 24, 2017, 6:33:30 PM
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
        
        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="../../css/font-awesome-4.7.0/css/font-awesome.min.css">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../../css/nMOCO-S_JobQueue.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <script src="../../js/nMOCO-S_JobQueue.js"></script>

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
                                    <li><a href="nMOCO-S_Home.jsp">nMOCO-S</a></li>
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

            <div class="row">   

                <div class="col-md-4">

                    <div class="control-group form-group">
                        <fieldset class="control-group form-group">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input id="email" type="email" class="form-control" name="email" placeholder="Email" required data-validation-required-message="Please enter your email address.">                                           
                            </div>
                            <p class="help-block"></p>
                        </fieldset>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="control-group form-group">
                        <fieldset class="control-group form-group">
                            <div class="input-group">                               
                                <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                                <input id="JobID" type="text" class="form-control" name="JobID" placeholder="Job ID" required data-validation-required-message="Please enter the job ID number.">
                            </div>
                            <p class="help-block"></p>
                        </fieldset>
                    </div>

                </div>

                <div class="col-md-4">
                    <div class="control-group form-group">
                        <p>
                            <button type="submit" class="btn btn-primary" onclick=""><i class="fa fa-search" aria-hidden="true"></i> Search</button>
                        </p>
                    </div>
                </div>

            </div>






        </div> <!-- /container -->

    </body>
</html>

