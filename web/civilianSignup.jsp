<html>
    <head>
        <title>Health PinPoint</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/header.css">
		<link rel="stylesheet" href="css/footer.css">
		
		<link rel="stylesheet" href="css/Home.css">
		<link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
		<div class="main">
			<div class="login">
			<div class="lhead">Create your Health ID</div>
			<div class="lhead1">Health ID will make it easy for you to securely access and manage your health data digitally. You can create your Health ID using just your Mobile Number or Aadhaar Number.</div>
			<div class="lhead2">Create Health Id</div>
			<div class="lhead3">
			<div class="head4" onclick="window.href.location='civilianSignup_aadhar.jsp'">Generate your Health ID</div>
			<div class="button">Generate via Aadhar Card</div>
			<div class="forget">Already have a Health ID?<a href="#">Login</a></div>
			</div>
			</div>
			
			
			
		
		
		</div>
	<%@include file="footer.jsp" %>		
    </body>
</html>
