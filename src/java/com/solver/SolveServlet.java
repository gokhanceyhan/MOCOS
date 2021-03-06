package com.solver;

import com.solver.dataTypes.Constants;
import com.solver.dataTypes.JobStatus;
import com.solver.database.ConnectionManager;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gokhan
 */
public class SolveServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // define connection
    java.sql.Connection connection;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            connection = ConnectionManager.setUpConnection();
            while (true) {
                // query jobqueue table and check if there is a job to do.
                String SELECT_SQL = "SELECT * FROM MOCOSERVER.JOBQUEUE WHERE JOBSTATUS = "
                        + "'" + JobStatus.TO_DO.toString() + "'";
                PreparedStatement statement = connection.prepareStatement(SELECT_SQL);
                ResultSet resultSet = statement.executeQuery();
                boolean anyJob = false;
                String issuer = null;
                Long jobId = null;
                while (resultSet.next()) {
                    String jobStatus = resultSet.getString("JOBSTATUS");
                    if (jobStatus.equalsIgnoreCase(JobStatus.TO_DO.toString())) {
                        anyJob = true;
                        issuer = resultSet.getString("ISSUER");
                        jobId = resultSet.getLong("JOBID");
                        statement.close();
                        break;
                    }
                }
                if (anyJob) {
                    processJob(issuer, jobId);
                } else {
                    // sleep for a while (1 min)
                    Thread.sleep(60000);
                }
            }

        } catch (SQLException | ClassNotFoundException | NamingException | InterruptedException ex) {
            Logger.getLogger(SolveServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void processJob(String issuer, Long jobId)
            throws InterruptedException, IOException, SQLException {

        assignJobStatus(jobId, JobStatus.IN_PROGRESS.toString());
        String jobFolder = Constants.JOBS_PATH + issuer + "/" + jobId + "/";
        Timestamp jobStartTime = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());

        boolean success = callNMOCOS(jobFolder);
        if (success) {
            assignJobOutput(jobId, jobStartTime, JobStatus.FINISHED_SUCCESS.toString(), Constants.RESULT_FILE_NAME);
        } else {
            assignJobOutput(jobId, jobStartTime, JobStatus.FINISHED_FAIL.toString(), Constants.LOG_FILE_NAME);
        }
        EmailSender eSender = new EmailSender();
        eSender.sendEmail(issuer, jobId);

    }

    
    @SuppressWarnings("empty-statement")
    private boolean callNMOCOS(String jobFolder) throws IOException, InterruptedException {

        Runtime runtime = Runtime.getRuntime();
        String[] cmdArray = new String[2];
        cmdArray[0] = Constants.ABSOLUTE_PATH + Constants.NMOCOS_PATH;
        cmdArray[1] = jobFolder;

        Process p = runtime.exec(cmdArray, null, new File(jobFolder));
        InputStream stderr = p.getInputStream();
        InputStreamReader isr = new InputStreamReader(stderr);
        BufferedReader br = new BufferedReader(isr);
        String line = null;
        while ((line = br.readLine()) != null);
        p.waitFor();

        return true;
    }

    private void assignJobStatus(Long jobId, String status) throws SQLException {
        String UPDATE_SQL = "UPDATE JOBQUEUE SET JOBSTATUS = " + "'" + status + "'"
                + " WHERE JOBID = " + jobId;
        Statement updateStatement = connection.createStatement();
        updateStatement.execute(UPDATE_SQL);
        updateStatement.close();
    }

    private void assignJobOutput(Long jobId, Timestamp jobStartTime, String status, String jobOutputFile) throws
            SQLException {

        Timestamp completionTime = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
        double processTime = (completionTime.getTime() - jobStartTime.getTime()) / 1000;

        String UPDATE_SQL = "UPDATE JOBQUEUE SET JOBSTATUS = " + "'" + status + "'"
                + ", COMPLETIONTIME = " + "'" + completionTime + "'" + ", JOBOUTPUT = " + "'" + jobOutputFile + "'"
                + ", PROCESSTIME = " + processTime + " WHERE JOBID = " + jobId;
        Statement updateStatement = connection.createStatement();
        updateStatement.execute(UPDATE_SQL);
        updateStatement.close();
    }

    /**
     * 
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Starts listening the JOBQUEUE table in the MOCO database.";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SolveServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SolveServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
