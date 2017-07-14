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
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jqBootstrapValidation.js"></script>

        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome-4.7.0/css/font-awesome.min.css">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="${pageContext.request.contextPath}/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${pageContext.request.contextPath}/css/nMOCO-S_JobQueue.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <script src="${pageContext.request.contextPath}/js/nMOCO-S_JobQueue.js"></script>

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
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">MOCO-S</a>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/jsp/about.jsp">About</a></li>
                            <li><a href="${pageContext.request.contextPath}/jsp/contact.jsp">Contact</a></li>
                            <li><a href="${pageContext.request.contextPath}/jsp/libMOCO-S/libMOCO-S.jsp">Library</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${pageContext.request.contextPath}/jsp/nMOCO-S/nMOCO-S_Home.jsp">nMOCO-S</a></li>
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

            <form id="searchForm" name="searchForm" method="post" action="${pageContext.request.contextPath}/JobSearchServlet" class="form-nMOCOS" enctype="multipart/form-data" novalidate>

                <div class="row">   

                    <div class="col-md-4">
                        <div class="control-group form-group">
                            <fieldset class="control-group form-group">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input id="user_email" type="email" class="form-control" name="search_email" placeholder="Email" required data-validation-required-message="Please enter your email address.">                                           
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
                                    <input id="queue_id" type="text" class="form-control" name="search_jobId" placeholder="Job ID" required data-validation-required-message="Please enter the job ID number.">
                                </div>
                                <p class="help-block"></p>
                            </fieldset>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <div>
                                <button type="submit" class="btn btn-primary" id="searchBtn" name="search" value="upload">Search</button>
                            </div>
                        </div>
                    </div>

                </div>

            </form>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">                
                                <h2 class="panel-title">Search Results</h2>
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="job_search_results">
                                    <thead>
                                        <tr>
                                            <th>Job Id</th>
                                            <th>Issuer</th>
                                            <th>Job Creation Time</th>
                                            <th>Seq. Number</th>
                                            <th>Est. Waiting Time</th>
                                            <th>Job Status</th>
                                            <th>Job Completion Time</th>
                                            <th>Processing Time (secs)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${jobs}" var="job">
                                            <tr>
                                                <td>${job.jobId}</td>
                                                <td>${job.issuer}</td>
                                                <td>${job.jobCreationTime}</td>
                                                <td>${job.sequenceNumber}</td>
                                                <td>${job.waitingTime}</td>
                                                <td>${job.jobStatus}</td>
                                                <td>${job.completionTime}</td>
                                                <td>${job.processTime}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div> <!-- /container -->

    </body>
</html>


