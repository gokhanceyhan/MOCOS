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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!--%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/libMOCOS.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <!--script src=""></script-->

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

                    <a class="navbar-brand" href="index.jsp">MOCO-S</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="about.jsp">About</a></li>
                        <li><a href="contact">Contact</a></li>
                        <li><a href="libMOCOS.jsp">Library</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Applications <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="eMOCOS_InputPage.jsp">nMOCO-S</a></li>
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
            <img class="img-rounded center-block" src="lib-logo-2.png" alt="logo" width="200" height="100">
            <h2 class="bg-primary text-center" > Library for Multi Objective Combinatorial Optimization</h2>
        </div>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Instances</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Knapsack Problem
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <%
                                    Connection connection = DriverManager.getConnection(
                                            "jdbc:derby://localhost:1527/mocoDB", "moco", "mocodb2016");

                                    Statement statement = connection.createStatement();
                                    ResultSet resultset
                                            = statement.executeQuery("select * from Ins_Knapsack");
                                %>
                                <thead>
                                    <tr>
                                        <th>Instance Id</th>
                                        <th>Number of Objectives</th>
                                        <th>Number of Knapsacks </th>
                                        <th>Number of Items</th>
                                        <th>Number of Nondominated Points</th>
                                        <th>File</th>
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
                                        <td> <a href="KP_3obj_25items_input.txt" role="button"><span class="glyphicon glyphicon-save-file"></span></a></td>
                                    </tr>
                                    <% }%>


                                </tbody>
                            </table>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
    </body>
</html>
