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
            <form action="civilianSignup_detail.jsp" method="post" onsubmit="if(aadhar.value.length != 12 ){alert('Aadhar Number Should be 12 Digit'); return false; }else  return aadharsubmit();">
                <div class="login">
                    <div class="lhead">Create your Health ID</div>
                    <div class="lhead2">Health Id</div>
                    <div class="lhead3">
                        <div class="head4">Create account easy and fast!</div>
                        <div class="field">
                            <div class="fieldhead">Aadhar Card Number<span style="color:red">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Aadhar Card Number" id="aadhar" 
                                       required  onkeyup="if(this.value.length == 12){isAadharExist1(this.value)}else{this.value = this.value.slice(0, this.maxLength); alert('Aadhar Number should be 12 Digit')}"  onchange="if(this.value.length == 12){isAadharExist1(this.value)}" name="aadhar" type="number" maxLength="12" minLength="12"></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Password<span style="color:red">* (Minimum Length 8)</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Your Password" required type="Password" id="password" pattern=".{8,}" name="password"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Confirm Password<span style="color:red">* (Minimum Length 8)</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Your Confirm Password" required type="Password"  pattern=".{8,}" id="confirmpassword" name="confirmpassword"></input></div>
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

