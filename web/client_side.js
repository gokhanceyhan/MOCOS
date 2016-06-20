/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var req;

function initRequest() {
    var isIE;
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function solve_model()
{
    // display status info as "Processing"
    document.getElementById("Status").value = "Processing";

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
    if (req.readyState == 4 && req.status == 200)
    {
        // change the status bar into "Complete" which is in the response to solve request
        document.getElementById("Status").value = req.responseText;
    }
}


function update_List() {

    var dropdown1 = document.getElementById("InputType");
    var dropdown1_value = dropdown1.options[dropdown1.selectedIndex].value;
    var dropdown2 = document.getElementById("ProblemType");
    var dropdown2_value = dropdown2.options[dropdown2.selectedIndex].value;

    if (dropdown1_value === 'Model') {
        dropdown2.selectedIndex=0; // set the second dropdown list to default
        document.getElementById("ProblemType").style.display = "none";
        document.getElementById("ProblemParams").style.display = "none";
    }
    if (dropdown1_value === 'Data')
    {
        document.getElementById("ProblemType").style.display = "block";
        //document.getElementById("ProblemParams").style.display = "block";
        
        if (dropdown2_value === 'Knapsack') {
            document.getElementById("ProblemParams").style.display = "block";
            document.getElementById("KnapsackParams").style.display = "block";
            document.getElementById("AssignmentParams").style.display = "none";
        }
        if (dropdown2_value === 'Assignment') {
            document.getElementById("ProblemParams").style.display = "block";
            document.getElementById("KnapsackParams").style.display = "none";
            document.getElementById("AssignmentParams").style.display = "block";
        }
    }

}
