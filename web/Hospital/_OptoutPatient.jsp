<%@page import="Controller.HospitalDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.CivilianAdmit"%>
<%

        CivilianAdmit ca = new CivilianAdmit();
    CivilianDAO cd = new CivilianDAO();
    ca.setHealthID(request.getParameter("PatientHealthID"));
    ca.setHospitalID(Integer.parseInt(request.getParameter("HospitalID")));
    ca.setAdmitDate(request.getParameter("AdmitDate"));
    HospitalDAO hd = new HospitalDAO();
    if(hd.OptOutPatient(ca)>0){
            out.print("<script>"
                    + "alert('Patient Opt-Out Successfully !');"
                    + "window.location.href='DashBoard_HospitalPatient.jsp';"
                    + "</script>");
    }else{
            out.print("<script>"
                    + "alert('Unable to Opt-Out Patient !');"
                    + "window.location.href='DashBoard_HospitalPatient.jsp';"
                    + "</script>");
    }


%>