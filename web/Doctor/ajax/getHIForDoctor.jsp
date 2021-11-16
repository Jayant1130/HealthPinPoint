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
<div class="button-header">
    <div class="button" onclick="open_model('addnewhealthissue');"> + Add New Health Issue </div>
    <div class="modelscreen" style="display:none;" id="addnewhealthissue">

              <div class="model">
                            <form id="addNewHealthIssue" onsubmit="addNewHealthIssue(document.getElementById('addNewHealthIssue'), '<%=HealthID%>');return false;" method="post">
                                <div class="modelHeader">Add New Health Issue</div>
                                <div class="modelContent">
                                 <div class="field">
			<div class="fieldhead">Complain<span style="color:red;">*</span></div>
			<div class="fieldinput">
                            <textarea placeholder="Complain" required name="Complain" ></textarea></div>
			</div>
			<div class="field">
			<div class="fieldhead">Health Issue Duration<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Day" required name="Duration" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Disease<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Disease" required  name="Disease" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Sensation<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Sensation" required  name="Sensation" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Origin of Cause<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Origin of Cause" required  name="OriginofCause" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Trouble Table <span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Table" name="TroubleTable" required  type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldinput">
				<input  name="Major" type="checkbox" value="1">Hereditary/ Major Disease<span style="color:red;">(Tick If Disease is Hereditary)</span></input></div>
			</div>
                                </div>
                                <div class="modelFooter">
                                    <button type="submit" class="button" onclick="" id="AddFamilyModelAdd"  style="border-radius: 10px;">Add Health Issue</button>
                                    <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('addnewhealthissue')">Close</div>
                                </div>
                            </form>
                        </div>
        
    </div>
</div>
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
            <div class="button" onclick="getUpdateHealthModel(<%=hi.getHealthIssueID()%>);open_model('updatehealthissue');"> Update Health Issue</div>
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
        <div class="TreatmentButton" onclick="getTreatments(T<%=hi.getHealthIssueID()%>,'<%=hi.getHealthIssueID()%>');
             document.getElementById('T<%=hi.getHealthIssueID()%>').style.height='auto';">Show Treatments</div>
        <div class="Treatments"  id="T<%=hi.getHealthIssueID()%>">
            
        </div>
    </div>
    <%
        }
    %>

</div>
<% }%>