<%@page import="Model.HealthIssue"%>
<%@page import="Model.Civilian"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.Treatement"%>
<%@page import="java.util.List"%>
<%
    CivilianDAO cid = new CivilianDAO();
    DoctorDAO dd = new DoctorDAO();
    HealthIssue h = cid.getHealthIssuesByID(Integer.parseInt(request.getParameter("HealthIssueID")));
    String HealthID = (String) session.getAttribute("UserID");
    Doctor d = dd.getDoctorByHealthID(HealthID);
    
%>
<div class="button-header">
    <div class="button" onclick="open_model('addTreatment');"> + Add Treatment </div>
    <div class="modelscreen" style="display:none;" id="addTreatment">
            <div class="model">
                            <form id="addTreatmentForm<%=h.getHealthIssueID()%>" onsubmit="addTreatment(document.getElementById('addTreatmentForm<%=h.getHealthIssueID()%>'),'<%=h.getHealthID()%>', T<%=h.getHealthIssueID()%>, '<%=h.getHealthIssueID()%>');return false;" method="post">
                                <div class="modelHeader">Add Treatement</div>
                                <input type="hidden" value="<%=h.getHealthIssueID()%>" name="HealthIssueID"/>
                                <input type="hidden" value="<%=h.getHealthID()%>" name="HealthID"/>
                                <input type="hidden" value="0" name="HospitalID"/>
                                <input type="hidden" value="<%=d.getDoctorID()%>" name="DoctorID"/>
                                <div class="modelContent">
                                 <div class="field">
			<div class="fieldhead">Diagnosis<span style="color:red;">*</span></div>
			<div class="fieldinput">
                            <textarea placeholder="Diagnosis" required name="Diagnosis" ></textarea></div>
			</div>
			<div class="field">
			<div class="fieldhead">Medicine Prescribed<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Medicine Prescribed" required name="MedicinePrescribed" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Detail<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Detail" required  name="Detail" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Advice<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Advice" required  name="Advice" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Operation<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Operation" required  name="Operation" type="text"></input></div>
			</div>
			<div class="field">
			<div class="fieldhead">Operation Detail<span style="color:red;">*</span></div>
			<div class="fieldinput">
				<input placeholder="Operation Detail" name="OperationDetail" required  type="text"></input></div>
			</div>
                                </div>
                                <div class="modelFooter">
                                    <button type="submit" class="button" onclick="" id="AddFamilyModelAdd"  style="border-radius: 10px;">Add Health Issue</button>
                                    <div class="button" id="AddFamilyModelAdd"  style="border-radius: 10px" onclick="close_model('addTreatment')">Close</div>
                                </div>
                            </form>
                        </div>
              
    </div>
</div>
<%
    CivilianDAO cd = new CivilianDAO();
    List<Treatement> treatements = cd.getTreatementsByHealthIsssueID(Integer.parseInt(request.getParameter("HealthIssueID")));
    if (treatements.size() == 0) {
        out.print("No Treatement found");
    }
    for (Treatement t : treatements) {
%>

<div class="TCard">
    <div class="Detail">
        <div class="Property">Diagnosis : </div>
        <div class="Value"><%=t.getDiagnosis()%></diV>                               
    </div>
    <div class="Detail">
        <div class="Property">Medicine Prescribed</div>
        <div class="Value"><%=t.getMedicinePrescribed()%></diV>                               
    </div>
    <div class="Detail">
        <div class="Property">Detail</div>
        <div class="Value"><%=t.getDetail()%></diV>                               
    </div>
    <div class="Detail">
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
        Doctor d1 = dd.getDoctorByID(t.getDoctorID());
        Civilian c1 = cd.getCivilianByID(d1.getHealthID());
    %> 
    <div class="Detail">
        <div class="Property">Doctor Name : </div>
        <div class="Value">Dr. <%=c1.getName()%></diV>                               
    </div> 
</div>  
<%
    }
%>
<div class="TreatmentButton" Style="margin-top: 5px;"onclick="
    document.getElementById('T<%=request.getParameter("HealthIssueID")%>').style.height='0px';
    document.getElementById('T<%=request.getParameter("HealthIssueID")%>').innerHTML='';
    ">Hide Treatments</div>
