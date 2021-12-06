<%@page import="Controller.DoctorDAO"%>
<%
    DoctorDAO dd = new DoctorDAO();
    if(dd.ActivateDoctorID(Integer.parseInt(request.getParameter("DoctorID")))>0){
            out.print("<script>"
                    + "alert('Doctor ID Activated Sucessfully!');"
                    + "window.location.href='DashBoard_VerifyDoctor.jsp';"
                    + "</script>");
    }else{
            out.print("<script>"
                    + "alert('Unable to Activated Doctor ID !');"
                    + "window.location.href='DashBoard_VerifyDoctor.jsp';"
                    + "</script>");
    }


%>