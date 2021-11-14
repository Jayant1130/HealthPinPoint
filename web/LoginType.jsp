<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.Doctor"%>
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
        <%@include file="Header.jsp" %>
        <div class="main">
                                <div class="accountType">
            <%
            if(request.getParameter("Civilian") != null){
                response.sendRedirect("Civilian/DashBoard.jsp");
            }
            if(request.getParameter("CivilianDoctor") != null){
                
                if(new DoctorDAO().getDoctorByHealthID(UserID).getActive() == 1){
            %>

                        <div class="LoginOut" onclick="window.location.href='Doctor/DashBoard.jsp'">
                            <div class="HeadingLogo"><img src="https://www.pngrepo.com/png/284250/180/surgeon-doctor.png"></div>
                            <div class="Heading1">Login As Doctor</div>
                            <div class="HeadingDescription">Go as Doctor</div>
                        </div>
            <%
            }else{%>
                        <div class="LoginOut" >
                            <div class="HeadingLogo"><img src="https://www.pngrepo.com/png/284250/180/surgeon-doctor.png"></div>
                            <div class="Heading1" style="font-size: 14px;line-height: 22px;">Your Doctor ID is under verification. Please wait for verification process to complete by Government of India.</div>
                            <div class="HeadingDescription">Go as Doctor</div>
                        </div>

<%}
%>
                        <div class="LoginOut" onclick="window.location.href='Civilian/DashBoard.jsp'">
                            <div class="HeadingLogo"><img src="https://www.pngrepo.com/png/284250/180/surgeon-doctor.png"></div>
                            <div class="Heading1">Login As Civilian</div>
                            <div class="HeadingDescription">Go as Civilian</div>
                        </div>
            
            <%
            }
            %>
        </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="js/index.js"></script>