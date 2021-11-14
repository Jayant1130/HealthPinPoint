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
<%



%>        <%@include file="Header.jsp" %>
        <div class="main">
            <form action="doctorSignup_detail.jsp" method="post" >
                <div class="login">
                    <div class="lhead">Create your Doctor ID</div>
                    <div class="lhead2">Doctor ID</div>
                    <div class="lhead3">
                        <div class="head4">Create account easy and fast!</div>
                        <div class="field">
                            <div class="fieldhead">Health ID*</div>
                            <div class="fieldinput">
                                <input placeholder="Health ID" id="aadhar"  minlength="12" name="aadhar" type="number"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Password*</div>
                            <div class="fieldinput">
                                <input placeholder="Enter Your Password" type="Password" id="password" name="password"></input></div>
                        </div>
                        <input type="submit" class="button" value="Next"></div>
                </div>
            </form>
        </div>
    </div>
    <%@include file="footer.jsp" %>	
</body>
</html>
<script src="js/index.js"></script>
<script src="js/signup.js"></script>

