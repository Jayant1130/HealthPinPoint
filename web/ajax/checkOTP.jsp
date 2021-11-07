<%@page import="OTP.Otp"%>
<%
    String OTP = request.getParameter("OTP");
    String Mobile = request.getParameter("Mobile");
    String Email = request.getParameter("Email");
    String key  = "OTP_"+Email+"_"+Mobile;
String otp = "";        
if(session.getAttribute(key) == null){
    session.setAttribute(key, otp);
}else{
    otp  = (String)session.getAttribute(key);
}
if(otp.equals(OTP)){
out.print("true");

}
else out.print("false");

%>