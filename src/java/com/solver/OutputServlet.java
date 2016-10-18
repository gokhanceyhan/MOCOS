/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gokhan
 */
public class OutputServlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OutputServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OutputServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            out.close();
        }
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

        try {

            List<String> results = new ArrayList<>();
            File OutputFile = new File("/Users/gokhanceyhan/Dropbox/akademik/Ph.D/Solver_on_Web/MOIP/web/myFiles", "Output_nd_points.txt");
            
            try (Scanner fileScanner = new Scanner(OutputFile)) {
                while (fileScanner.hasNext()) {
                    results.add(fileScanner.next());
                }
            }
  

            request.setAttribute("numofP", results.get(0));
            request.setAttribute("numofM", results.get(1));
            request.setAttribute("cpu", results.get(2));
            
            results.clear();            

            RequestDispatcher dispatcher = request.getRequestDispatcher("eMOCOS_SolvePage.jsp");
            dispatcher.forward(request, response);

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
