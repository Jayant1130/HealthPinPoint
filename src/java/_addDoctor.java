import Controller.CivilianDAO;
import Controller.CommonDAO;
import Controller.DoctorDAO;
import Model.Civilian;
import Model.Doctor;
import Model.Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig(maxFileSize = 16177216)

public class _addDoctor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet _addDoctor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet _addDoctor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter out = response.getWriter();
            try {
            Doctor d = new Doctor();
            d.setSpe_in(request.getParameter("Spe_In"));
            d.setClinicProof(request.getPart("ClinicProof"));
            d.setDegreeProof(request.getPart("DegreeProof"));
            d.setHealthID(request.getParameter("aadhar"));
            DoctorDAO dd = new DoctorDAO();
            Login l = new Login();
            l.setUserID(request.getParameter("aadhar"));
            l.setPassword(request.getParameter("password"));
            if(dd.DoctorGenerateID(d)>0 ){
                    out.print("<script>"
                            + "alert('Your request for Doctor ID is send to Government for varification. Your can check you status using login.');"
                            + "window.location.href='index.jsp';"
                            + "</script>");
            }
        } catch (SQLException ex) {
            out.print(ex);
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
