<%@page import="Model.DoctorAttached"%>
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
        <%  String Email = (String) session.getAttribute("UserID");
            HospitalDAO hd = new HospitalDAO();
            Hospital h = hd.getHospitalByEmail(Email);
        %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">
                    <div class="button-header">
                        <div class="button" onclick="open_model('attchDoctor');"> + Attach Doctor </div>
                        <div class="modelscreen" style="display:none;" id="attchDoctor">

                            <div class="model">
                                <form id="addnewPatient" action="AttachDoctor.jsp"  method="post">
                                    <div class="modelHeader">Add New Patient</div>
                                    <div class="modelContent">
                                        <div class="field">
                                            <input type="hidden" value="<%=h.getHospitalID()%>" name="HospitalID">
                                            <div class="fieldhead">Doctor's HealthID<span style="color:red;">*</span></div>
                                            <div class="fieldinput">
                                                <input placeholder="Doctor's HealthID" required name="DoctorHealthID" 
                                                       onkeyup="if (this.value.length != 12) {
                                                                   this.value = this.value.slice(0, this.maxLength);
                                                                   alert('HealthID should be 12 Digit')
                                                               }"   type="number" maxLength="12" minLength="12"></input></div>
                                        </div>
                                        <div class="head4">Note : for Attaching Doctor, Doctor should be verifed using One time Password </div>
                                            
                                    </div>
                                    <div class="modelFooter">
                                        <button type="submit" class="button" onclick="" id="AddFamilyModelAdd"  style="border-radius: 10px;">Attach Doctor</button>
                                        <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('attchDoctor')">Close</div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="hPatient">
                        <%
                            List<DoctorAttached> daa = hd.getDoctorAttachedByHospitalID(h.getHospitalID());
                            int f = 0;
                            for (DoctorAttached da : daa) {
                                DoctorDAO dd = new DoctorDAO();
                                Doctor d = dd.getDoctorByID(da.getDoctorID());
                                CivilianDAO cd = new CivilianDAO();
                                Civilian c = cd.getCivilianByID(d.getHealthID());
                        %> <div class="Entreaty hPatientcard">
                            <div class="EntreatyLogo"><img src="<%=c.getRPhoto()%>"></div>
                            <div class="Entreatyinfo">
                                <div class="EntreatyName"><%=c.getName()%></div>
                                <div class="EntreatyRel">Specialized in <%=d.getSpe_in()%> </div>
                            </div>
                            <form action="_DeAttachDoctor.jsp" method="post">
                                <input type="hidden"  value="<%=da.getHospitalID()%>" name="HospitalID">
                                <input type="hidden"  value="<%=da.getDoctorID()%>" name="DoctorID">
                                <input type="submit" class="EntreatyDeclineButton"  value="Deattach Doctor"></input>
                            </form>
                            <div style="width: 100%;border: 1px solid #e5d5d5;border-radius: 10px;" id='<%=c.getHealthID()%>'></div>
                        </div>

                        <%
                            }
                            if (daa.size() == 0) {
                                out.print("Currently No Doctor Attach!");
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
