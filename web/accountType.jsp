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
                    <a href="civilianSignup.jsp">
                        <div class="LoginOut">
                            <div class="HeadingLogo"></div>
                            <div class="Heading">create civilian healthID</div>
                            <div class="HeadingDescription">create civilian healthID</div>
                        </div></a>
		    <a href="hospitalSignup.jsp">create hospital healthID</a>
                    <a href="doctorSignup.jsp">create doctor healthID</a>
			
		
		
		</div>
	<%@include file="footer.jsp" %>	
    </body>
</html>
<script src="js/index.js"></script>