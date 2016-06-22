<%-- 
    Document   : newjsp
    Created on : Jun 22, 2016, 8:09:43 PM
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

        <title>eMOCOS</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/userForm.css" rel="stylesheet">

        <!-- Custom javascript files -->
        <script type="text/javascript" src="client_side.js"></script>

    </head>

    <body>

        <div class="container">
            <form class="form-eMOCOS" method="post" action="UploadServlet" enctype="multipart/form-data">

                <legend> Input Parameters: </legend>
                <fieldset class="form-group" id="eMOCOS_InputParams" style="display: block">

                    <fieldset class="form-group" id="eMOCOS_InputParams1">
                        <label for="eMOCOS_InputType">Input Type</label>
                        <select class="form-control" id="eMOCOS_InputType" onchange="eMOCOS_updateInputParamsLists();">
                            <option value="" disabled="disabled" selected="selected">Select File Type</option>
                            <option value="Model">Model File (.lp)</option>
                            <option value="Data" >Data File</option>
                        </select>
                    </fieldset>

                    <fieldset class="form-group" id="eMOCOS_InputParams2">
                        <label for="eMOCOS_ProblemType">Problem Type</label>
                        <select class="form-control" id="eMOCOS_ProblemType" onchange="eMOCOS_updateInputParamsLists();">
                            <option value="" disabled="disabled" selected="selected">Select Problem Type</option>
                            <option value="Knapsack">Knapsack Problem</option>
                            <option value="Assignment">Assignment Problem</option>
                        </select>
                    </fieldset>

                    <fieldset class="form-group" id="eMOCOS_InputParams3">
                        <label for="eMOCOS_numOfObjectives">Number of Objectives</label>
                        <input type="text" class="form-control" id="eMOCOS_numOfObjectives" placeholder="">
                    </fieldset>

                </fieldset>

                <fieldset class="form-group" id="eMOCOS_ProblemParams" style="display: block">
                    <legend> Problem Parameters:</legend>

                    <fieldset class="form-group" id="eMOCOS_KnapsackParams1">
                        <label for="eMOCOS_numOfKnapsacks">Number of Knapsacks</label>
                        <input type="text" class="form-control" id="eMOCOS_numOfKnapsacks" placeholder="">
                    </fieldset>

                    <fieldset class="form-group" id="eMOCOS_KnapsackParams2">
                        <label for="eMOCOS_numOfItems">Number of Items</label>
                        <input type="text" class="form-control" id="eMOCOS_numOfItems" placeholder="">
                    </fieldset>

                    <fieldset class="form-group" id="eMOCOS_AssignmentParams1">
                        <label for="eMOCOS_numOfJobs">Number of Jobs</label>
                        <input type="text" class="form-control" id="eMOCOS_numOfJobs" placeholder="">
                    </fieldset>

                </fieldset>

                <fieldset class="form-group" id="eMOCOS_fileUpload">
                    <label for="eMOCOS_InputFile">File Input</label>
                    <input type="file" class="form-control-file" id="eMOCOS_InputFile">
                </fieldset>

                <button type="submit" class="btn btn-primary">Upload</button>
            </form>

            <button style="margin-left: 24em" type="submit" class="btn btn-primary" onclick="eMOCOS_SolveModel(); ">Solve</button>
            <input type="text" id="Status" value="" />

            <form class="form-eMOCOS" action="OutputServlet" method="POST">
                <button type="submit" class="btn btn-primary">Get Results</button>
            </form>

        </div> <!-- /container -->

    </body>
</html>

