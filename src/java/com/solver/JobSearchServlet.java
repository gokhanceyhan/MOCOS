/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver;

import com.solver.dataTypes.MocoJob;
import com.solver.database.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gokhanceyhan
 */
public class JobSearchServlet extends HttpServlet {

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
            out.println("<title>Servlet JobSearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobSearchServlet at " + request.getContextPath() + "</h1>");
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

        try {
            // create connection
            java.sql.Connection connection = ConnectionManager.setUpConnection();

            // get search parameters
            String usermail = request.getParameter("email");
            String jobId = request.getParameter("JobID");

            String SELECT_SQL = "SELECT * FROM MOCO.JOBQUEUE WHERE ISSUER = "
                    + "'" + usermail + "'" + " and " + "JOBDID = " + jobId;

            PreparedStatement statement = connection.prepareStatement(SELECT_SQL);
            ResultSet resultSet = statement.executeQuery();

            List<MocoJob> jobs = new ArrayList<>();

            while (resultSet.next()) {
                MocoJob job = new MocoJob();
                job.setJobId(resultSet.getLong("JOBID"));
                job.setJobCreationTime(resultSet.getTimestamp("JOBCREATIONTIME"));
                job.setIssuer(resultSet.getString("ISSUER"));
                job.setProcessor(resultSet.getString("PROCESSOR"));
                job.setJobInput(resultSet.getString("JOBINPUT"));
                job.setJobParam(resultSet.getString("JOBPARAM"));
                job.setJobStatus(resultSet.getString("JOBSTATUS"));
                job.setCompletionTime(resultSet.getTimestamp("COMPLETIONTIME"));
                job.setJobOutput(resultSet.getString("JOBOUTPUT"));
                job.setProcessTime(resultSet.getDouble("PROCESSTIME"));
                jobs.add(job);
            }

            request.setAttribute("jobs", jobs); // Will be available as ${jobs} in JSP
            String contextPath = request.getContextPath() + "/";
            request.getRequestDispatcher(contextPath + "nMOCO-S_JobQueue.jsp").forward(request, response);

        } catch (SQLException | ClassNotFoundException | NamingException ex) {
            Logger.getLogger(JobSearchServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Returns the details of the job submitted by the given user.";
    }// </editor-fold>

}
