<%@page import="msg.SendMsg"%>
<%@page import="mail.SendMail"%>
<%@page import="OTP.Otp"%>
<%
String Name = request.getParameter("Name");
String Mobile = request.getParameter("Mobile");
String Email = request.getParameter("Email");
String key  = "OTP_"+Email+"_"+Mobile;
String otp = "";        
if(session.getAttribute(key) == null){
    otp = new Otp().generateOTP();
    session.setAttribute(key, otp);
}else{
    otp  = (String)session.getAttribute(key);
}
String q = "<table width = 100% bgcolor= 'white' style='color:blue;'>"
            + "<tr><td><h2><center> <img width='100px' src='https://drive.google.com/uc?id=1rFCfRsOu0_fk1TrMmHMftbTFH0HAFUVN'></center> <h2><td><tr>"
            + "<tr><td><h2><center > Health PinPoint</center> <h2><td><tr>"
            + "<tr><td><center> Welcome </center> <td><tr>"
            + "<tr><td><h4><center>Hey "+Name+",  Your OTP is "+otp+"</center> <h4><td><tr></div>";

String SMS = "Hello ............";
if(new SendMail().sendmail(Email, q) && new SendMsg().sendMsg(Mobile, q))
{
out.print("true");
}
else out.print("false");
%>