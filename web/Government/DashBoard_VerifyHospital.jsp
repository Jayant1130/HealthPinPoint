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
        <%            HospitalDAO hd = new HospitalDAO();
        %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">

                    <div class="hPatient">
                        <%
                            List<Hospital> hospitals = hd.getUnVerifyHospitals();
                            if(hospitals.size()==0){
                             %>
                            <div class='No'>No Pending Request!</div> <div class='header-logo'  style="
    width: 206px;
    margin: auto;
"><img src='../img/logo.png'/></div>
<%
                            }
                            for (Hospital h : hospitals) {


                        %>
                        <div class="Entreaty hPatientcard hospitalRequest">
                            <div class="EntreatyLogo"><img src="../img/logo.png"></div>
                            <div class="Entreatyinfo">
                                <div class="EntreatyName"><%=h.getHospitalName()%></div>
                                <div class="EntreatyRel">Email : <%=h.getEmail()%> </div>
                                <div class="EntreatyRel">Address  : <%=h.getAddress()%> </div>
                            </div>
                            <div class="EntreatyAcceptButton" onclick="SupportingDocument.src='<%=h.getRSDocument()%>';open_model('SupportingDocumentModel');">View Supporting Document</div>
                            <form action="_ActivateHospitalID.jsp" method="post">
                                <input type="hidden"  value="<%=h.getHospitalID()%>" name="HospitalID">
                                <input type="submit" class="EntreatyDeclineButton"  value="Activate"></input>
                            </form>
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
