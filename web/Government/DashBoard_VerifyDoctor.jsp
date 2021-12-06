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
        <%            DoctorDAO dd = new DoctorDAO();
        %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">

                    <div class="hPatient">
                        <%
                            List<Doctor> doctors = dd.getUnVerifyDoctors();
                            if(doctors.size()==0){
                                %>
                            <div class='No'>No Pending Request!</div> <div class='header-logo'  style="
    width: 206px;
    margin: auto;
"><img src='../img/logo.png'/></div>
<%
                            }
                            for (Doctor d : doctors) {
                                       Civilian c = new CivilianDAO().getCivilianByID(d.getHealthID());
                                       

                        %>
                        <div class="Entreaty hPatientcard hospitalRequest">
                            <div class="EntreatyLogo"><img src="<%=c.getRPhoto()%>"></div>
                            <div class="Entreatyinfo">
                                <div class="EntreatyName"><%=c.getName()%></div>
                                <div class="EntreatyRel">Email : <%=c.getEmail()%> </div>
                                <div class="EntreatyRel">Address  : <%=c.getAddress()%> </div>
                            </div>
                            <form action="_ActivateDoctorID.jsp" method="post">
                                <input type="hidden"  value="<%=d.getDoctorID()%>" name="DoctorID">
                                <input type="submit" class="EntreatyDeclineButton"  value="Activate"></input>
                            </form>
                            <div style="display: flex; padding: 10px;">
                            <div class="EntreatyAcceptButton" onclick="SupportingDocument.src='<%=d.getRClinicProof()%>';open_model('SupportingDocumentModel');">View Clinic Document</div>
                            <div class="EntreatyAcceptButton" onclick="SupportingDocument.src='<%=d.getRDegreeProof()%>';open_model('SupportingDocumentModel');">View Degree</div>
                            </div>
                            <div style="width: 100%;border: 1px solid #e5d5d5;border-radius: 10px;" id=' '></div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
    <div class="modelscreen" style="display:none;" id="SupportingDocumentModel">

        <div class="model">
                <div class="modelHeader">Supporting Document</div>
                <div class="modelContent">
                    <div class="supportingdocument">
                        <img src="" id = "SupportingDocument"/>    
                    </div>
                </div>
                <div class="modelFooter">
                    <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('SupportingDocumentModel')">Close</div>
                </div>
        </div>

    </div>
</html>
<script src="../js/index.js"></script>
<script src="../js/signup.js"></script>
<script src="../js/HospitalDashBaord.js"></script>
<script src="../js/DoctorDashBoard.js"></script>
