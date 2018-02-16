<%-- 
    Document   : guide
    Created on : Jan 28, 2017, 2:11:29 PM
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
                            <li><a href="../nMOCO-S/nMOCO-S_Home.jsp">Solvers</a></li>
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
                            <a href="#intro">Overview</a>                            
                        </li>
                        <li>
                            <a data-toggle="collapse" href="#Apps">Applications
                                <span class="glyphicon glyphicon-chevron-down   " aria-hidden="true"></span>
                            </a>
                            <div id="Apps" class="panel-collapse collapse">
                                <a href="#nMOCO-S" iclass="collapse">nMOCO-S</a>
                                <a href="#rMOCO-S" iclass="collapse">rMOCO-S</a>
                                <a href="#" iclass="collapse">iMOCO-S</a>
                            </div>                           
                        </li>
                        <li>
                            <a data-toggle="collapse" href="#Probs">Library
                                <span class="glyphicon glyphicon-chevron-down   " aria-hidden="true"></span>
                            </a>
                            <div id="Probs" class="panel-collapse collapse">
                                <a href="#MOKP" iclass="collapse">Knapsack</a>
                                <a href="#MOAP" iclass="collapse">Assignment</a>
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

                                <h1 id="intro" class="text-success">MOCO-S USER GUIDE</h1>

                                <h2 class="text-primary">Solvers</h2>    

                                <h3 id="nMOCO-S" class="text-info">nMOCO-S</h3>

                                <h4>The algorithm</h4>


                                <h4 id="nMOCO-S_input">Problem upload</h4>
                                <p>
                                    Problem files can be submitted to <mark>nMOCO-S</mark> application
                                    via two alternative ways listed in <strong>Input Type</strong> field. For a subset of problems,
                                    <code>Data File</code> upload option is available. These problems are multi-dimensional 0-1 knapsack,
                                    assignment and shorthest path problems as listed under <strong>Problem Type</strong> field.
                                    Apart from that, the user must fill the required fields that appear only when <strong>Input Type</strong> is
                                    selected as <code>Data File</code>. For any problem that cannot be submitted as a <code>Data File</code>
                                    through one of the available options, <code>Model File (.lp)</code> option enables the user to upload
                                    the problem in ".lp" format of IBM ILOG CPLEX software.                                     
                                </p>

                                <h5>Input parameters</h5>


                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Parameter Name</th>
                                            <th>Definition</th>
                                            <th>Set of values</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Input Type</td>
                                            <td>Type of the data file to be uploaded.</td>
                                            <td>{"Model File (.lp)","Data File"}</td>
                                        </tr>
                                        <tr>
                                            <td>Problem Type</td>
                                            <td>Active only if the user selects <code>Data File</code> option in <strong>Input Type</strong> parameter.
                                                Defines the type of the problem whose parameters are defined in the the uploaded data file.
                                            </td>
                                            <td>{"Knapsack Problem", "Assignment Problem"}</td>
                                        </tr>
                                        <tr>
                                            <td>Number of objectives</td>
                                            <td>Number of objective functions in the uploaded problem file.</td>
                                            <td>$\left\{n \in \mathbb{N} : n \geq 2 \right\}$</td>
                                        </tr>
                                        <tr>
                                            <td>Number of knapsacks</td>
                                            <td>Active only if the user selects <code>Data File</code> option in <strong>Input Type</strong> parameter
                                                and <code>Knapsack Problem</code> in the <strong>Problem Type</strong> parameter.
                                                Specifies the number of knapsack constraints in the problem. 
                                            </td>
                                            <td>$\left\{n \in \mathbb{N} : n \geq 1 \right\}$</td>
                                        </tr>
                                        <tr>
                                            <td>Number of items</td>
                                            <td>Active only if the user selects <code>Data File</code> option in <strong>Input Type</strong> parameter
                                                and <code>Knapsack Problem</code> in the <strong>Problem Type</strong> parameter.
                                                Specifies the number of items to be placed in the knapsack. 
                                            </td>
                                            <td>$\left\{n \in \mathbb{N} : n \geq 1 \right\}$</td>
                                        </tr>
                                        <tr>
                                            <td>Number of jobs</td>
                                            <td>Active only if the user selects <code>Data File</code> option in <strong>Input Type</strong> parameter
                                                and <code>Assignment Problem</code> in the <strong>Problem Type</strong> parameter.
                                                Specifies the number of jobs (people) each is to be assigned to exactly one operator (person). 
                                            </td>
                                            <td>$\left\{n \in \mathbb{N} : n \geq 1 \right\}$</td>
                                        </tr>
                                    </tbody>
                                </table>


                                <h5>Data file format</h5>
                                <p>    
                                    The data file to define an instance of the available problem types must comply with the specifications
                                    given in the links below:                                 
                                </p>
                                <ul>
                                    <li>
                                        <a href="#MOKP">Multi dimensional 0-1 knapsack problem</a>
                                    </li>
                                    <li>
                                        <a href="#MOAP">Assignment problem</a>
                                    </li>
                                </ul>

                                <h5>Model file format</h5>
                                <p>
                                    The user has the option to upload a multi-objective integer program (MIP) in LP file format used
                                    by IBM ILOG CPLEX solver with some minor modifications. You can have the necessary information about this input file
                                    format <a href="http://www.ibm.com/support/knowledgecenter/en/SSSA5P_12.3.0/ilog.odms.cplex.help/Content/Optimization/Documentation/Optimization_Studio/_pubskel/ps_reffileformatscplex2159.html">here.</a>
                                    First of all, we require the user has the associated LP file format of the single objective MIP problem.
                                    Then, the user should follow the steps given below:
                                </p>

                                <ul>
                                    <li>
                                        Delete the expression following the <code>obj</code> keyword.
                                    </li>
                                    <li>
                                        Let the problem has $m$ objectives. Define $m$ continuous variables, $z_1, z_2, ..., z_m$.
                                    </li>
                                    <li>
                                        First $(m-1)$ objective function variables must be multiplied with $\epsilon = 1e-4$.
                                    </li>
                                    <li>
                                        Create $m$ additional constraints right after the last constraint of the single objective problem.
                                        Let $e_i$ be the expression for the criterion $i$. Then, subtract $z_i$ from this expression and add the 
                                        constraint $e_i-z_i=0$ to the constraint set. Do this for all criteria.
                                    </li>
                                </ul>

                                <p><i> Example:</i></p>
                                <p>
                                    Consider a single-knapsack, 5-item bi-objective 0-1 knapsack problem. Let the criterion matrix be
                                    [[5, 2, 6, 8, 9];[3, 9, 7, 6, 4]] and the weight vector be [2, 9, 1, 5, 7]. Suppose the capacity of
                                    the knapsack is 15. Then, the valid file format for <mark>nMOCO-s</mark> is shown below:
                                </p>
                                <pre>
                                    Maximize
                                    obj: 0.0001z1 + z2
                                    Subject To
                                    c1: 2 x1 + 9 x2 + x3 + 5 x4 + 7 x5 <= 15
                                    c2: 5 x1 + 2 x2 + 6 x3 + 8 x4 + 9 x5 - z1 = 0
                                    c3: 3 x1 + 9 x2 + 7 x3 + 6 x4 + 4 x5 - z2 = 0
                                    Bounds
                                    0 <= x1 <= 1
                                    0 <= x2 <= 1
                                    0 <= x3 <= 1
                                    0 <= x4 <= 1
                                    0 <= x5 <= 1
                                    General
                                    x1 x2 x3 x4 x5
                                    End
                                </pre>


                                <h4 id="nMOCO-S_output">Solver output</h4>
                                <p>
                                    If the solver <mark>nMOCO-S</mark> terminates successfully, the following outputs are displayed
                                    when the user clicks on the button <kbd>Show results</kbd>.
                                </p>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Parameter Name</th>
                                            <th>Definition</th>
                                            <th>Set of values</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Number of nondominated points</td>
                                            <td>Specifies the number of nondominated points generated for the uploaded problem.</td>
                                            <td>$\left\{n \in \mathbb{N}\right\}$</td>
                                        </tr>
                                        <tr>
                                            <td>Number of calls to solver</td>
                                            <td>The number of times the single objective solver is called during the process.</td>
                                            <td>$\left\{n \in \mathbb{N}\right\}$</td>
                                        </tr>
                                        <tr>
                                            <td>Total CPU time (secs)</td>
                                            <td>The cpu time spent by the solver.</td>
                                            <td>$\left\{t \in \mathbb{R}_{>0}\right\}$</td>
                                        </tr>

                                    </tbody>
                                </table>
                                <p>
                                    To download the output file containing the list of nondominated points generated,
                                    click on the button <kbd>Download</kbd>. The format of the output file is explained
                                    <a href="#output_format">here.</a>
                                </p>

                                <h4 id="nMOCO-S_exceptions">Solver exceptions</h4>

                                <h3 id="rMOCO-S" class="text-info">rMOCO-S</h3>

                                <h2 id="Library" class="text-primary">Instance Library</h2>
                                <p>
                                    Our library, <mark>libMOCO-S</mark>, includes instances from well-known combinatorial optimization problems
                                    like knapsack, assignment and shorthest path. Those instances are randomly generated by the schemes explained
                                    in <a href="http://onlinelibrary.wiley.com/doi/10.1002/nav.20336/abstract">Köksalan and Lokman (2009)</a>.
                                </p>
                                <h3 id="MOKP">Multi-objective knapsack problem (MOKP)</h3>

                                <h4 id="MOKP_model">Model</h4>

                                <p>
                                    \begin{align}
                                    \text{"Max"} & \quad \left\{ z_1(\textbf{x}), z_2(\textbf{x}), ..., z_m(\textbf{x}) \right\} \\
                                    \text{s. to.} \\
                                    &  \sum\limits_{j=1}^{n} w_{kj}x_j \leq W_k \quad \forall k \\
                                    & x_j \in \left\{0,1\right\} \quad \forall j
                                    \end{align}
                                </p>

                                <p>where</p>
                                <p>
                                    \begin{align}
                                    z_i(\textbf{x})=\sum\limits_{j=1}^{n}c_{ij}x_j,
                                    \end{align}
                                </p>   
                                <p> $c_{ij}$ is the coefficient of item $j$ in criterion $i$, </p>
                                <p> $w_{kj}$ is the weight of item $j$ in knapsack $k$, </p>
                                <p> $W_k$ is the capacity of knapsack $k$ and, </p>
                                <p> $x_{j}$ is the decision variable which takes the value of 1 if it is included   , otherwise it is 0.</p>

                                <h4 id="MOKP_input">Input file format</h4>

                                <p>
                                    The following parameters are needed to define an instance of MOKP.
                                </p>
                                <ul>
                                    <li>Number of objectives: $m$</li>
                                    <li>Number of knapsacks: $k$</li>
                                    <li>Number of items: $n$</li>
                                </ul>
                                <p>
                                    Data file input must comply with the following format:
                                </p>
                                <p>
                                    First $m$ lines include criterion coefficient matrix $C^{mxn}$ with entries $c_{ij}$ at row $i$ and column $j$.
                                    For criterion $i$, entries of matrix row $i$, $C_i=[c_{i1}, c_{i2},...c_{in}]$, should be <strong>single-space</strong> delimited
                                    and last entry should be followed by <strong>new line ("\n")</strong> character. Next $k$ lines specify the weight
                                    coefficient matrix, $W^{kxn}$. Row $k$ of matrix $W$, $W_k=[w_{k1},w_{k2},...w_{kn}]$, specifies the weight of items in knapsack $k$. 
                                    Each row entry should be <strong>single-space</strong> delimited and last entry should be followed by <strong>new line ("\n")</strong>
                                    character. Knapsack capacities are represented by column vector of size $k$ and each entry should be specified
                                    at a separate line sequentially.
                                </p>


                                <h3 id="MOAP">Multi-objective assignment problem (MOAP)</h3>

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


                                <h4 id="MOAP_input">Input file format</h4>
                                <p>
                                    The following parameters are needed to define an instance of MOAP.
                                </p>
                                <ul>
                                    <li>Number of objectives: $m$</li>
                                    <li>Number of jobs: $n$</li>
                                </ul>
                                <p>
                                    Data file input must comply with the following format:
                                </p>
                                <p>
                                    Let $C_i^{nxn}$ be the matrix of assignment costs for criterion $i=1,2,...m$. The matrix entry at row $j$
                                    and column $k$ of matrix $C_i$ specifies the cost coefficient $c_{ijk}$. Entries in each row of matrix $C_i$ 
                                    should be <strong>single-space</strong> delimited and last entry of each row should be followed by 
                                    <strong>new line ("\n")</strong> character. However, if $j=n$, then an additional <strong>new line ("\n")</strong>
                                    should be added after the last entry of the row.

                                </p>

                                <h3 id="output_format">Output file format</h3>
                                <p>
                                    Each instance in <mark>libMOCO-S</mark> has an associated output file which presents the main results
                                    returned by <mark>nMOCO-S</mark> application. The first entry gives the total number of nondominated points
                                    <code>N</code>, the second entry shows the total number of times the backend single objective optimization solver is called.
                                    Next <code>N</code> lines list all of the nondominated points of the associated problem. Each line gives 
                                    the criterion values of a nondominated point separated by white spaces.

                                </p>



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
