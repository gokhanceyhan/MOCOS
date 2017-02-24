<%-- 
    Document   : index
    Created on : July 6, 2015, 11:49:32 AM
    Author     : gokhan
--%>

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

        <title>MOCO-S</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Custom styles for this template -->
        <link href="css/carousel.css" rel="stylesheet">
    </head>
    <!-- NAVBAR
    ================================================== -->
    <body>
        <div class="navbar-wrapper">
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
                            <a class="navbar-brand" href="index.jsp">
                                MOCO-S
                            </a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="jsp/about.jsp">About</a></li>
                                <li><a href="jsp/contact.jsp">Contact</a></li>
                                <li><a href="jsp/libMOCO-S/libMOCO-S.jsp">Library</a></li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="jsp/nMOCO-S/nMOCO-S_Home.jsp">nMOCO-S</a></li>
                                        <li><a href="#">rMOCO-S</a></li>
                                        <li><a href="#">iMOCO-S</a></li>

                                        <!--li role="separator" class="divider"></li>
                                        <li class="dropdown-header">Nav header</li>
                                        <li><a href="#">Separated link</a></li>
                                        <li><a href="#">One more separated link</a></li-->
                                    </ul>
                                </li>
                                <li><a href="jsp/guide/guide.jsp">Guide</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>
        </div>

        <!-- Carousel
        ================================================== -->
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <img class="img-rounded" src="images/image11.PNG" alt="logo" width="150" height="150">
                            <h1 style="color: darkslateblue;">onlinemoco.web</h1>
                            <p>The first multi-objective combinatorial optimization solver on the web.</p>

                        </div>
                    </div>
                </div>  
                <div class="item">
                    <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>nMOCO-S</h1>
                            <p>All Nondominated points by Multi-Objective Combinatorial Optimization Solver</p>
                            <p>Generate efficient solutions of your multi-objective combinatorial problem. Upload your file, compute on the cloud, download results. </p>
                            <p><a class="btn btn-lg btn-primary" href="jsp/nMOCO-S/nMOCO-S_Home.jsp" role="button">Try it!</a></p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>rMOCO-S</h1>
                            <p>Representative nondominated points by Multi-objective Combinatorial Optimization Solver</p>
                            <p>Represent the objective space of your problem with a few points in an efficient manner.</p>          
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more.</a></p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>iMOCO-S</h1>
                            <p>Interactive Multi-objective Combinatorial Optimization Solver</p>
                            <p>Set parameter values interactively, display results, monitor your solutions.</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more.</a></p>
                        </div>
                    </div>
                </div>    
                <div class="item">
                    <img class="fourth-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>libMOCO-S</h1>
                            <p>Library for Multi-objective Combinatorial Optimization Solver</p>
                            <p>Hundreds of instances in an easy format.</p>
                            <p>Do you have a MOCO solver? Test it on our instances, compare with nMOCO-S.</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse library.</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div><!-- /.carousel -->


        <!-- Marketing messaging and featurettes
        ================================================== -->
        <!-- Wrap the rest of the page in another container to center all the content. -->

        <div class="container marketing">

            <!-- Three columns of text below the carousel -->
            <div class="row">
                <div class="col-lg-4">
                    <img class="img-circle" src="images/muratkoksalan.jpg" alt="muratkoksalan" width="140" height="140">
                    <h2>Murat Köksalan</h2>
                    <p><a class="btn btn-default" href="http://users.metu.edu.tr/koksalan/" target="_blank" role="button">View &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img class="img-circle" src="images/banulokman.png" alt="banulokman" width="140" height="140">
                    <h2>Banu Lokman</h2>
                    <p><a class="btn btn-default" href="http://www.banulokman.com" target="_blank" role="button">View &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img class="img-circle" src="images/gokhanceyhan.jpg" alt="gokhanceyhan" width="140" height="140">
                    <h2>Gökhan Ceyhan</h2>
                    <p><a class="btn btn-default" href="http://blog.metu.edu.tr/e162742/" target="_blank" role="button">View &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
            </div><!-- /.row -->


            <!-- START THE FEATURETTES -->

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">nMOCO-S. <span class="text-muted">Find all nondominated points of your MOCO problem.</span></h2>
                    <p class="lead"> See how much the efficient solutions can achieve at each criterion.  </p>
                </div>
                <div class="col-md-5">
                    <img class="featurette-image img-responsive center-block" src="images/image11.PNG" alt="nondominatedPoints">
                </div>  
            </div>

            <hr class="featurette-divider">

            <div class="row featurette">
                <div class="col-md-7 col-md-push-5">
                    <h2 class="featurette-heading">libMOCO-S. <span class="text-muted">Explore our MOCO library.</span></h2>
                    <p class="lead">It is the place where you can find test instances and the corresponding nondominated point sets for different MOCO problems like knapsack, assignment, shortest path etc...</p>             
                </div>
                <div class="col-md-5 col-md-pull-7">
                    <img class="featurette-image img-responsive center-block" src="images/lib-logo-2.png" alt="MOKP">
                </div>
            </div>

            <hr class="featurette-divider">

            <!--div class="row featurette">
                <div class="col-md-7">
                    <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                    <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus commodo.</p>
                </div>
                <div class="col-md-5">
                    <img class="featurette-image img-responsive center-block" data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                </div>
            </div-->

            <hr class="featurette-divider">

            <!-- /END THE FEATURETTES -->


            <!-- FOOTER -->
            <footer>
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>Supported by The Scientific and Technological Research Council of Turkey &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
            </footer>

        </div><!-- /.container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="../../dist/js/bootstrap.min.js"></script>
        <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
        <script src="../../assets/js/vendor/holder.min.js"></script>
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    </body>
</html>

