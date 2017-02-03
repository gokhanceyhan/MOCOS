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
        <script type="text/x-mathjax-config">
            MathJax.Hub.Config({
            extensions: ["tex2jax.js"],
            jax: ["input/TeX","output/HTML-CSS"],
            displayAlign: "left",
            tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
            });
        </script>
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
                                <p>
                                    Our library, <code>libMOCO-S</code>, includes instances from well-known combinatorial optimization problems
                                    like knapsack, assignment and shorthest path. Instances are randomly generated by the schemes explained in the 
                                    corresponding sections.
                                </p>
                                <h3 id="MOKP">Multi-objective knapsack problem</h3>

                                <h4 id="MOKP_model">Model</h4>

                                <p>
                                    \begin{align}
                                    \text{"Max"} & \quad \left\{ z_1(\textbf{x}), z_2(\textbf{x}), ..., z_m(\textbf{x}) \right\} \\
                                    \text{s. to.} \\
                                    &  \sum\limits_{j=1}^{l} w_{jk}x_j \leq W_k \quad \forall k \\
                                    & x_j \in \left\{0,1\right\} \quad \forall j
                                    \end{align}
                                </p>

                                <p>where</p>
                                <p>
                                    \begin{align}
                                    z_i(\textbf{x})=\sum\limits_{j=1}^{l}c_{ij}x_j,
                                    \end{align}
                                </p>   
                                <p> $c_{ij}$ is the coefficient of item $j$ in criterion $i$, </p>
                                <p> $w_{jk}$ is the weight of item $j$ in knapsack $k$, </p>
                                <p> $W_k$ is the capacity of knapsack $k$ and, </p>
                                <p> $x_{j}$ is the decision variable which takes the value of 1 if it is included   , otherwise it is 0.</p>

                                <h4>Input file format</h4>

                                <h4>Output file format</h4>

                                <h3 id="MOAP">Multi-objective assignment problem</h3>

                                <h4 id="MOAP_model">Model</h4>

                                <p>
                                    \begin{align}
                                    \text{"Min"} & \quad \left\{ z_1(\textbf{x}), z_2(\textbf{x}), ..., z_m(\textbf{x}) \right\} \\
                                    \text{s. to.} \\
                                    &  \sum\limits_{k=1}^{l} x_{jk}=1 \quad \forall j \\
                                    &  \sum\limits_{j=1}^{l} x_{jk}=1 \quad \forall k \\
                                    & x_{jk} \in \left\{0,1\right\} \quad \forall j,k
                                    \end{align}
                                </p>
                                <p>where</p>
                                <p> $z_i(\textbf{x})=\sum\limits_{j=1}^{n} \sum\limits_{k=1}^{n} c_{ijk}x_{jk}$,</p>
                                <p> $c_{ijk}$ is the coefficient for the assignment of job $j$ to person k in criterion $i$ and,</p>
                                <p> $x_{jk}$ is the decision variable which takes value 1 if job $j$ is assigned to person $k$, otherwise it is 0.</p>


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
