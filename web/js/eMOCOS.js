/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var req;

function initRequest() {
    var isIE;
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') !== -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function solveModel()
{
    // display status info as "Processing"
    document.getElementById("eMOCOS_log").innerHTML = "Solving...";

    // send request to servlet
    var url = "SolveServlet";
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = Process;
    req.send(null);
}

function get_results()
{

}

function Process()
{
    if (req.readyState === 4 && req.status === 200)
    {
        // change the status bar into "Complete" which is in the response to solve request
        document.getElementById("eMOCOS_log").innerHTML = req.responseText;
        document.getElementById("eMOCOS_getResultsButton").disabled = false;
        
    }
}


function updateInputParamsLists() {

    var dropdown1 = document.getElementById("eMOCOS_InputType");
    var dropdown1_value = dropdown1.options[dropdown1.selectedIndex].value;
    var dropdown2 = document.getElementById("eMOCOS_ProblemType");
    var dropdown2_value = dropdown2.options[dropdown2.selectedIndex].value;

    if (dropdown1_value === 'Model') {
        dropdown2.selectedIndex = 0; // set the second dropdown list to default
        document.getElementById("eMOCOS_ProblemType").style.display = "none";
        document.getElementById("eMOCOS_ProblemParams").style.display = "none";
    }
    if (dropdown1_value === 'Data')
    {
        document.getElementById("eMOCOS_ProblemType").style.display = "block";

        if (dropdown2_value === 'Knapsack') {
            document.getElementById("eMOCOS_ProblemParams").style.display = "block";
            document.getElementById("eMOCOS_KnapsackParams1").style.display = "block";
            document.getElementById("eMOCOS_KnapsackParams2").style.display = "block";
            document.getElementById("eMOCOS_AssignmentParams1").style.display = "none";
        }
        if (dropdown2_value === 'Assignment') {
            document.getElementById("eMOCOS_ProblemParams").style.display = "block";
            document.getElementById("eMOCOS_KnapsackParams1").style.display = "none";
            document.getElementById("eMOCOS_KnapsackParams2").style.display = "none";
            document.getElementById("eMOCOS_AssignmentParams1").style.display = "block";
        }
    }

}
