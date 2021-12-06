<%@page import="Controller.HospitalDAO"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.DoctorAttached"%>
<%
    DoctorAttached ca = new DoctorAttached();
    ca.setDoctorID(Integer.parseInt(request.getParameter("DoctorID")));
    ca.setHospitalID(Integer.parseInt(request.getParameter("HospitalID")));
    HospitalDAO hd = new HospitalDAO();
    if(hd.DeAttachDoctor(ca) > 0){
            out.print("<script>"
                    + "alert('Doctor Deattached Successfully !');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
    }else{
            out.print("<script>"
                    + "alert('Unable to deattached Doctor !');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
    }

%>