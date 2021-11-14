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
            <form action="_addCivilian.jsp" method="post"  enctype="multipart/form-data" onsubmit="return CreateId(Name.value, Email.value, Mobile.value, OTP.value )">
                <input type="hidden" name="aadhar" value="<%=request.getParameter("aadhar")%>">
                <input type="hidden" name="password" value="<%=request.getParameter("password")%>">
                <div class="login">
                    <div class="lhead">Continue for your Health ID</div>
                    <div class="lhead2">Health Id</div>
                    <div class="lhead3">
                        <div class="head4">Necessary detail for your Health PinPoint!</div>
                        <div class="field">
                            <div class="fieldhead">Health ID<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Aadhar Card Number" readonly value="<%=request.getParameter("aadhar")%>" type="number"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Photo<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input required="" accept="image/*" max-size="500" type="file" name="Photo"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Full Name (As per Aadhar)<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Full Name" required type="text"  name="Name"  id="Name" ></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">DOB (As per Aadhar)<span style="color:red;"  name="Photo">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter DOB" type="date" required  name="DOB"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Mobile Number<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Mobile Number" required  type="Number"  name="Mobile" id="Mobile"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Emergency Mobile Number<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Emergency Mobile Number" required  type="Number"  name="Emergency"></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Email<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Email" required  type="Email" id="Email" name="Email" ></input></div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Religion<span style="color:red;">*</span></div>
                            <div class="fieldinput">

                                <select   name="Religion" required >
                                    <option value="">Select Religion</option>
                                    <option value="Hindu">Hindu</option>
                                    <option value="Muslim">Muslim</option>
                                    <option value="Sikh">Sikh</option>
                                    <option value="Christian">Christian</option>
                                    <option value="Other">Other</option>
                                </select>

                            </div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Maritial Status<span style="color:red;">*</span></div>
                            <div class="fieldinput">

                                <select  name="Maritial">
                                    <option value="">Select Maritial Status</option>
                                    <option value="Single" required >Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <option value="Divorced">Divorced</option>
                                    <option value="Separated">Separated</option>
                                </select>

                            </div>
                        </div>
                        <div class="field">
                            <div class="fieldhead">Diet<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <select  name="Diet" required >
                                    <option value="">Select Diet</option>
                                    <option value="Non-vegetarian">Non-vegetarian</option>
                                    <option value="Vegetarian">Vegetarian</option>
                                    <option value="Vegetarian">Vegan</option>
                                </select>
                            </div>
                        </div>
                        <div class="field">
                            <div class="fieldhead" >Address<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input placeholder="Enter Address" required  type="Address"  name="Address"></input></div>
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
                            <div class="fieldhead">Aadhar Image<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input  type="file" required  accept="image/*" max-size="500" name="AadharImage"></input></div>
                        </div>
                        <input type="submit" class="button"  id ="verifymebutton" value="Verify Me!">
                        <div class="field" id ="otpfield" style="display: none;">
                            <div class="fieldhead">OTP<span style="color:red;">*</span></div>
                            <div class="fieldinput">
                                <input  type="Password"  name="OTP" onchange="CreateId(Name.value, Email.value, Mobile.value, OTP.value)"  id="OTP"></input></div>
                        </div>
                        <input type="submit" class="button" style="display: none;" id ="createidbutton" value="Create My Health PinPoint">
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
