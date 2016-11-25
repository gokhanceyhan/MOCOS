<%-- 
    Document   : eMOCOS_SolvePage
    Created on : Jun 23, 2016, 8:45:50 PM
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/eMOCOS_Solve.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <script src="js/eMOCOS.js"></script>

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
                        <a class="navbar-brand" href="index.jsp">MOCO-S</a>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="about">About</a></li>
                            <li><a href="contact">Contact</a></li>
                            <li><a href="libMOCOS.jsp">Library</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="eMOCOS_InputPage.jsp">nMOCO-S</a></li>
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
                <div class="alert alert-success" role="alert">Upload successful! 
                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                </div>
                <div>
                    <p>
                        <button type="submit" class="btn btn-primary" onclick="solveModel();">Solve</button>
                    </p>
                </div>

                <div class="well well-lg" id="eMOCOS_log"></div>

                <div>
                    <form class="form-group" action="OutputServlet" method="POST">
                        <button type="submit" id="eMOCOS_getResultsButton"  class="btn btn-success" disabled="disabled" >Show results
                            <span class="glyphicon glyphicon-stats"></span>
                        </button>
                    </form> 
                </div>

                <div>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="eMOCOS_numOfPoints" class="col-lg-3">Number of nondominated points:</label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" id="eMOCOS_numOfPoints" value="${numofP}" placeholder="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="eMOCOS_numOfModels" class="col-lg-3">Number of calls to solver:</label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" id="eMOCOS_numOfModels" value="${numofM}" placeholder="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="eMOCOS_cpu" class="col-lg-3">Total CPU time (secs):</label>
                            <div class="col-lg-2">
                                <input type="text" class="form-control" id="eMOCOS_cpu" value="${cpu}" placeholder="">
                            </div>
                        </div>
                    </form>
                </div>

                <a class="btn btn-info" href="./myFiles/Output_nd_points.txt" role="button">Download <span class="glyphicon glyphicon-save-file"></span></a>



            </div>
        </div> <!-- /container -->

    </body>
</html>
