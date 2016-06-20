/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
//import java.io.PrintWriter;
//import java.nio.file.Files;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Scanner;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gokhan
 */
public class SolveServlet extends HttpServlet {

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

        // we need to invoke our algorithm
        try {

            Runtime runtime = Runtime.getRuntime();

            // start the solver
            Process p = runtime.exec("C:\\Users\\gokhan\\Dropbox\\Ph.D\\Solver_on_Web\\MOIP\\web\\myFiles\\MOIP_software.exe", null, new File("C:\\Users\\gokhan\\Dropbox\\Ph.D\\Solver_on_Web\\MOIP\\web\\myFiles"));
            
            InputStream stderr = p.getInputStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line = null;            
            while ( (line = br.readLine()) != null);
                            
            p.waitFor();
            
            // display "Complete" on the page
            response.setHeader("Content-Type", "text/plain");
            response.getWriter().write("Finished");

        } catch (Throwable t) {
            t.printStackTrace();
        } 
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
