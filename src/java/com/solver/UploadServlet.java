/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
//import java.nio.file.Files;
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
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Upload Info</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        String uploadPath = "C:\\Users\\gokhan\\Dropbox\\Ph.D\\Solver_on_Web\\MOIP\\web\\myFiles";
        File uploadDir = new File(uploadPath);
        /*if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }*/
        
        // delete all the old files
        File file= new File(uploadDir, "model.lp");
        if (file.exists()) {
            file.delete();
        }
        
        file= new File(uploadDir, "data.txt");
        if (file.exists()) {
            file.delete();
        }
        
        file= new File(uploadDir, "MainFile.txt");
        if (file.exists()) {
            file.delete();
        }
        
        file= new File(uploadDir, "Output_nd_points.txt");
        if (file.exists()) {
            file.delete();
        }
        
        try {
            // getting the form parameters
            String numofObj=request.getParameter("numofObj");
            String InputType=request.getParameter("InputType");
            String ProblemType=request.getParameter("ProblemType");
            String numofKnapsacks=request.getParameter("numofKnapsacks");
            String numofItems=request.getParameter("numofItems");
            String numofJobs=request.getParameter("numofJobs");
            
            // declare the input file (model.lp or data.txt)
            File InputFile= new File(uploadDir, "model.lp");
            
            
            // create the "MainFile" and write the parameter values in it
            File MainFile = new File(uploadDir, "MainFile.txt");
            
            PrintWriter out_MainFile = new PrintWriter(new FileWriter(MainFile));
            
            out_MainFile.println(numofObj);            
            switch(InputType)
            {
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
                    InputFile.delete();
                    InputFile = new File(uploadDir, "data.txt");
                    switch(ProblemType)
                    {
                        case "Knapsack":
                            out_MainFile.println("KP");
                            out_MainFile.println(numofKnapsacks);
                            out_MainFile.println(numofItems);
                            out_MainFile.println("0");
                            out_MainFile.println("S");
                            //InputFile = new File(uploadDir, "data.txt");
                            out_MainFile.println("data.txt");
                            out_MainFile.println("1");
                            break;
                        case "Assignment":
                            out_MainFile.println("AP");
                            out_MainFile.println("0");
                            out_MainFile.println("0");
                            out_MainFile.println(numofJobs);
                            out_MainFile.println("S");
                            //InputFile = new File(uploadDir, "data.txt");
                            out_MainFile.println("data.txt");
                            out_MainFile.println("1");
                            break;
                    }
                    break;
            }
            out_MainFile.close();           
               
            // copying the input file to the server
            Part uploadFile = request.getPart("uploadFile"); // Retrieves <input type="file" name="uploadFile">
            //String fileName = uploadFile.getSubmittedFileName();
            
            InputStream uploadFileContent = uploadFile.getInputStream();

            try (OutputStream out_InputFile = new FileOutputStream(InputFile)) {
                byte[] buf = new byte[1024];
                int len;
                while ((len = uploadFileContent.read(buf)) > 0) {
                    out_InputFile.write(buf, 0, len);
                }
                out_InputFile.close();
                uploadFileContent.close();
                uploadFile.delete();
                
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    
                    out.println("<!DOCTYPE html>");
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Servlet Upload Info</title>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1> Upload Successfull! </h1>");
                    out.print("<p> All parameter values are successfully loaded! ");
                    out.print("Return to homepage and click 'Generate All Nondominated Points'. </p>");
                    out.println("<p><a href='.'> Return to home page </a></p>");
                    out.println("</body>");
                    out.println("</html>");
                    out.close();
                }

            }
            

        } catch (IOException | ServletException ex) {

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
    }// </editor-fold>

}
