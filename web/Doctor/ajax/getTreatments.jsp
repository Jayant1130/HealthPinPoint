<%@page import="Model.Civilian"%>
<%@page import="Model.Doctor"%>
<%@page import="Controller.DoctorDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.Treatement"%>
<%@page import="java.util.List"%>
<div class="button-header">
    <div class="button" onclick="open_model('addTreatment');"> + Add Treatment </div>
    <div class="modelscreen" style="display:none;" id="addTreatment">

              
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
<div class="TreatmentButton" Style="margin-top: 5px;"onclick="
    document.getElementById('T<%=request.getParameter("HealthIssueID")%>').style.height='0px';
    document.getElementById('T<%=request.getParameter("HealthIssueID")%>').innerHTML='';
    ">Hide Treatments</div>
