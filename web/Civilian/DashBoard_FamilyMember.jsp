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
                    <div class="button" onclick="open_model('AddFamilyModel')">+ Add Family Member</div>
                    <div class="modelscreen" style="display:none;" id="AddFamilyModel" >
                        <div class="model">
                            <form action="_AddEntreaty.jsp" method="post">
                                <div class="modelHeader">Entreaty Your Family Member</div>
                                <div class="modelContent">
                                    <div class="field">
                                        <div class="fieldhead">Relative's Aadhar Card Number <span style="color:red;">*</span></div>
                                        <div class="fieldinput"><input placeholder="Relative's Aadhar Card Number" type="text" name="aadhar"></input></div>
                                    </div>
                                    <div class="field">
                                        <div class="fieldhead">Relationship<span style="color:red;">*</span></div>
                                        <div class="fieldinput"><input placeholder="Relationship" type="text" name="Relationship"></input></div>
                                    </div>
                                </div>
                                <div class="modelFooter">
                                    <button type="submit" class="button" id="AddFamilyModelAdd"  style="border-radius: 10px;">Entreaty</button>
                                    <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('AddFamilyModel')">Close</div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="button" onclick="getRequestModel();open_model('EntreatyScreen');"> -> Family Entreaty </div>
                    <div class="modelscreen" style="display:none;" id="EntreatyScreen">
                        
                    </div>
                </div>

                <div class="DashBoardScreen_FamilyMember">

                    <%
                                    CivilianDAO cd = new CivilianDAO();
                                    String HealthID = (String) session.getAttribute("UserID");
                        List<FamilyMember> familymembers = cd.getFamilyMembersByHealthIDandStatus(HealthID, 1);
                        if (familymembers.size() == 0) {
                    %>
                    No Family Member Added Now, Click on "Add Family Member" button for add you family member in your health.                        
                    <%
                        }
                        for (FamilyMember fm : familymembers) {
                            Civilian c = cd.getCivilianByID(fm.getRelativeHealthID());
                    %>
                    <div class="FCard">
                        <div class="FCardHead"><%=c.getName()%></div>
                        <div class="FCardInfo">
                            <div class="FCardPhoto">
                                <img src="<%=c.getRPhoto()%>">
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
<script src="../js/signup.js"></script>
<script src="../js/CivilianDashBoard.js"></script>
