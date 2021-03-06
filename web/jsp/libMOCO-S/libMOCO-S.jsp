<%-- 
    Document   : libMOCOS
    Created on : Nov 15, 2016, 1:41:49 PM
    Author     : gokhanceyhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%Class.forName("org.apache.derby.jdbc.ClientDriver"); %>

<!DOCTYPE html>
<html>
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

        <title>libMOCO-S</title>

        <!-- Bootstrap core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="../../css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../../css/libMOCO-S.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <!--script src=""></script-->

        <!-- Database Connection-->
        <%
            Connection connection = DriverManager.getConnection(
                    "jdbc:derby://localhost:1527/mocoDB", "mocoserver", "mocodb2016");
            Statement statement;
            ResultSet resultset;
        %>

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
                            <li class="active"><a href="libMOCO-S.jsp">Library</a></li>
                            <li><a href="../nMOCO-S/nMOCO-S_Home.jsp">Solvers</a></li> 
                            <li><a href="../guide/guide.jsp">Guide</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>
            <div class="jumbotron"> 
                <img class="img-rounded center-block" src="../../images/lib-logo-2.png" alt="logo" width="200" height="100">
                <h2 class="bg-primary text-center" > Library for Multi Objective Combinatorial Optimization</h2>
            </div>

            <div id="page-wrapper">

                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading" >     
                                <a href="../guide/guide.jsp#MOKP">[Model & Data Format]</a>
                                <h2 class="panel-title">
                                    <a data-toggle="collapse" href="#KnapsackTable">Knapsack Problem <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
                                </h2>
                                
                            </div>
                            <!-- /.panel-heading -->
                            <div id="KnapsackTable" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <%statement = connection.createStatement();
                                            resultset
                                                    = statement.executeQuery("select * from INS_KNAPSACK");
                                        %>
                                        <thead>
                                            <tr>
                                                <th>Instance Id</th>
                                                <th>Number of Objectives</th>
                                                <th>Number of Knapsacks </th>
                                                <th>Number of Items</th>
                                                <th>Number of Nondominated Points</th>
                                                <th>Input File</th>
                                                <th>Output File</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <% while (resultset.next()) {%>
                                            <tr>    
                                                <td> <%= resultset.getString(1)%></td>
                                                <td> <%= resultset.getString(2)%></td>
                                                <td> <%= resultset.getString(3)%></td>
                                                <td> <%= resultset.getString(4)%></td>
                                                <td> <%= resultset.getString(5)%></td>
                                                <td> <a href=../../libraryFiles/Knapsack/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(4)%>/<%= resultset.getString(6)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                                <td> <a href=../../libraryFiles/Knapsack/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(4)%>/<%= resultset.getString(7)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!--/.panel panel-collapse-->

                            <div class="panel-heading">   
                                <a href="../guide/guide.jsp#MOAP">[Model & Data Format]</a>
                                <h2 class="panel-title">
                                    <a data-toggle="collapse" href="#AssignmentTable">Assignment Problem <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
                                </h2>
                            </div>
                            <!-- /.panel-heading -->
                            <div id="AssignmentTable" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <%statement = connection.createStatement();
                                            resultset
                                                    = statement.executeQuery("select * from INS_ASSIGNMENT");
                                        %>
                                        <thead>
                                            <tr>
                                                <th>Instance Id</th>
                                                <th>Number of Objectives</th>
                                                <th>Number of Items</th>
                                                <th>Number of Nondominated Points</th>
                                                <th>Input File</th>
                                                <th>Output File</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <% while (resultset.next()) {%>
                                            <tr>    
                                                <td> <%= resultset.getString(1)%></td>
                                                <td> <%= resultset.getString(2)%></td>
                                                <td> <%= resultset.getString(3)%></td>
                                                <td> <%= resultset.getString(4)%></td>
                                                <td> <a href=../../libraryFiles/Assignment/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(5)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                                <td> <a href=../../libraryFiles/Assignment/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(6)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!--/.panel panel-collapse-->
                            <div class="panel-heading">   
                                <h2 class="panel-title">
                                    <a data-toggle="collapse" href="#SBATable">Subset Based Algorithm (SBA) Runs <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
                                </h2>
                            </div>
                            <!-- /.panel-heading -->
                            <div id="SBATable" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <%statement = connection.createStatement();
                                            resultset = statement.executeQuery("select * from INS_SBA");
                                        %>
                                        <thead>
                                            <tr>
                                                <th>Instance Id</th>
                                                <th>Problem</th>
                                                <th>Number of Objectives</th>
                                                <th>Problem Size Info</th>
                                                <th>Number of Points</th>
                                                <th>Coverage Gap</th>
                                                <th>Input File</th>
                                                <th>Output File</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <% while (resultset.next()) {%>
                                            <tr>    
                                                <td> <%= resultset.getString(1)%></td>
                                                <td> <%= resultset.getString(2)%></td>
                                                <td> <%= resultset.getString(3)%></td>
                                                <td> <%= resultset.getString(4)%></td>
                                                <td> <%= resultset.getString(5)%></td>
                                                <td> <%= resultset.getString(6)%></td>
                                                <td> <a href=../../libraryFiles/SBA/<%= resultset.getString(7)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                                <td> <a href=../../libraryFiles/SBA/<%= resultset.getString(8)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!--/.panel panel-collapse-->
                            <!--/.panel panel-collapse-->
                            <div class="panel-heading">   
                                <h2 class="panel-title">
                                    <a data-toggle="collapse" href="#TDATable">Territory Defining Algorithm (TDA) Runs <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
                                </h2>
                            </div>
                            <!-- /.panel-heading -->
                            <div id="TDATable" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <%statement = connection.createStatement();
                                            resultset = statement.executeQuery("select * from INS_TDA");
                                        %>
                                        <thead>
                                            <tr>
                                                <th>Instance Id</th>
                                                <th>Problem</th>
                                                <th>Number of Objectives</th>
                                                <th>Problem Size Info</th>
                                                <th>Coverage Gap Target</th>
                                                <th>Number of Points</th>
                                                <th>Input File</th>
                                                <th>Output File</th>
                                            </tr>
                                        </thead>
                                        <tbody> 
                                            <% while (resultset.next()) {%>
                                            <tr>    
                                                <td> <%= resultset.getString(1)%></td>
                                                <td> <%= resultset.getString(2)%></td>
                                                <td> <%= resultset.getString(3)%></td>
                                                <td> <%= resultset.getString(4)%></td>
                                                <td> <%= resultset.getString(5)%></td>
                                                <td> <%= resultset.getString(6)%></td>
                                                <td> <a href=../../libraryFiles/TDA/<%= resultset.getString(7)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                                <td> <a href=../../libraryFiles/TDA/<%= resultset.getString(8)%> download role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
                                            </tr>
                                            <% }%>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!--/.panel panel-collapse-->                            
                        </div>
                        <!--/.panel panel-default-->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!--/.row-->
            </div>
            <!--/.page-wrapper-->  
        </div>
    </body>
</html>
