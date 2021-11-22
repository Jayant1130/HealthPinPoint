
import Controller.CommonDAO;
import Controller.DoctorDAO;
import Controller.HospitalDAO;
import Model.Doctor;
import Model.Hospital;
import Model.Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig(maxFileSize = 16177216)

public class _addHospital extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet _addHospital</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet _addHospital at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            Hospital d = new Hospital();
            d.setHospitalID(new HospitalDAO().getNextHospitalID());
            d.setHospitalName(request.getParameter("HName"));
            d.setCityID(Integer.parseInt(request.getParameter("City")));
            d.setSDocument(request.getPart("SDocuemnt"));
            d.setEmail(request.getParameter("Email"));
            d.setAddress(request.getParameter("Address"));
            HospitalDAO hd = new HospitalDAO();
            CommonDAO cd = new CommonDAO();
            Login l = new Login();
            l.setUserID(d.getEmail());
            l.setPassword(request.getParameter("password"));
            if(!hd.isHospitalEmailExist(d.getEmail())){
            if (hd.hospitalGenerateID(d) > 0 && cd.AddLoginID(l) >0) {
                out.print("<script>"
                        + "alert('Your request for Hospital ID is send to Government for varification. Your can check you status using login.');"
                        + "window.location.href='index.jsp';"
                        + "</script>");
            }
            }else{
                out.print("<script>"
                        + "alert('Given Email is already exist...');"
                        + "window.location.href='index.jsp';"
                        + "</script>");
            }
        } catch (SQLException ex) {
            out.print(ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
