<%@page import="java.util.List"%>
<%@page import="Model.CivilianAdmit"%>
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
        <link rel="stylesheet" href="../css/DashBoardScreen_FamilyMember.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include file="Header.jsp" %>
        <%            String Email = (String) session.getAttribute("UserID");
            HospitalDAO hd = new HospitalDAO();
            Hospital h = hd.getHospitalByEmail(Email);
        %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">
                    <div class="button-header">
                        <div class="button" onclick="open_model('addnewPatient');"> + Opt-In Patient </div>
                        <div class="modelscreen" style="display:none;" id="addnewPatient">

                            <div class="model">
                                <form id="addnewPatient" action="_OptinPatient.jsp"  method="post">
                                    <div class="modelHeader">Add New Patient</div>
                                    <div class="modelContent">
                                        <div class="field">
                                    <input type="hidden" value="<%=h.getHospitalID()%>" name="HospitalID">
                                            <div class="fieldhead">Patient HealthID<span style="color:red;">*</span></div>
                                            <div class="fieldinput">
                                                <input placeholder="PatientHealthID" required name="PatientHealthID" 
                                                       onkeyup="if (this.value.length != 12) {
                                                                   this.value = this.value.slice(0, this.maxLength);
                                                                   alert('Aadhar Number should be 12 Digit')
                                                               }"   type="number" maxLength="12" minLength="12"></input></div>
                                        </div>
                                    </div>
                                    <div class="modelFooter">
                                        <button type="submit" class="button" onclick="" id="AddFamilyModelAdd"  style="border-radius: 10px;">Add New Patient</button>
                                        <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('addnewPatient')">Close</div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="hPatient">
                       <%
                           List<CivilianAdmit> caa = hd.getCivlianAdmitByHospitalID(h.getHospitalID());
                           int f = 0;
                       for(CivilianAdmit ca : caa){
                           CivilianDAO cd = new CivilianDAO();
                           Civilian c = cd.getCivilianByID(ca.getHealthID());
                           if(ca.getDischargeDate() == null){
                              f=1;  
                       %> <div class="Entreaty hPatientcard">
                            <div class="EntreatyLogo"><img src="<%=c.getRPhoto()%>"></div>
                            <div class="Entreatyinfo">
                                <div class="EntreatyName"><%=c.getName()%></div>
                                <div class="EntreatyRel">Opt-in on <%=ca.getAdmitDate()%> </div>
                            </div>
                            <div class="EntreatyAcceptButton" onclick="getHIForHospital(<%=c.getHealthID()%>, '<%=c.getHealthID()%>')">View</div>
                            <form action="_OptoutPatient.jsp" method="post">
                                <input type="hidden" value="<%=ca.getHealthID()%>" name="PatientHealthID">
                                <input type="hidden"  value="<%=ca.getHospitalID()%>" name="HospitalID">
                                <input type="hidden"  value="<%=ca.getAdmitDate()%>" name="AdmitDate">
                                <input type="submit" class="EntreatyDeclineButton"  value="Opt-Out"></input>
                            </form>
                            <div style="width: 100%;border: 1px solid #e5d5d5;border-radius: 10px;" id='<%=c.getHealthID()%>'></div>
                        </div>
                            
                            <%}}
                                if(f ==0){
                                    out.print("Currently No Patient ");
                    }
                            %>
                        

                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="../js/index.js"></script>
<script src="../js/signup.js"></script>
<script src="../js/HospitalDashBaord.js"></script>
<script src="../js/DoctorDashBoard.js"></script>
