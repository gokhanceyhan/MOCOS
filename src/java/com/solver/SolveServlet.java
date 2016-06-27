package com.solver;

import java.io.IOException;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // we need to invoke our algorithm
        try {          

            // start the solver
//            Runtime runtime = Runtime.getRuntime();
//            String solverPath = "/Users/gokhanceyhan/Dropbox/Ph.D/Solver_on_Web/MOIP/web/myFiles/MOIP_software.exe";
//            String folderPath = "/Users/gokhanceyhan/Dropbox/Ph.D/Solver_on_Web/MOIP/web/myFiles";
//            Process p = runtime.exec(solverPath, null, new File(folderPath));
//
//            InputStream stderr = p.getInputStream();
//            InputStreamReader isr = new InputStreamReader(stderr);
//            BufferedReader br = new BufferedReader(isr);
//            String line = null;
//            while ((line = br.readLine()) != null);
//            p.waitFor();

            // display "Complete" on the page
            response.setHeader("Content-Type", "text/plain");
            response.getWriter().write("Finished!");

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
    }

}
