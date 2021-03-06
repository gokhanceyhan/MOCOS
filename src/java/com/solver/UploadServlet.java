package com.solver;

import com.solver.dataTypes.Constants;
import com.solver.dataTypes.InputData;
import com.solver.dataTypes.InputType;
import com.solver.dataTypes.JobStatus;
import com.solver.dataTypes.ProblemType;
import com.solver.dataTypes.SolverType;
import com.solver.database.ConnectionManager;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
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

        contextPath = request.getContextPath() + "/";

        // get uploaded form parameters
        getInputParameters(request);
        getProblemFile(request);
        getUserInfo(request);

        // validate the input and the user limit
        boolean valid = validateInputFile() & validateUserJobLimit();

        if (valid) {
            try {
                insertJobToDatabase();
            } catch (SQLException | ClassNotFoundException | NamingException ex) {
                Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            sendSucessResponse(response);
        } else {
            sendFailResponse(response);
        }

    }

    private void insertJobToDatabase() throws SQLException, ClassNotFoundException, NamingException, IOException {

        // create connection
        java.sql.Connection con = ConnectionManager.setUpConnection();

        // prepare initial insert statement
        String INSERT_SQL = "INSERT INTO JOBQUEUE (jobcreationtime, issuer, processor, jobinput, jobparam,"
                + " jobstatus, completiontime, joboutput, processtime)"
                + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = con.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS);
        statement.setTimestamp(1, new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
        statement.setString(2, usermail);
        statement.setString(3, inputData.getSolverType().toString());
        statement.setString(4, "");
        statement.setString(5, "");
        statement.setString(6, JobStatus.TO_DO.toString());
        statement.setTimestamp(7, null);
        statement.setString(8, "");
        statement.setDouble(9, 0.0);

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
        statement.close();

        // update the record
        String uploadPath = setupDirectory();
        generateParameterFile(uploadPath);
        String inputFileName = generateProblemFile(uploadPath);

        String UPDATE_SQL = "UPDATE JOBQUEUE SET JOBINPUT = " + "'" + inputFileName + "'"
                + ", JOBPARAM = " + "'" + Constants.MAIN_FILE_NAME + "'"
                + " WHERE JOBID = " + jobId;

        Statement updateStatement = con.createStatement();
        updateStatement.execute(UPDATE_SQL);
        updateStatement.close();

        // safely close the connection
        con.commit();
        con.close();
    }

    private void getInputParameters(HttpServletRequest request) {

        // getting the form parameters
        inputData = new InputData();
        String solverType = request.getParameter("SolverType");
        if ("nMOCO-S".equalsIgnoreCase(solverType)) {
            inputData.setSolverType(SolverType.nMOCOS);
        } else if ("rMOCO-S_sba".equalsIgnoreCase(solverType)) {
            inputData.setSolverType(SolverType.rMOCOS_sba);
        }
        else
            inputData.setSolverType(SolverType.rMOCOS_tda);
        
        String inputType = request.getParameter("InputType");
        if ("Model".equalsIgnoreCase(inputType)) {
            inputData.setInputType(InputType.MODELFILE);
        } else {
            inputData.setInputType(InputType.DATAFILE);
        }

        String problemType = request.getParameter("ProblemType");
        if ("Knapsack".equalsIgnoreCase(problemType)) {
            inputData.setProblemType(ProblemType.KNAPSACK);
        }
        if ("Assignment".equalsIgnoreCase(problemType)) {
            inputData.setProblemType(ProblemType.ASSIGNMENT);
        }
        
        inputData.setTimeLimit(Double.parseDouble(request.getParameter("TimeLimit")));
        inputData.setPointLimit(Integer.parseInt(request.getParameter("PointLimit")));
        inputData.setDelta(Double.parseDouble(request.getParameter("delta")));
        
        inputData.setNumOfObjectives(Integer.parseInt(request.getParameter("numOfObj")));
        inputData.getKnapsackProblem().setNumOfKnapsacks(Integer.parseInt(request.getParameter("numOfKnapsacks")));
        inputData.getKnapsackProblem().setNumOfItems(Integer.parseInt(request.getParameter("numOfItems")));
        inputData.getAssignmentProblem().setNumOfJobs(Integer.parseInt(request.getParameter("numOfJobs")));

    }

    private void getProblemFile(HttpServletRequest request) throws IOException, ServletException {

        Part uploadFile = request.getPart("uploadFile");
        InputStream uploadFileContent = uploadFile.getInputStream();

        StringBuilder out = new StringBuilder();
        Reader in = new InputStreamReader(uploadFileContent, "UTF-8");
        int bufferSize = 1024;
        char[] buffer = new char[bufferSize];
        for (;;) {
            int rsz = in.read(buffer, 0, buffer.length);
            if (rsz < 0) {
                break;
            }
            out.append(buffer, 0, rsz);
        }
        String inputFile = out.toString();

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

    private String setupDirectory() {
        String uploadPath = Constants.ABSOLUTE_PATH + "jobs";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String userPath = uploadPath + "/" + usermail;
        File userDir = new File(userPath);
        if (!userDir.exists()) {
            userDir.mkdir();
        }

        String jobPath = userPath + "/" + jobId;
        File jobDir = new File(jobPath);
        if (!jobDir.exists()) {
            jobDir.mkdir();
        }

        return jobPath;
    }

    private void generateParameterFile(String uploadPath) throws IOException {

        // create the "MainFile" and write the parameter values in it
        File MainFile = new File(uploadPath, Constants.MAIN_FILE_NAME);

        PrintWriter out_MainFile = new PrintWriter(new FileWriter(MainFile));
        switch (inputData.getSolverType().toString()) {
            case "nMOCOS":
                out_MainFile.println(1);
                break;
            case "rMOCOS_sba":
                out_MainFile.println(2);
                break;
            case "rMOCOS_tda":
                out_MainFile.println(3);
                break;
        }
        
        out_MainFile.println(inputData.getNumOfObjectives());
        out_MainFile.println(inputData.getTimeLimit());
        out_MainFile.println(inputData.getPointLimit());
        out_MainFile.println(inputData.getDelta());
        switch (inputData.getInputType().toString()) {
            case "MODELFILE":
                out_MainFile.println("M");
                out_MainFile.println("NULL");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println(Constants.MODEL_FILE_NAME);
                break;
            case "DATAFILE":
                out_MainFile.println("D");
                switch (inputData.getProblemType().toString()) {
                    case "KNAPSACK":
                        out_MainFile.println("KP");
                        out_MainFile.println(inputData.getKnapsackProblem().getNumOfKnapsacks());
                        out_MainFile.println(inputData.getKnapsackProblem().getNumOfItems());
                        out_MainFile.println("0");
                        out_MainFile.println(Constants.DATA_FILE_NAME);
                        break;
                    case "ASSIGNMENT":
                        out_MainFile.println("AP");
                        out_MainFile.println("0");
                        out_MainFile.println("0");
                        out_MainFile.println(inputData.getAssignmentProblem().getNumOfJobs());
                        out_MainFile.println(Constants.DATA_FILE_NAME);
                        break;
                }
                break;
        }

        out_MainFile.close();
    }

    private String generateProblemFile(String uploadPath) throws IOException {
        String fileName;
        if (inputData.getInputType().equals(InputType.DATAFILE)) {
            fileName = Constants.DATA_FILE_NAME;
            File inputFile = new File(uploadPath, Constants.DATA_FILE_NAME);
            PrintWriter out_InputFile = new PrintWriter(new FileWriter(inputFile));

            switch (inputData.getProblemType().toString()) {
                case "KNAPSACK":
                    out_InputFile.print(inputData.getKnapsackProblem().getInputFile());
                    break;
                case "ASSIGNMENT":
                    out_InputFile.print(inputData.getAssignmentProblem().getInputFile());
                    break;
            }
            out_InputFile.close();

        } else {
            fileName = Constants.MODEL_FILE_NAME;
            File inputFile = new File(uploadPath, Constants.MODEL_FILE_NAME);
            PrintWriter out_InputFile = new PrintWriter(new FileWriter(inputFile));
            out_InputFile.print(inputData.getMathModel().getInputFile());
            out_InputFile.close();
        }

        return fileName;
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
