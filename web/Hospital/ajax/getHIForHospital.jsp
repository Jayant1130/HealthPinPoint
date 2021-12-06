<%@page import="Controller.CivilianDAO"%>
<%@page import="java.util.List"%>
<%@page import="Model.Civilian"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Model.Treatement"%>
<%@page import="Model.HealthIssue"%>
<%
    CivilianDAO cd = new CivilianDAO();
    String HealthID = request.getParameter("HealthID");
    List<HealthIssue> healthIssues = cd.getHealthIssuesByHealthID(HealthID);
    Civilian c = cd.getCivilianByID(HealthID);
    if (c == null || HealthID == null) {
        out.print("ID not found");
    } else {

%> 
<div class="profileinfo">

    <div class="profiledetail">
        <div class="Detail">
            <div class="Property">Name : </div>
            <div class="Value"><%=c.getName()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">DOB : </div>
            <div class="Value">  <%=c.getDOB()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">Diet : </div>
            <div class="Value"><%=c.getDiet()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">Marital Status : </div>
            <div class="Value"><%=c.getMaritalStatus()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">Religion : </div>
            <div class="Value"><%=c.getReligion()%></diV>                               
        </div>
    </div>
</div>
<%
    if (healthIssues.size() == 0) {
        out.print("As No Health Issues Found Patient is Fit");
    }
%>
<div class="DashBoardScreen_HealthIssue">
    <%
        for (HealthIssue hi : healthIssues) {
    %>
    <div class="HiCard">
        <div class="HeadDiv">
            <%=hi.getComplaint()%>
            <div class="button" onclick="getUpdateHealthModelH(<%=hi.getHealthIssueID()%>);open_model('updatehealthissue');"> Update Health Issue</div>
            <div class="modelscreen" style="display:none;" id="updatehealthissue">

            </div>
        </div>
        <div class="Detail">
            <div class="Property">Time Stamp : </div>
            <div class="Value"><%=hi.getDateTime()%></diV>                               
        </div><div class="Detail">
            <div class="Property">Duration :</div>
            <div class="Value"><%=hi.getDuration()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">Diseases : </div>
            <div class="Value"><%=hi.getDiseases()%></diV>                               
        </div>
        <div class="Detail">
            <div class="Property">Origin of Cause :</div>
            <div class="Value"><%=hi.getOriginOfCause()%></diV>                               
        </div><div class="Detail">
            <div class="Property">Trouble Table :</div>
            <div class="Value"><%=hi.getTroubleTable()%></diV>                               
        </div>
        <div class="TreatmentButton" onclick="getTreatmentsH(T<%=hi.getHealthIssueID()%>,'<%=hi.getHealthIssueID()%>');
             document.getElementById('T<%=hi.getHealthIssueID()%>').style.height='auto';">Show Treatments</div>
        <div class="Treatments"  id="T<%=hi.getHealthIssueID()%>">
            
        </div>
    </div>
    <%
        }
    %>

</div>
<% }%>