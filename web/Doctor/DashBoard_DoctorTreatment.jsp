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

        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile" ID="HIForDoctor">
                    <div class="login">
                        <div class="lhead">OptIN Patient</div>
                        <div class="lhead3">
                            <div class="head4">Get Patient Details By HealthID</div>
                            <div class="field">
                                <div class="fieldhead">HealthID<span style="color:red;">*</span></div>
                                <div class="fieldinput">
                                    <input placeholder="HealthID" id="aadhar"  minlength="12" name="aadhar" type="number"></input></div>
                            </div>
                            <input type="submit" class="button" value="Get Patient Details" onclick="getHIForDoctor(aadhar.value)"></div>
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
<script src="../js/DoctorDashBoard.js"></script>
