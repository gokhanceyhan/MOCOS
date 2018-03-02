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
        <div class="container">

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
            <div class="container">


                <div class="row">
                    <div class="col-lg-12">

                        <h1 id="intro" class="text-success">MOCO-S USER GUIDE</h1>
                        
                        <!--table of contents-->
                        <ul>
                            <li>
                                <a href="#Solvers">Solvers</a>
                                <ul>
                                    <li>
                                        <a href="#nMOCO-S">nMOCO-S</a>
                                    </li>
                                    <li>
                                        <a href="#rMOCO-S">rMOCO-S</a>
                                    </li>
                                    <li>
                                        <a href="#SolverParameters">Solver Parameters</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Library">Instance Library</a>
                                <ul>
                                    <li>
                                        <a href="#MOKP">Multi dimensional 0-1 knapsack problem</a>
                                    </li>
                                    <li>
                                        <a href="#MOAP">Assignment problem</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#Visualization">Visualization</a>
                            </li>
                        </ul>

                        <h2 id="Solvers" class="text-primary">Solvers</h2>  
                        <p>
                            We provide three different solvers on <a href="../nMOCO-S/nMOCO-S_InputPage.jsp">problem upload page</a>. 
                            Each solver has been designed to work on a particular need of the user. The first solver <a href="#nMOCO-S">nMOCO-S</a>
                            tries to find the all nondominated points of the given multi-objective integer program. On the other hand, two
                            <a href="#rMOCO-S">rMOCO-S</a> solvers target a representative subset of the nondominated set in two different ways.
                            The first one, <code>Subset Based Algorithm (SBA)</code>, iteratively generates the nondominated points with the highest coverage gaps
                            with respect to the already generated nondominated points. The second solver, <code>Territory Defining Algorithm (TDA)</code>, requires a threshold
                            coverage gap value to be satisfied by the final nondominated point set and uses this threshold to reduce the space searched by the algorithm. At the end,
                            it guarantees to find a representative nondominated point subset that achieves the desired coverage gap by the user.                            
                        </p>
                        <p>
                            The main characteristics of the algorithms are listed below: 
                        </p>
                        <ul>
                            <li>
                                The algorithms are <strong>exact</strong> solution methods for multi-objective optimization problems. That is, the generated points are 
                                <strong>nondominated.</strong>
                                (We should note that the user must be aware of the fact that the single-objective solver at the back-end has an optimality tolerance and may return
                                a sub-optimal solution if it satisfies the given optimality tolerance. Therefore, the nondominated points reported by our solvers are nondominated as 
                                much as the optimal solutions returned by the single-objective solver are optimal. Check for the current <a href="#SolverParameters">solver tolerances</a>.)                        
                            </li>
                            <li>
                                The solvers are <strong>generic</strong> in the sense that they can work under any number of objective functions and any type of integer program that the
                                single-objective solver can solve to global optimum. In addition, rMOCO-S can also be used for multi-objective mixed-integer programs.
                                Those programs are <a href="https://www.ibm.com/support/knowledgecenter/SSSA5P_12.6.0/ilog.odms.cplex.help/CPLEX/UsrMan/topics/discr_optim/mip/02_prob_statement.html">mixed-integer linear program (MILP)</a>,
                                <a href="https://www.ibm.com/support/knowledgecenter/en/SSSA5P_12.6.3/ilog.odms.cplex.help/CPLEX/UsrMan/topics/discr_optim/mip_quadratic/02_introMIQP.html">mixed-integer quadratic program (MIQP)</a> and
                                <a href="https://www.ibm.com/support/knowledgecenter/en/SSSA5P_12.8.0/ilog.odms.cplex.help/CPLEX/UsrMan/topics/discr_optim/mip_quadratic/03_introMIQCP.html">mixed-integer quadratically constraint integer program (MIQCP)</a> satisfying certain conditions.
                                (For the sake of computational efficiency, the underlying data-structure of our solvers is designed specifically to three or higher objective problems. 
                                For bi-objective problems, users can easily create a dummy criterion vector variable.)
                            </li>
                            <li>
                                
                                The underlying algorithms work in the <strong>scaled criterion space</strong>. In the preprocessing stage of the algorithms, we scale the criterion vectors with their Euclidean norms in order to
                                have a similar scale of possible values on each criterion.
                                In this way, we try to minimize the negative impact of criteria with very different scales on the nondominance of the generated points and the representativeness of the generated subsets. 
                            </li>
                        </ul>
                        
                        <p>
                            We suggest users to select the appropriate solver for their needs. For this purpose, we state the following use cases for our solvers: 
                        </p>
                        
                        <ul>
                            <li>
                                <strong>nMOCO-S:</strong> Use this solver only if
                                <ul>
                                    <li>
                                        your problem includes only binary or integer variables. The problems with continuous variables
                                        might have continuous parts in their nondominated frontier, infinitely many nondominated points, which cannot be generated by nMOCO-S completely.
                                    </li>
                                    <li>
                                        you do not think that your problem contains too many nondominated points. If the nondominated set is large, the solver will not be able
                                        to generate all in the time limit (see the <a href="#SolverParameters">solver parameters</a> for the current setting) and will only return a subset of nondominated set concentrated on a specific region of the
                                        criterion space.
                                    </li>
                                    <li>
                                        the single-objective problem is not very hard to solve. Again if this is the case, the solver will spend too much effort to generate each nondominated
                                        point and it will not be possible to find all the nondominated points in the time limit. 
                                    </li>
                                </ul>                      
                            </li>
                            
                            <li>
                                <strong>rMOCO-S:</strong> Use this solver when
                                <ul>
                                    <li>
                                        your problem includes continuous variables. The generated representative nondominated points by rMOCO-S are expected to represent the complete nondominated
                                        frontier of the problem well enough including the continuous regions.
                                    </li>               
                                    <li>
                                        you would like to have a diverse set of nondominated points as much as the <code>point limit</code> or up to the <code>time limit</code>. Use
                                        <strong>rMOCO-S_sba</strong> in this case. In the output file, you will be able to see the coverage gap of the generated subset.
                                    </li>
                                    <li>
                                        you have a priori coverage gap value that you would like the set of generated points to satisfy. Use <strong>rMOCO-S_tda</strong> in this case. The solver will be able to generate a representative
                                        nondominated subset which guarantees the given coverage gap value as long as it does not hit the time limit.
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        
                        <p>You can refer to the following papers for more information about the algorithms:</p>
                        <ul>
                            <li>
                                <a href="https://link.springer.com/article/10.1007/s10898-012-9955-7">B. Lokman and M. Köksalan (2013), “Finding all Nondominated Points of Multi-objective Integer Programs,” Journal of Global Optimization, 57, 347-365.</a>
                            </li>
                            <li>
                                <a href="http://etd.lib.metu.edu.tr/upload/12617675/index.pdf">G. Ceyhan (2014), "Generating Nondominated Point Subsets in Multi-objective Integer Programs", M.Sc. Thesis, Middle East Technical University</a>
                            </li>
                        </ul>

                        <h3 id="nMOCO-S" class="text-info">nMOCO-S</h3>

                        <h4>Overview of the algorithm</h4>


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

                        <h3 id="rMOCO-S" class="text-info">rMOCO-S</h3>
                        
                        <h3 id="SolverParameters">Solver Parameters</h3>

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


    </body>
</html>
