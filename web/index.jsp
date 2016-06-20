<%-- 
    Document   : index
    Created on : July 6, 2015, 11:49:32 AM
    Author     : gokhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html>
    <head>
        <script type="text/javascript" src="client_side.js"></script>
        <title> Multi Objective Integer Programming Solver </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>

        <form method="post" action="UploadServlet" enctype="multipart/form-data">
            <fieldset id="InputParams">
                <legend> Input Parameters:</legend>

                <p><label> Number of objectives: 
                        <input type="text" name="numofObj" value="" /></label></p>

                <p><label> Input Type:
                        <select id="InputType" name="InputType" onchange="update_List();">
                            <option value="" disabled="disabled" selected="selected">Select File Type</option>
                            <option value="Model">Model File</option>
                            <option value="Data" >Data File</option>
                        </select>

                        <p><label> Problem Type:
                                <select id="ProblemType" name="ProblemType" onchange="update_List();">
                                    <option value="" disabled="disabled" selected="selected">Select Problem Type</option>
                                    <option value="Knapsack">Knapsack Problem</option>
                                    <option value="Assignment">Assignment Problem</option>
                                </select></label></p>            
            </fieldset>

            <fieldset id="ProblemParams" style="display: none">
                <legend> Problem Parameters:</legend>
                
                <fieldset id="KnapsackParams">
                    <p><label> Number of Knapsacks:
                            <input type="text" id="numofKnapsacks" name="numofKnapsacks" value="" /></label></p>  
                    <p><label> Number of Items:
                            <input type="text" id="numofItems" name="numofItems" value="" /></label></p> 
                </fieldset>
                
                <fieldset id="AssignmentParams">
                    <p><label> Number of Jobs:
                            <input type="text" id="numofJobs" name="numofJobs" value="" /></label></p> 
                </fieldset>
            </fieldset>

            <fieldset>
                <legend> File Selection:</legend>
                <p><label> Select file to upload: 
                        <input type="file" name="uploadFile" /></label></p>
                <p><input type="submit" value="Upload" /></p>
            </fieldset>
        </form>

        <p><input type="submit" value="Generate All Nondominated Points" onclick="solve_model();" />
            <input type="text" id="Status" value="" />
        </p>

        <form action="OutputServlet" method="POST">
            <input type="submit" value="Get Results" />
        </form>

    </body>

</html>
