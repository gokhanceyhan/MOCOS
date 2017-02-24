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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
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

        // create and validate uploaded input file
        boolean isInputvalid = true;

        if (isInputvalid) {
            response.sendRedirect(response.encodeRedirectURL(contextPath + "/jsp/nMOCO-S/nMOCO-S_SolvePage.jsp"));

        } else {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Upload Info</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Upload not successfull! </h1>");
            out.print("<p> Chek your inputs! ");
            out.print("Return to homepage and click 'Solve'. </p>");
            out.println("<p><a href='nMOCO-S_InputPage.jsp'> Return to home page </a></p>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        }

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
        inputData.getKnapsackProblem().setNumOfKnapsacks(Integer.parseInt(request.getParameter("numofKnapsacks")));
        inputData.getKnapsackProblem().setNumOfItems(Integer.parseInt(request.getParameter("numofItems")));
        inputData.getAssignmentProblem().setNumOfJobs(Integer.parseInt(request.getParameter("numofJobs")));

    }

    private void getProblemFile(HttpServletRequest request) throws IOException, ServletException {

        Part uploadFile = request.getPart("uploadFile");

        InputStream uploadFileContent = uploadFile.getInputStream();

        File inputFile;
        if (inputData.getInputType().equals(InputType.MODELFILE)) {
            inputFile = new File("", MODEL_FILE_NAME);
        } else {
            inputFile = new File("", DATA_FILE_NAME);
        }

        OutputStream out_InputFile = new FileOutputStream(inputFile);
        byte[] buf = new byte[1024];
        int len;
        while ((len = uploadFileContent.read(buf)) > 0) {
            out_InputFile.write(buf, 0, len);
        }

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

    private void generateParameterFile(File uploadDir) throws IOException {

        // create the "MainFile" and write the parameter values in it
        File MainFile = new File(uploadDir, MAIN_FILE_NAME);

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

    private void generateProblemFile(File uploadDir) {

    }

    private boolean isInputFilePublic(HttpServletRequest request) {
        return request.getParameter("filePermission").equalsIgnoreCase("yes");
    }

    private void insertJobToDataBase() {

    }

}
