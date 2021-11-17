<%@page import="Model.Civilian"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.State"%>
<%@page import="Controller.CommonDAO"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Health PinPoint</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/loader.css">

        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include  file="Header.jsp"%>
        <%            String aadhar = request.getParameter("aadhar");
            String Password = request.getParameter("password");
            CommonDAO cd = new CommonDAO();
            CivilianDAO cid = new CivilianDAO();
            DoctorDAO dd = new DoctorDAO();
            if(!cid.isAadharExist(aadhar)){
                    out.print("<script>"
                            + "alert('invalid Health ID ! Create first Health ID');"
                            + "window.location.href='doctorSignup.jsp';"
                            + "</script>");
                    
            }else{
                if(!cd.isCorrectLogin(aadhar, Password)){
                    out.print("<script>"
                            + "alert('invalid credential');"
                            + "window.location.href='doctorSignup.jsp';"
                            + "</script>");}
             if (cd.isCorrectLogin(aadhar, Password) && cid.isCivilianID(aadhar)) {
                if (dd.isDoctorID(aadhar)) {
                    out.print("<script>"
                            + "alert('Your Doctor ID is Already Exist Please try to Login!');"
                            + "window.location.href='doctorSignup.jsp';"
                            + "</script>");
                }
             }
            Civilian c = cid.getCivilianByID(aadhar);
            
        %>
        <div class="main">
            <form action="_addDoctor.jsp" method="post"  onsubmit="setLoader(1)" enctype="multipart/form-data" onsubmit="return CreateId(Name.value, Email.value, Mobile.value, OTP.value)">
                <input type="hidden" name="aadhar" value="<%=aadhar%>">
                <input type="hidden" name="password" value="<%=Password%>">
                <div class="login">
                    <div class="lhead">Continue for your Health ID</div>
                    <div class="lhead2">Doctor Id</div>
                    <div class="lhead3">
                        <div class="head4">Necessary detail for your Health PinPoint!</div>
                        <div class="field">
                            <div class="fieldhead">Health ID<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Health ID" readonly value="<%=aadhar%>" type="number"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Full Name (As per Aadhar)<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Full Name" required readonly type="text"  name="Name"  id="Name" value="<%=c.getName()%>"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Mobile Number<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Mobile Number" required readonly type="Number"  name="Mobile" id="Mobile" value="<%=c.getMobileNo()%>"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Email<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Email" required  type="Email" readonly id="Email" name="Email"  value="<%=c.getEmail()%>"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead" >Address<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Address" required readonly type="Address"  name="Address" value="<%=c.getAddress()%>"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead" >Specialized In<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Specialization" required  type="Address" name="Spe_In"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead" >Clinic Proof<span style="color:red;">*(Only Image Formate)(Max File Size : 500 kb)</span></div>
                            <div class="fieldinput">
                                <input required  type="file" required  name="ClinicProof" onchange="Filevalidation(this, 500)"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead" >Degree Proof<span style="color:red;">*(Only Image Formate)(Max File Size : 500 kb)</span></div>
                            <div class="fieldinput">
                                <input required  type="file" required  name="DegreeProof"  onchange="Filevalidation(this, 500)"></input></div>
                        </div>
                        <input type="submit" class="button"  id ="verifymebutton" value="Create My Doctor ID">
                    </div>
                </div>
            </form>

        </div>
                        <%}%>
        <%@include  file="footer.jsp"%>
    </body>
</html>

<script src="js/index.js"></script>
<script src="js/location.js"></script>
<script src="js/signup.js"></script>
