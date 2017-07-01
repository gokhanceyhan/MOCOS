package com.solver;

import com.solver.dataTypes.Constants;
import com.solver.dataTypes.JobStatus;
import com.solver.dataTypes.Processors;
import com.solver.database.ConnectionManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gokhan
 */
@MultipartConfig
public class SolveServlet extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("heyy!");

        try {
            // create connection
            java.sql.Connection connection = ConnectionManager.setUpConnection();
            while (true) {
                // query jobqueue table and check if there is a job to do.
                String SELECT_SQL = "SELECT * FROM MOCO.JOBQUEUE WHERE JOBSTATUS = "
                        + "'" + JobStatus.TO_DO.toString() + "'";
                PreparedStatement statement = connection.prepareStatement(SELECT_SQL);
                ResultSet resultSet = statement.executeQuery();
                boolean anyJob = false;
                String issuer = "";
                Long jobId = (long) 0;
                String processor = Processors.NMOCOS.toString();
                while (resultSet.next()) {
                    String jobStatus = resultSet.getString("JOBSTATUS");
                    if (jobStatus.equalsIgnoreCase(JobStatus.TO_DO.toString())) {
                        anyJob = true;
                        issuer = resultSet.getString("ISSUER");
                        jobId = resultSet.getLong("JOBID");
                        processor = resultSet.getString("PROCESSOR");
                        break;
                    }
                }
                if (anyJob) {
                    processJob(issuer, jobId, processor);
                }
                break;

            }

        } catch (SQLException | ClassNotFoundException | NamingException ex) {
            Logger.getLogger(SolveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void processJob(String issuer, Long jobId, String processor) {
        String jobFolder = Constants.JOBS_PATH + issuer + "/" + jobId;

        if (processor.equalsIgnoreCase(Processors.NMOCOS.toString())) {
            callNMOCOS(jobFolder);
        } else {

        }
    }

    @SuppressWarnings("empty-statement")
    private void callNMOCOS(String jobFolder) {
        try {
            Runtime runtime = Runtime.getRuntime();
            Process p = runtime.exec(Constants.nMOCOS_PATH, null, new File(jobFolder));

            InputStream stderr = p.getInputStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line = null;
            while ((line = br.readLine()) != null);
            p.waitFor();
        } catch (IOException | InterruptedException ex) {
            Logger.getLogger(SolveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Starts listening the JOBQUEUE table in the MOCO database.";
    }

}
