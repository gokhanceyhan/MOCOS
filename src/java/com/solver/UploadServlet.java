package com.solver;

import com.solver.dataTypes.InputData;
import com.solver.dataTypes.InputType;
import com.solver.dataTypes.ProblemType;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author gokhan
 */
@MultipartConfig
public class UploadServlet extends HttpServlet {

    private final String MAIN_FILE_NAME = "MainFile.txt";
    private final String DATA_FILE_NAME = "data.txt";
    private final String MODEL_FILE_NAME = "model.lp";
    private String contextPath;
    private String usermail;
    private long jobId;
    private InputData inputData;
    private String validationResult = "Validation Status:\n";

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Creates a new job and add it to the mocoDB if appropriate.";
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        contextPath = request.getContextPath();

        // get uploaded form parameters
        getInputParameters(request);
        getProblemFile(request);
        getUserInfo(request);

        // validate the input and the user limit
        boolean valid = validateInputFile() & validateUserJobLimit();
        System.out.println(validationResult);

        // assign the validation result to response object
        //RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/nMOCO-S/nMOCO-S_InputPage.jsp");
        //request.setAttribute("validationResult", "<p>" + validationResult + "</p>");
        if (valid) {
            //generateJobId();
            //setupDirectory("");
            //generateParameterFile("");
            //generateProblemFile("");
            //insertJobToDataBase();  
        }

        // send the response to the requester
        response.setHeader("Content-Type", "text/plain");
        response.getWriter().write(validationResult);
        //response.sendRedirect(response.encodeRedirectURL(contextPath + "/jsp/nMOCO-S/nMOCO-S_InputPage.jsp"));
        //dispatcher.forward(request, response);

    }

    private void getInputParameters(HttpServletRequest request) {

        // getting the form parameters
        inputData = new InputData();
        String inputType = request.getParameter("InputType");
        if ("Model".equalsIgnoreCase(inputType)) {
            inputData.setInputType(InputType.MODELFILE);
        } else {
            inputData.setInputType(InputType.DATAFILE);
        }

        inputData.setNumOfObjectives(Integer.parseInt(request.getParameter("numOfObj")));
        inputData.getKnapsackProblem().setNumOfKnapsacks(Integer.parseInt(request.getParameter("numOfKnapsacks")));
        inputData.getKnapsackProblem().setNumOfItems(Integer.parseInt(request.getParameter("numOfItems")));
        inputData.getAssignmentProblem().setNumOfJobs(Integer.parseInt(request.getParameter("numOfJobs")));

    }

    private void getProblemFile(HttpServletRequest request) throws IOException, ServletException {

        Part uploadFile = request.getPart("uploadFile");

        InputStream uploadFileContent = uploadFile.getInputStream();
        String inputFile = uploadFileContent.toString();

        if (inputData.getInputType().equals(InputType.MODELFILE)) {
            inputData.getMathModel().setInputFile(inputFile);
        } else {
            if (inputData.getProblemType().equals(ProblemType.KNAPSACK)) {
                inputData.getKnapsackProblem().setInputFile(inputFile);
            }
            if (inputData.getProblemType().equals(ProblemType.ASSIGNMENT)) {
                inputData.getAssignmentProblem().setInputFile(inputFile);
            }
        }

        uploadFile.delete();

    }

    private void getUserInfo(HttpServletRequest request) {
        usermail = request.getParameter("email");
    }

    private boolean validateInputFile() {
        validationResult += "Input data is valid!\n";
        return true;
    }

    private boolean validateUserJobLimit() {

        return true;
    }

    private void generateJobId() {

    }

    private void setupDirectory(String path) {
        String uploadPath = contextPath + path;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
    }

    private void generateParameterFile(String path) throws IOException {

        String uploadPath = contextPath + path + MAIN_FILE_NAME;
        // create the "MainFile" and write the parameter values in it
        File MainFile = new File(uploadPath);

        PrintWriter out_MainFile = new PrintWriter(new FileWriter(MainFile));
        out_MainFile.println(inputData.getNumOfObjectives());
        switch (inputData.getInputType().toString()) {
            case "MODELFILE":
                out_MainFile.println("M");
                out_MainFile.println("NULL");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println("S");
                out_MainFile.println(MODEL_FILE_NAME);
                out_MainFile.println("1");
                break;
            case "DATAFILE":
                out_MainFile.println("D");
                switch (inputData.getProblemType().toString()) {
                    case "KNAPSACK":
                        out_MainFile.println("KP");
                        out_MainFile.println(inputData.getKnapsackProblem().getNumOfKnapsacks());
                        out_MainFile.println(inputData.getKnapsackProblem().getNumOfItems());
                        out_MainFile.println("0");
                        out_MainFile.println("S");
                        out_MainFile.println(DATA_FILE_NAME);
                        out_MainFile.println("1");
                        break;
                    case "ASSIGNMENT":
                        out_MainFile.println("AP");
                        out_MainFile.println("0");
                        out_MainFile.println("0");
                        out_MainFile.println(inputData.getAssignmentProblem().getNumOfJobs());
                        out_MainFile.println("S");
                        out_MainFile.println(DATA_FILE_NAME);
                        out_MainFile.println("1");
                        break;
                }
                break;
        }

        out_MainFile.close();
    }

    private void generateProblemFile(String path) {
        String uploadPath = contextPath + path;
        if (inputData.getInputType().equals(InputType.DATAFILE)) {
            uploadPath += DATA_FILE_NAME;
        } else {
            uploadPath += MODEL_FILE_NAME;
        }
    }

    private boolean canInputFileBePublic(HttpServletRequest request) {
        return request.getParameter("filePermission").equalsIgnoreCase("yes");
    }

    private void insertJobToDataBase() {

    }

}
