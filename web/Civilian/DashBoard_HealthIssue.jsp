<%@page import="Model.Civilian"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.Treatement"%>
<%@page import="Model.HealthIssue"%>
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
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%
        CivilianDAO  cd  = new CivilianDAO();
        String HealthID = (String) session.getAttribute("UserID");
        List<HealthIssue> healthIssues = cd.getHealthIssuesByHealthID(HealthID);
        
        %>
        <%@include file="Header.jsp" %>
        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="DashBoardScreen_HealthIssue">
                    <%
                        if(healthIssues.size()==0){
            out.print("No HealthIsse");
        }
                    for(HealthIssue hi : healthIssues){
                        
                    %>
                    <div class="HiCard">
                        <div class="HeadDiv"><%=hi.getComplaint()%></div>
                        <div class="Detail">
                            <div class="Property">Time Stamp : </div>
                            <div class="Value"><%=hi.getDateTime()%></diV>                               
                        </div><div class="Detail">
                            <div class="Property">Duration :</div>
                            <div class="Value"><%=hi.getDuration()%></diV>                               
                        </div><div class="Detail">
                            <div class="Property">Diseases : </div>
                            <div class="Value"><%=hi.getDiseases()%></diV>                               
                        </div><div class="Detail">
                            <div class="Property">Origin of Cause :</div>
                            <div class="Value"><%=hi.getOriginOfCause()%></diV>                               
                        </div><div class="Detail">
                            <div class="Property">Trouble Table :</div>
                            <div class="Value"><%=hi.getTroubleTable()%></diV>                               
                        </div>
                        <div class="TreatmentButton">Treatments</div>
                        <div class="Treatments">
                            <%
                               
                            List<Treatement> treatements = cd.getTreatementsByHealthIsssueID(hi.getHealthIssueID());
                            
                            for(Treatement t : treatements){
                                
                            %>
                            <div class="TCard">
                                <div class="Detail">
                                    <div class="Property">Diagnosis : </div>
                                    <div class="Value"><%=t.getDiagnosis()%></diV>                               
                                </div><div class="Detail">
                                    <div class="Property">Medicine Prescribed</div>
                                    <div class="Value"><%=t.getMedicinePrescribed()%></diV>                               
                                </div><div class="Detail">
                                    <div class="Property">Detail</div>
                                    <div class="Value"><%=t.getDetail()%></diV>                               
                                </div><div class="Detail">
                                    <div class="Property">Advice : </div>
                                    <div class="Value"><%=t.getAdvice()%></diV>                               
                                </div>
                                <%
                                if(t.getOperation() != null){
                                %>
                                <div class="Detail">
                                    <div class="Property">Operation : </div>
                                    <div class="Value"><%=t.getOperation()%></diV>                               
                                </div> 
                                <div class="Detail">
                                    <div class="Property">Operation Detail: </div>
                                    <div class="Value"><%=t.getOperationDetail()%></diV>                               
                                </div> 
                                
                               <%
                                }
                               
                                DoctorDAO dd = new DoctorDAO();
                                Doctor d = dd.getDoctorByID(t.getDoctorID());
                                Civilian c = cd.getCivilianByID(d.getHealthID());
                                %> 
                                <div class="Detail">
                                    <div class="Property">Doctor Name : </div>
                                    <div class="Value">Dr. <%=c.getName()%></diV>                               
                                </div> 
                                
                            </div>  
                            <%
                            }
                            %>
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