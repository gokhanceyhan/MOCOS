
var req;

$(function () {
    $("input,textarea").not("[type=submit]").jqBootstrapValidation();
});


$(document).ready(function () {

});

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
    document.getElementById("nMOCOS_log").innerHTML = "Solving...";

    // send request to servlet
    var url = "../../SolveServlet";
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
        document.getElementById("nMOCOS_log").innerHTML = req.responseText;
        document.getElementById("nMOCOS_getResultsButton").disabled = false;

    }
}

function updateInputParamsLists() {

    var dropdown1 = document.getElementById("nMOCOS_InputType");
    var dropdown1_value = dropdown1.options[dropdown1.selectedIndex].value;
    var dropdown2 = document.getElementById("nMOCOS_ProblemType");
    var dropdown2_value = dropdown2.options[dropdown2.selectedIndex].value;

    if (dropdown1_value === 'Model') {
        dropdown2.selectedIndex = 0; // set the second dropdown list to default
        document.getElementById("nMOCOS_InputParams3").style.display = "none";
        document.getElementById("nMOCOS_ProblemParams").style.display = "none";
    }
    if (dropdown1_value === 'Data')
    {
        document.getElementById("nMOCOS_InputParams3").style.display = "block";

        if (dropdown2_value === 'Knapsack') {
            document.getElementById("nMOCOS_ProblemParams").style.display = "block";
            document.getElementById("nMOCOS_KnapsackParams1").style.display = "block";
            document.getElementById("nMOCOS_KnapsackParams2").style.display = "block";
            document.getElementById("nMOCOS_AssignmentParams1").style.display = "none";
        }
        if (dropdown2_value === 'Assignment') {
            document.getElementById("nMOCOS_ProblemParams").style.display = "block";
            document.getElementById("nMOCOS_KnapsackParams1").style.display = "none";
            document.getElementById("nMOCOS_KnapsackParams2").style.display = "none";
            document.getElementById("nMOCOS_AssignmentParams1").style.display = "block";
        }
    }

}




