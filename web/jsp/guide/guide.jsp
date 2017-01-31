<%-- 
    Document   : guide
    Created on : Jan 28, 2017, 2:11:29 PM
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
        <link rel="icon" href="favicon.ico">

        <title>MOCO-S Guide</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Custom styles for this template -->
        <link href="../../css/guide.css" rel="stylesheet">
        <link href="../../css/side-bar.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script type="text/javascript" src="path-to-MathJax/MathJax.js"></script>
        <script type="text/javascript"
                src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
        </script>
    </head>
    <body>
        <div id="container">

            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="../../index.jsp">MOCO-S</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="../../index.jsp">Home</a></li>
                            <li><a href="../about.jsp">About</a></li>
                            <li><a href="../contact.jsp">Contact</a></li>
                            <li><a href="../libMOCO-S/libMOCO-S.jsp">Library</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="../nMOCO-S/nMOCO-S_InputPage.jsp">nMOCO-S</a></li>
                                    <li><a href="#">rMOCO-S</a></li>
                                    <li><a href="#">iMOCO-S</a></li>

                                    <!--li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Nav header</li>
                                    <li><a href="#">Separated link</a></li>
                                    <li><a href="#">One more separated link</a></li-->
                                </ul>
                            </li>
                            <li class="active"><a href="guide.jsp">Guide</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div id="wrapper">
                <!-- Sidebar -->
                <div id="sidebar-wrapper">
                    <ul class="sidebar-nav">
                        <li class="sidebar-brand">
                            <a href="#">Overview</a>                            
                        </li>
                        <li>
                            <a data-toggle="collapse" href="#Apps">Applications
                                <span class="glyphicon glyphicon-chevron-down   " aria-hidden="true"></span>
                            </a>
                            <div id="Apps" class="panel-collapse collapse">
                                <a href="#" iclass="collapse">nMOCO-S</a>
                                <a href="#" iclass="collapse">rMOCO-S</a>
                                <a href="#" iclass="collapse">iMOCO-S</a>
                            </div>                           
                        </li>
                        <li>
                            <a data-toggle="collapse" href="#Probs">Library
                                <span class="glyphicon glyphicon-chevron-down   " aria-hidden="true"></span>
                            </a>
                            <div id="Probs" class="panel-collapse collapse">
                                <a href="#" iclass="collapse">Knapsack</a>
                                <a href="#" iclass="collapse">Assignment</a>
                                <a href="#" iclass="collapse">Shortest Path</a>
                            </div>                           
                        </li> 

                    </ul>
                </div>
                <!-- /#sidebar-wrapper -->

                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">

                                <h1>MOCO-S USER GUIDE</h1>

                                <h2>Solvers</h2>    

                                <h3>nMOCO-S</h3>
                                
                                <h4>The algorithm</h4>
                                
                                <h4>Problem upload</h4>
                                <h5>Input parameters</h5>
                                <h5>Data file format</h5>
                                <h5>Model file format</h5>
                                <h4>Solver output</h4>
                                <h5>Output fields</h5>
                                <h5>Output file format</h5>

                                <h3>rMOCO-S</h3>

                                <h2 id="Library">Instance Library</h2>

                                <h3 id="MOKP">Multi-objective knapsack problem</h3>

                                <h4 id="MOKP_model">Model</h4>

                                <h4>Input file format</h4>

                                <h4>Output file format</h4>

                                <h3>Multi-objective assignment problem</h3>

                                <h4>Model</h4>

                                <h4>Input file format</h4>

                                <h4>Output file format</h4>




                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#page-content-wrapper -->
            </div>
            <!--wrapper-->
        </div>


    </body>
</html>
