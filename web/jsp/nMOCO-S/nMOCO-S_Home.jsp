<%-- 
    Document   : nMOCO-S_home
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
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="../../css/font-awesome-4.7.0/css/font-awesome.min.css">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../../css/nMOCO-S_Home.css" rel="stylesheet">

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

            <div class="jumbotron">
                <a class="btn btn-lg btn-success" href="#">
                    <i class="fa fa-cogs fa-5x pull-left"></i>SUBMIT<br>JOB TO<br>SERVER</a>

                <a class="btn btn-lg btn-primary" href="#">
                    <i class="fa fa-cloud-upload fa-5x pull-left"></i>SUBMIT<br>JOB TO<br>SERVER</a>
                    
                    <a class="btn btn-lg btn-info" href="#">
                    <i class="fa fa-database fa-5x pull-left"></i>SEARCH JOB</a>
                    
                    <a class="btn btn-lg btn-info" href="#">
                    <i class="fa fa-line-chart fa-5x pull-left"></i>ANALYZER</a>


            </div>


        </div> <!-- /container -->

    </body>
</html>

