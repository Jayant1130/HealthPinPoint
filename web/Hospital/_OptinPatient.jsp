<%@page import="Controller.CivilianDAO"%>
<%@page import="Controller.HospitalDAO"%>
<%@page import="Model.CivilianAdmit"%>
<%
    CivilianAdmit ca = new CivilianAdmit();
    CivilianDAO cd = new CivilianDAO();
    ca.setHealthID(request.getParameter("PatientHealthID"));
    ca.setHospitalID(Integer.parseInt(request.getParameter("HospitalID")));
    HospitalDAO hd = new HospitalDAO();
    if(cd.isAadharExist(ca.getHealthID())){
    CivilianAdmit ca1 = hd.getCivilianAdmit(ca);
    if (ca1 == null ) {
        if (hd.OptInPatient(ca) > 0) {
            out.print("<script>"
                    + "alert('Patient Opt-In Successfully !');"
                    + "window.location.href='DashBoard_HospitalPatient.jsp';"
                    + "</script>");
        }else{
                out.print("<script>"
                + "alert('Unable Patient Opt-In Successfully!');"
                + "window.location.href='DashBoard_HospitalPatient.jsp';"
                + "</script>");
        }
    }else if(ca1.getDischargeDate() == null){
                out.print("<script>"
                + "alert('Given Patient Already Admited!');"
                + "window.location.href='DashBoard_AdmitPatient.jsp';"
                + "</script>");
       }
    }else{
                out.print("<script>"
                + "alert('Invalid HealthID!');"
                + "window.location.href='DashBoard_AdmitPatient.jsp';"
                + "</script>");
    }

%>