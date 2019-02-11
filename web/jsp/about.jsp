    <%-- 
    Document   : about
    Created on : Aug 23, 2016, 9:45:23 PM
    Author     : gokhanceyhan
--%>

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

        <title>MOCO-S</title>

        <!-- Bootstrap core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Custom styles for this template -->
        <!--link href="../css/carousel.css" rel="stylesheet"-->
        <link href="../css/about.css" rel="stylesheet">
    </head>
    <!-- NAVBAR
    ================================================== -->
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
                        <a class="navbar-brand" href="../index.jsp">MOCO-S</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="../index.jsp">Home</a></li>
                            <li class="active"><a href="about.jsp">About</a></li>
                            <li><a href="contact.jsp">Contact</a></li>
                            <li><a href="libMOCO-S/libMOCO-S.jsp">Library</a></li>
                            <li><a href="nMOCO-S/nMOCO-S_Home.jsp">Solvers</a></li>
                            <li><a href="guide/guide.jsp">Guide</a></li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Jumbotron Header -->
            <div class="jumbotron">

                <div class="row">  
                    <div class="col-md-6">
                        <img src="../images/about_page_1.jpg" alt="agree" width="500" height="300">
                    </div>
                    <div class="col-md-4">
                        <img src="../images/odtu_logo.jpg" alt="agree" width="300" height="100">
                    </div>
                    <div class="col-md-2">
                        <img src="../images/tubitak_logo.jpg" alt="agree" width="100" height="100">
                    </div>
                </div>

                <h2 style="color: darkslateblue">About the project</h2>
                <p style="color: black">
                    Our goal is to provide solvers as a service to the students or researchers
                    having optimization problems with multiple objective functions. Although there are many software and tools to 
                    solve single-objective optimization problems, the resources are scarce for multiple-objective case. 
                </p>
                <p style="color: black">
                    Under multiple objective functions, we talk about the efficiency of a solution instead of optimality. The image of efficient solutions
                    in the criterion space are called nondominated points and there may be many nondominated points especially when the objective
                    functions are conflicting with each other. If the decision maker can prioritize the objective functions, then the problem can be modeled
                    as a lexicographic optimization problem and solved by a series of a single-objective optimation problems. Other than that, if the decision
                    maker can assign weights to objective functions, then the problem can be solved by optimizing the weighted sum of the objective functions. However,
                    these approaches are insufficient for any decision maker who lacks any prioritization between the objective functions and
                    wants to investigate different parts of the criterion space. 
                </p>
                <p style="color: black">
                    We have packaged our algorithms that can solve multi-objective mixed-integer programming problems into easy-to-use applications and made them
                    available to the public. We save the users from troublesome installation process of softwares and the associated libraries to their computers.
                    We also undertake the computational cost of solving the problems. Users just upload their problems in the required format,
                    we solve the problem and send the results.
                </p>

                <p style="color: black">Our project has been supported by The Scientific and Technological Research Council of Turkey (TUBITAK)
                    under 1001 program with project number 215M844. Below is the abstract of the final project report:</p>
            </div>
            <hr>
            <blockquote><i class="quotation" style="color: darkslateblue">
                    In large organizations and complex systems, the decision makers (DMs) usually have to deal with optimization problems with conflicting objectives. In multi-criteria optimization problems, typically there does not exist a unique solution of interest. It is essential to find the relevant nondominated points, for which an improvement in any objective is not possible without sacrificing in one of the remaining objectives. Since the number of nondominated points grows exponentially with the problem size, generating all nondominated points is not only difficult but is also not practical in real-sized problems. 
                    In this study, we develop a web-based decision support system for MOIPs. To do this, we first develop a web-based exact algorithm to generate all nondominated points for any MOIP. We study and exploit the characteristics of the nondominated sets of Multi-objective Integer Programs (MOIPs). We introduce a density measure and search for common properties of the distributions of nondominated points for different MOIPs. Secondly, we propose a procedure that estimates the possible locations and distributions of nondominated points over the criterion space for a given MOIP problem based on the analysis of the properties of nondominated points. Different from the existing studies, we develop new quality measures to evaluate how well a given set represents the nondominated set based on the density information. Using these quality measures and distribution characteristics, we develop algorithms to generate a representative subset with the desired quality level. These algorithms are designed in a way that the preference information is incorporated into the solution process. 
                    In this project, we also develop an online tool that is accessible to other researchers. The software we develop is capable to interact with the DM and generate a representative set to satisfy the desired quality level. We also develop visualization tools to present the points to the DM to help visualize tradeoffs between the points. 
                    We tested performance of our algorithms on different MOIPs and the results show that the algorithms work well. We present a digital library to the researchers that provides a collection of test data sets for a variety of MOIPs.            
            </i>
            </blockquote>
            <hr>
            <div class="row">  
                <div class="col-md-6">
                    <img src="../images/about_page_2.jpg" alt="agree" width="500" height="300">
                </div>
                <div class="col-md-6">

                </div>
            </div>
            <hr>
            <div class="jumbotron">
                <h2 style="color: darkred">About the software</h2>
                <div class="row">  
                    <div class="col-md-8">
                        <p style="color: black">How a user interacts with the system:</p>
                        <img src="../images/usecase.png" alt="agree" width="650" height="300">
                    </div>
                    <div class="col-md-4">
                        <p style="color: black">Users select a solver type and upload their problems. The problem file
                            and job specifications are stored in a central FIFO queue. The Scheduler monitors this queue and assign
                            the jobs to the solvers. Once a job is completed, the output is stored in the database with its input data
                            and also sent to the user. Users can also query the status of their job with the id number assigned to their
                            problem instance.
                        </p>
                    </div>
                </div>
                <p style="color: black"> Have a look at the following presentations for further details: </p>
                <ul>
                    <li> <a href="guide/MCDM2017_BanuLokman_LV.pdf">A web-based solution platform for Multi-objective integer programs, MCDM Conference, 2017</a> </li>
                    <li> <a href="guide/INFORMS2017-3.pdf">A Web Application for Solving Multi-objective Integer Programming Problems, Informs Annual Meeting, 2017</a> </li>
                </ul>
            </div>
        </div>

    </body>

