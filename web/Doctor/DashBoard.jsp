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
        <%            
            String HealthID = (String) session.getAttribute("UserID");
            CivilianDAO cd = new CivilianDAO();
            DoctorDAO dd = new DoctorDAO();
            Civilian c = cd.getCivilianByID(HealthID);
            Doctor d = dd.getDoctorByHealthID(HealthID);
        %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">
                    <div class="profileinfo">
                        <div class="photo">
                            <img src="<%=c.getRPhoto()%>"/>
                        </div>
                        <div class="profiledetail">
                            <div class="Detail">
                                <div class="Property">Name : </div>
                                <div class="Value">Dr. <%=c.getName()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Specialized : </div>
                                <div class="Value">  <%=d.getSpe_in()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">DOB : </div>
                                <div class="Value">  <%=c.getDOB()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Diet : </div>
                                <div class="Value"><%=c.getDiet()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Marital Status : </div>
                                <div class="Value"><%=c.getMaritalStatus()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Religion : </div>
                                <div class="Value"><%=c.getReligion()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Mobile : </div>
                                <div class="Value"><%=c.getMobileNo()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Emergency Number : </div>
                                <div class="Value"><%=c.getEmail()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Address : </div>
                                <div class="Value"><%=c.getAddress()%></diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Email : </div>
                                <div class="Value"><%=c.getEmail()%></diV>                               
                            </div>
                        </div>
                    </div>
                   

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="../js/index.js"></script>
<script src="../js/signup.js"></script>
<script src="../js/CivilianDashBoard.js"></script>
