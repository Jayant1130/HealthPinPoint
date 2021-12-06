<%@page import="OTP.Otp"%>
<%@page import="Model.Civilian"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Controller.HospitalDAO"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.DoctorAttached"%>
<%

    DoctorAttached ca = new DoctorAttached();
    ca.setDoctorID(new DoctorDAO().getDoctorByHealthID(request.getParameter("PatientHealthID")).getDoctorID());
    ca.setHospitalID(Integer.parseInt(request.getParameter("HospitalID")));
    HospitalDAO hd = new HospitalDAO();
    Civilian c = new CivilianDAO().getCivilianByID(request.getParameter("PatientHealthID"));
String key  = "HOTP_"+c.getEmail()+"_"+c.getMobileNo();
String otp = "";        
if(session.getAttribute(key) == null){
    otp = new Otp().generateOTP();
    session.setAttribute(key, otp);
}else{
    otp  = (String)session.getAttribute(key);
}
    if(otp.equals(request.getParameter("OneTimePassword"))){
    if(hd.AttachDoctor(ca)>0){
            out.print("<script>"
                    + "alert('Doctor Attached Successfully !');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
    }else{
            out.print("<script>"
                    + "alert('Unable to Attach !');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
    }
    }else{
            out.print("<script>"
                    + "alert('Wrong OTP !');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
    }
%>