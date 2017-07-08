<%-- 
    Document   : libMOCOS
    Created on : Nov 15, 2016, 1:41:49 PM
    Author     : gokhanceyhan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">

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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../nMOCO-S/nMOCO-S_Home.jsp">nMOCO-S</a></li>
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
            <img class="img-rounded center-block" src="../../images/lib-logo-2.png" alt="logo" width="200" height="100">
            <h2 class="bg-primary text-center" > Library for Multi Objective Combinatorial Optimization</h2>
        </div>
        <div id="page-wrapper">

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">                
                            <h2 class="panel-title"><a data-toggle="collapse" href="#KnapsackTable">Knapsack Problem <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a></h2>
                            <a href="../guide/guide.jsp#MOKP_model">[Model]</a> <a href="../guide/guide.jsp#MOKP_input">[Data Format]</a> <a href="">[Batch Download]</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div id="KnapsackTable" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
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
                                            <td> <a href=file:///D:/library/Knapsack/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(4)%>/<%= resultset.getString(6)%> download target="_blank" role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                            <td> <a href=file:///D:/library/Knapsack/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(4)%>/<%= resultset.getString(7)%> download target="_blank" role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!--/.panel panel-collapse-->

                        <div class="panel-heading">                
                            <h2 class="panel-title"><a data-toggle="collapse" href="#AssignmentTable">Assignment Problem <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a></h2>
                            <a href="../guide/guide.jsp#MOAP_model">[Model]</a> <a href="../guide/guide.jsp#MOAP_input">[Data Format]</a> <a href="">[Batch Download]</a>
                        </div>
                        <!-- /.panel-heading -->
                        <div id="AssignmentTable" class="panel-collapse collapse">
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
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
                                            <td> <a href=file:///D:/library/Assignment/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(5)%> download target="_blank" role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                                  
                                            <td> <a href=file:///D:/library/Assignment/<%= resultset.getString(2)%>/<%= resultset.getString(3)%>/<%= resultset.getString(6)%> download target="_blank" role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>                             
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
    </body>
</html>
