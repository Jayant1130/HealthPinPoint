<%@page import="msg.SendMsg"%>
<%@page import="OTP.Otp"%>
<%@page import="mail.SendMail"%>
<%@page import="Model.Hospital"%>
<%@page import="Controller.HospitalDAO"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.Civilian"%>
<%@page import="Controller.CivilianDAO"%>
<html>
    <head>
        <title>Health PinPoint</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/footer.css">

        <link rel="stylesheet" href="../css/loader.css">
        <link rel="stylesheet" href="../css/Home.css">
        <link rel="stylesheet" href="../css/login.css">
        <link rel="stylesheet" href="../css/CivilianDashBoard.css">
        <link rel="stylesheet" href="../css/DoctorDashBoard.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include file="Header.jsp" %>
        <%            String Email = (String) session.getAttribute("UserID");
            HospitalDAO hd = new HospitalDAO();
            DoctorDAO dd = new DoctorDAO();
            CivilianDAO cd = new CivilianDAO();
            Hospital h = hd.getHospitalByEmail(Email);
            if(!dd.isDoctorID(request.getParameter("DoctorHealthID"))){
            out.print("<script>"
                    + "alert('Given Docotor HealthID not Exist!');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
            }else{
                Civilian c = cd.getCivilianByID(request.getParameter("DoctorHealthID"));
                
String key  = "HOTP_"+c.getEmail()+"_"+c.getMobileNo();
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
            + "<tr><td><h3><center>Hey "+c.getName().toUpperCase()+",<br> "+h.getHospitalName().toUpperCase()+" request you to join their Hospital. Please verify OTP if you want to join this Hospital <br> Your OTP is "+otp+"</center> <h3><td><tr></div>";

String SMS = "Hello ............";
if(new SendMail().sendmail(c.getEmail(), q) && new SendMsg().sendMsg(c.getMobileNo(), q))
{
            out.print("<script>"
                    + "alert('One Time Password Send on Doctor Email!');"
                    + "</script>");
}
else{
            out.print("<script>"
                    + "alert('Unable to send OTP!');"
                    + "window.location.href='DashBoard_HospitalDoctor.jsp';"
                    + "</script>");
}

        %>
        <div class="main">
            <div class="DashBoard">
                <div class="profile" ID="HIForDoctor">
                    <div class="login">
                        <form method="post" action="_AttachDoctor.jsp">
                            <div class="lhead">Attach Doctor</div>
                            <div class="lhead3">
                                <div class="head4">One Time Password has been send to Doctor's Email</div>
                                <div class="field">
                                    <input type="hidden" value="<%=request.getParameter("DoctorHealthID")%>" name="PatientHealthID" >
                                    <input type="hidden" value="<%=h.getHospitalID()%>" name="HospitalID" >
                                    <div class="fieldhead">One Time Password<span style="color:red;">*</span></div>
                                    <div class="fieldinput">
                                        <input placeholder="One Time Password" id="aadhar"  minlength="4" name="OneTimePassword" type="number"></input></div>
                                </div>
                                <input type="submit" class="button" value="Attach Doctor" ></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
                                    <%
                                    }
                                    %>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="../js/index.js"></script>
<script src="../js/signup.js"></script>
<script src="../js/CivilianDashBoard.js"></script>
