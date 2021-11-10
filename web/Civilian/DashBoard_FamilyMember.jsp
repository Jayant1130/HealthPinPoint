<%@page import="Model.Civilian"%>
<%@page import="Model.FamilyMember"%>
<%@page import="java.util.List"%>
<%@page import="Controller.CivilianDAO"%>
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
        <link rel="stylesheet" href="../css/DashBoardScreen_FamilyMember.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include file="Header.jsp" %>
       
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="button-header">
                    <div class="button">+ Add Family Member</div>
                    <div class="modelscreen" id="AddFamilyModel">
                        <div class="model">
                            <div class="modelHeader">Add Your Family Member</div>
                            <div class="modelContent">
                                <div class="field">
			<div class="fieldhead">Relative's Aadhar Card Number <span style="color:red;">*</span></div>
			<div class="fieldinput"><input placeholder="Relative's Aadhar Card Number" type="text" name="aadhar"></input></div>
                        </div>
                                <div class="field">
			<div class="fieldhead">OTP <span style="color:red;">*</span></div>
			<div class="fieldinput"><input placeholder="One time Password" type="text" name="OTP"></input></div>
                        </div>
                            </div>
                            <div class="modelFooter">
                                <div class="button" id="AddFamilyModelNext" style="border-radius: 10px;display: none;">Validate</div>
                                <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px"> Add</div>
                                <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px"> Close</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="DashBoardScreen_FamilyMember">
                    
                    <%
                    CivilianDAO cd = new CivilianDAO(); 
                    String HealthID = (String) session.getAttribute("UserID");
                   
                    List<FamilyMember> familymembers = cd.getFamilyMembersByHealthID(HealthID);
                    for(FamilyMember fm : familymembers){
                        Civilian c = cd.getCivilianByID(HealthID);
                        
                    %>
                    <div class="FCard">
                        <div class="FCardHead"><%=c.getName()%></div>
                        <div class="FCardInfo">
                            <div class="FCardPhoto">
                                <img src="<%=c.getPhoto()%>">
                            </div>
                            <div class="FCardInfom">
                                <div class="Detail">
                                    <div class="Property">Age : </div>
                                    <div class="Value">25 Year</diV>                               
                                </div>
                                <div class="Detail">
                                    <div class="Property">Address : </div>
                                    <div class="Value"><%=c.getAddress()%></diV>                               
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
                
            </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="../js/index.js"></script>