<%@page import="Controller.HospitalDAO"%>
<%
    HospitalDAO hd = new HospitalDAO();
    if(hd.ActivateHospitalID(Integer.parseInt(request.getParameter("HospitalID")))>0){
            out.print("<script>"
                    + "alert('Hospital ID Activated Sucessfully!');"
                    + "window.location.href='DashBoard_VerifyHospital.jsp';"
                    + "</script>");
    }else{
            out.print("<script>"
                    + "alert('Unable to Activated Hospital ID !');"
                    + "window.location.href='DashBoard_VerifyHospital.jsp';"
                    + "</script>");
    }


%>