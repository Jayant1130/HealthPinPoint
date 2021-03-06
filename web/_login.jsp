<%@page import="Controller.AdminDAO"%>
<%@page import="Controller.HospitalDAO"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Controller.CommonDAO"%>

<%
    
    String UserID = request.getParameter("UserID");
    String Password =  request.getParameter("Password");
    CommonDAO cd = new CommonDAO();
    CivilianDAO cid = new CivilianDAO();
    DoctorDAO dd = new DoctorDAO();
    HospitalDAO hd = new HospitalDAO();
    AdminDAO ad = new AdminDAO();
    if(cd.isCorrectLogin(UserID, Password)){
        String url = "./LoginType.jsp?";
        session.setAttribute("UserID", UserID);
        String t = ad.isAdminIDExist(UserID);
    if(t != null){
       url = url+t+"=1";
        session.setAttribute("AccountType", t);
    }else if(hd.isHospitalEmailExist(UserID))
        {
        session.setAttribute("AccountType", "Hospital");
       url = url+"Hospital=1";
        }else if(!UserID.contains("@")){
        if(cid.isCivilianID(UserID) && !dd.isDoctorID(UserID)){
        session.setAttribute("AccountType", "Civilian");
            url = url+"Civilian=1";
        }

        if(dd.isDoctorID(UserID))
        {
        session.setAttribute("AccountType", "Civilian | Doctor");
       url = url+"CivilianDoctor=1";
        }
        }
        
        response.sendRedirect(url);
        
    }else{
        out.print("<script>"
                            + "alert('invalid credentials.');"
                            + "window.location.href='index.jsp';"
                            + "</script>");
    }

%>
<script src="js/index.js"></script>