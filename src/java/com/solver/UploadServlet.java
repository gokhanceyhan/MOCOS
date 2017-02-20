package com.solver;

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

        // declare the workspace directory 
        String uploadPath = request.getContextPath() + "/nMOCO-S_Files/";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        cleanDirectory(uploadDir);
        setupDirectory(uploadDir, request);

        // create and validate uploaded input file
        boolean isInputvalid = true;
        String uploadResult = createInputFile(request, uploadDir);
        if (!uploadResult.equals("")) {
            isInputvalid = false;
        }

        if (isInputvalid) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/jsp/nMOCO-S/nMOCO-S_SolvePage.jsp"));

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

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void cleanDirectory(File uploadDir) {

        // delete all the old files
        File file = new File(uploadDir, "model.lp");
        if (file.exists()) {
            file.delete();
        }

        file = new File(uploadDir, "data.txt");
        if (file.exists()) {
            file.delete();
        }

        file = new File(uploadDir, "MainFile.txt");
        if (file.exists()) {
            file.delete();
        }

        file = new File(uploadDir, "Output_nd_points.txt");
        if (file.exists()) {
            file.delete();
        }
    }

    private void setupDirectory(File uploadDir, HttpServletRequest request) throws IOException {

        // getting the form parameters
        String numofObj = request.getParameter("numOfObj");
        String InputType = request.getParameter("InputType");
        String ProblemType = request.getParameter("ProblemType");
        String numofKnapsacks = request.getParameter("numofKnapsacks");
        String numofItems = request.getParameter("numofItems");
        String numofJobs = request.getParameter("numofJobs");

        // create the "MainFile" and write the parameter values in it
        File MainFile = new File(uploadDir, "MainFile.txt");

        PrintWriter out_MainFile = new PrintWriter(new FileWriter(MainFile));
        out_MainFile.println(numofObj);
        switch (InputType) {
            case "Model":
                out_MainFile.println("M");
                out_MainFile.println("NULL");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println("0");
                out_MainFile.println("S");
                out_MainFile.println("model.lp");
                out_MainFile.println("1");
                break;
            case "Data":
                out_MainFile.println("D");
                switch (ProblemType) {
                    case "Knapsack":
                        out_MainFile.println("KP");
                        out_MainFile.println(numofKnapsacks);
                        out_MainFile.println(numofItems);
                        out_MainFile.println("0");
                        out_MainFile.println("S");
                        out_MainFile.println("data.txt");
                        out_MainFile.println("1");
                        break;
                    case "Assignment":
                        out_MainFile.println("AP");
                        out_MainFile.println("0");
                        out_MainFile.println("0");
                        out_MainFile.println(numofJobs);
                        out_MainFile.println("S");
                        out_MainFile.println("data.txt");
                        out_MainFile.println("1");
                        break;
                }
                break;
        }
        
        out_MainFile.close();

    }

    private String createInputFile(HttpServletRequest request, File uploadDir) throws IOException, ServletException {
        // copying the input file to the server
        Part uploadFile = request.getPart("uploadFile"); // Retrieves <input type="file" name="uploadFile">

        // copy the uploaded file to the input file (model.lp or data.txt)
        try (InputStream uploadFileContent = uploadFile.getInputStream()) {

            File InputFile;
            if (request.getParameter("InputType").equalsIgnoreCase("Model")) {
                InputFile = new File(uploadDir, "model.lp");
            } else {
                InputFile = new File(uploadDir, "data.txt");
            }

            try (OutputStream out_InputFile = new FileOutputStream(InputFile)) {
                byte[] buf = new byte[1024];
                int len;
                while ((len = uploadFileContent.read(buf)) > 0) {
                    out_InputFile.write(buf, 0, len);
                }
            }
        }
        uploadFile.delete();

        return validateInputFile();
    }

    private String validateInputFile() {
        String result = "";

        return result;
    }

}
