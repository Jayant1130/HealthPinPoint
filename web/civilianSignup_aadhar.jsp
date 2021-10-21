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
			<div class="lhead">Create to your Health ID</div>
			<div class="lhead2">Health Id</div>
			<div class="lhead3">
			<div class="head4">Create account easy and fast!</div>
			<div class="field">
			<div class="fieldhead">Aadhar Card Number*</div>
			<div class="fieldinput">
				<input placeholder="Aadhar Card Number" minlength="12" type="number"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Password*</div>
			<div class="fieldinput">
				<input placeholder="Enter Your Password" type="Password"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Confirm Password*</div>
			<div class="fieldinput">
				<input placeholder="Enter Your Confirm Password" type="Password"></input></div>
			</div>
			<div class="button">Next</div>
			</div>
			</div>
		</div>
        <%@include file="footer.jsp" %>	
    </body>
</html>

