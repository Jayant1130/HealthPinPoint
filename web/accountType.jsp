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
                        <div class="LoginOut" onclick="window.location.href='civilianSignup.jsp'">
                            <div class="HeadingLogo"><img src="img/clogo.png"></div>
                            <div class="Heading1">Create Civilian HealthID</div>
                            <div class="HeadingDescription">for civilian of Indian</div>
                        </div>
                        <div class="LoginOut" onclick="window.location.href='hospitalSignup.jsp'">
                            <div class="HeadingLogo"><img src="img/hlogo.png"></div>
                            <div class="Heading1">Create Hospital ID</div>
                            <div class="HeadingDescription">for only Hospital</div>
                        </div>
                        <div class="LoginOut" onclick="window.location.href='doctorSignup.jsp'">
                            <div class="HeadingLogo"><img src="https://www.pngrepo.com/png/284250/180/surgeon-doctor.png"></div>
                            <div class="Heading1">Create Doctor ID</div>
                            <div class="HeadingDescription">for only Doctor's</div>
                        </div>
                    </div>
		
		
		</div>
	<%@include file="footer.jsp" %>	
    </body>
</html>
<script src="js/index.js"></script>