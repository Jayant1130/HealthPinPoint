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
        <%@include file="Header.jsp" %>
		<div class="main">
                    <form action="_login.jsp" method="post" onsubmit="setLoader(1);" >
			<div class="login">
			<div class="lhead">Login to your Health ID</div>
			<div class="lhead1">Accessing your health history esaily</div>
			<div class="lhead2">Health Id</div>
			<div class="lhead3">
			<div class="head4">continue to your account</div>
			<div class="field">
			<div class="fieldhead">Health ID/PHR Address<span style="color:red;">*</span></div>
			<div class="fieldinput"><input placeholder="HealthID" type="text" name="UserID"></input></div></div>
			<div class="field">
			<div class="fieldhead">Password<span style="color:red;">*</span></div>
			<div class="fieldinput"><input placeholder="Password" type="password" name="Password"></input></div>
                        </div>
                        <input type="submit" class="button" value="Submit">
			<div class="forget">Forgot your Health ID</div>
			</div>
			</div>
			
			
			</form>
		
		
		</div>
        <%@include file="footer.jsp" %>
    </body>
</html>
<script src="js/index.js"></script>

