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
    if (c == null) {
        out.print("id not found");
    } else {

%> 
<div class="button-header">
    <div class="button" onclick="open_model('addnewhealthissue');"> Update </div>
    <div class="modelscreen" style="display:none;" id="addnewhealthissue">

              <div class="model">
                            <form action="_AddHealthIssue.jsp" method="post">
                                <div class="modelHeader">Add New Health Issue</div>
                                <div class="modelContent">
                                 <div class="field">
			<div class="fieldhead">Complain<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<textarea placeholder="Complain" readonly >
				</textarea></div>
			</div>
			<div class="field">
			<div class="fieldhead">Health Issue Duration<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Day" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Disease<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Disease" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Sensation<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Sensation" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Origin of Cause<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Origin of Cause" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Trouble Table<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Table" type="text"></input></div>
			</div>
                                </div>
                                <div class="modelFooter">
                                    <button type="submit" class="button" id="AddFamilyModelAdd"  style="border-radius: 10px;">Add Health Issue</button>
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
        <div class="TreatmentButton">Show Treatments</div>
        <div class="Treatments">
            <%

                List<Treatement> treatements = cd.getTreatementsByHealthIsssueID(hi.getHealthIssueID());

                for (Treatement t : treatements) {

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
                    if (t.getOperation() != null) {
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
                    Civilian c1 = cd.getCivilianByID(d.getHealthID());
                %> 
                <div class="Detail">
                    <div class="Property">Doctor Name : </div>
                    <div class="Value">Dr. <%=c1.getName()%></diV>                               
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
<% }%>