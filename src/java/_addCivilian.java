
import Controller.CivilianDAO;
import Controller.CommonDAO;
import Model.Civilian;
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

public class _addCivilian extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet _addCivilian</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet _addCivilian at " + request.getContextPath() + "</h1>");
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

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Civilian c = new Civilian();
            c.setCityID(Integer.parseInt(request.getParameter("City")));
            c.setHealthID(request.getParameter("aadhar"));
            c.setName(request.getParameter("Name"));
            c.setMobileNo(request.getParameter("Mobile"));
            c.setAddress(request.getParameter("Address"));
            c.setDOB(request.getParameter("DOB"));
            c.setEmergencyNo(request.getParameter("Emergency"));
            c.setPhoto(request.getPart("Photo"));
            c.setAadharImage(request.getPart("AadharImage"));
            c.setEmail(request.getParameter("Email"));
            c.setMaritalStatus(request.getParameter("Maritial"));
            c.setReligion(request.getParameter("Religion"));
            c.setDiet(request.getParameter("Diet"));
            CivilianDAO cid = new CivilianDAO();
            CommonDAO cd = new CommonDAO();
            Login l = new Login();
            l.setUserID(request.getParameter("aadhar"));
            l.setPassword(request.getParameter("password"));
            if(cid.CivilianGenerateID(c)>0 && cd.AddLoginID(l)> 0){
                PrintWriter out = response.getWriter();
                out.print("<script>alert('User Added');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(_addCivilian.class.getName()).log(Level.SEVERE, null, ex);
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
