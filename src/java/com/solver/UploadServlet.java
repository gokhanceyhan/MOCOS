package com.solver;

import com.solver.dataTypes.InputData;
import com.solver.dataTypes.InputType;
import com.solver.dataTypes.JobStatus;
import com.solver.dataTypes.ProblemType;
import com.solver.database.ConnectionManager;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
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

        if (valid) {
            try {
                insertJobToDataBase();
            } catch (SQLException | ClassNotFoundException | NamingException ex) {
                Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            sendSucessResponse(response);
        } else {
            sendFailResponse(response);
        }

    }
    
        private void insertJobToDataBase() throws SQLException, ClassNotFoundException, NamingException, IOException {

        // create connection
        java.sql.Connection con = ConnectionManager.setUpConnection();

        // prepare initial insert statement
        String INSERT_SQL = "INSERT INTO JOBQUEUE (jobcreationtime, issuer, processor, jobinput, jobparam,"
                + " jobstatus, completiontime, joboutput, processtime)"
                + " VALUES()";

        PreparedStatement statement = con.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS);
        statement.setTimestamp(1, new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
        statement.setString(2, usermail);
        statement.setString(3, "nMOCO-S");
        statement.setString(6, JobStatus.TO_DO.toString());

        // execute the statement
        int affectedRows = statement.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Creating job failed, no rows affected.");
        }

        // fetch the job id assigned
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                jobId = generatedKeys.getLong(1);
            } else {
                throw new SQLException("Creating job failed, no ID obtained.");
            }
        }

        // update the record
        String jobPath = generateJobPath();
        setupDirectory(jobPath);
        String jobParamFilePath = generateParameterFile(jobPath);
        String jobInputFilePath = generateProblemFile(jobPath);
        

        // safely close the connection
        statement.close();
        con.commit();
        con.close();
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

    private String generateJobPath() {
        return usermail + "/" + jobId + "/";
    }

    private void setupDirectory(String path) {
        String uploadPath = contextPath + "Jobs/" + path;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
    }

    private String generateParameterFile(String path) throws IOException {

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
        return uploadPath;
    }

    private String generateProblemFile(String path) {
        String uploadPath = contextPath + path;
        if (inputData.getInputType().equals(InputType.DATAFILE)) {
            uploadPath += DATA_FILE_NAME;
        } else {
            uploadPath += MODEL_FILE_NAME;
        }
        return uploadPath;
    }

    private boolean canInputFileBePublic(HttpServletRequest request) {
        return request.getParameter("filePermission").equalsIgnoreCase("yes");
    }

    private void sendSucessResponse(HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Upload Info</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1> Upload result: </h1>");
        out.println("<p>" + validationResult + "</p>");
        out.println("<p><strong>Job Id:</strong> " + jobId + " "
                + "(Keep this number to be able to query the status of your job!)</p>");
        out.println("<p>An email will be sent to the mail address <strong>" + usermail
                + "</strong> as soon as the job is completed.</p>");
        out.println("<p><a href='jsp/nMOCO-S/nMOCO-S_Home.jsp'> Return to nMOCO-S home page.</a></p>");
        out.println("<p><a href='jsp/nMOCO-S/nMOCO-S_JobQueue.jsp'> See the server queue and the status of your job.</a></p>");
        out.println("</body>");
        out.println("</html>");
        out.close();
        validationResult = "";
    }

    private void sendFailResponse(HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Upload Info</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1> Upload result: </h1>");
        out.println("<p>" + validationResult + "</p>");
        out.println("<p><a href='jsp/nMOCO-S/nMOCO-S_InputPage.jsp'> Return to nMOCO-S input page.</a></p>");
        out.println("</body>");
        out.println("</html>");
        out.close();
        validationResult = "";
    }
}
