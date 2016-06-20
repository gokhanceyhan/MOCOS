<%-- 
    Document   : results
    Created on : Jul 6, 2015, 3:49:01 PM
    Author     : gokhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.util.*, java.io.*, javax.naming.*" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results Page</title>
    </head>
    <body>
        <h1> OUTPUT </h1>
        
        <fieldset>      
        <p> Number of nondominated points: <input type="text" id= "numofPoints" value="${numofP}" /> </p>
        <p> Number of calls to Cplex: <input type="text" id= "numofModels" value="${numofM}" /> </p>
        <p> Total CPU time: <input type="text" id= "cpu" value="${cpu}" /> </p>
        
        <a target="_blank" href="./myFiles/Output_nd_points.txt" ><u>Go to the results file</u></a> 
        </fieldset>
        
        <p><a href='.'> Return to home page </a></p>
    
    </body>
</html>
