<%@page import="java.util.List"%>
<%@page import="Model.State"%>
<%@page import="Controller.CommonDAO"%>
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
        <%@include  file="Header.jsp"%>
        <div class="main">
            <form action="_addHospital.jsp" method="post"  enctype="multipart/form-data" onsubmit="if(password.value.localeCompare(confirmpassword.value)==0){return CreateHospitalId(HName.value, Email.value, OTP.value )}else{alert('Password and confirm password must be same!'); return  false;}">
                <div class="login">
                    <div class="lhead">Continue for Hospital ID</div>
                    <div class="lhead2">Hospital Id</div>
                    <div class="lhead3">
                        <div class="head4">Necessary detail for your Hospital PinPoint!</div>
                        <div class="field">
                            <div class="fieldhead">Email<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Email" required  type="Email" id="Email" name="Email" ></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Hospital Name<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Full Name" maxlength="30" required type="text"  name="HName"  id="HName" ></input></div>
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

                        <div class="field">
                            <div class="fieldhead" >Address<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Address" maxLength="50" required  type="Address"  name="Address"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">State<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <select  name="State" required onchange="getCitiesByStateID(this.value);" >
                                    <option value="" >Select State</option>
                                    <%
                                    CommonDAO cd = new CommonDAO();
                                    List<State> states = cd.getAllStates();
                                    for(State s : states){
                                    %>
                                    <option value="<%= s.getStateId()%>" ><%=s.getStateName()%></option>
                                    <%
                                    }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">City<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <select  name="City" required id="city" >
                                    <option value="">Select City</option>
                                </select>
                            </div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Hospital Supporting Document<span style="color:red;">*(Only Image Formate)(Max File Size : 500 kb)</span></div>
                            <div class="fieldinput">
                                <input  type="file" required  accept="image/*"  onchange="Filevalidation(this, 500)" max-size="500" name="AadharImage"></input></div>
                        </div>
                        <input type="submit" class="button"  id ="verifymebutton" value="Verify Me!">
                        <div class="field" id ="otpfield" style="display: none;">
                            <div class="fieldhead">OTP<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input  type="Password"  name="OTP" minLength="4" maxlength="4" onchange="CreateId(Name.value, Email.value, Mobile.value, OTP.value)"  id="OTP"></input></div>
                        </div>
                        <input type="submit" class="button" style="display: none;" id ="createidbutton" value="Create Hospital ID">
                        </div>
                    </div>
                                            </form>

                    </div>
        <%@include  file="footer.jsp"%>
    </body>
</html>
<script src="js/index.js"></script>
<script src="js/location.js"></script>
<script src="js/signup.js"></script>
