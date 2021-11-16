<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.Treatement"%>
<%

    Treatement u = new Treatement();
    u.setHealthIssueID(Integer.parseInt(request.getParameter("HealthIssueID")));
    u.setDoctorID(Integer.parseInt(request.getParameter("DoctorID")));
    u.setHospitalID(Integer.parseInt(request.getParameter("HospitalID")));
    u.setDiagnosis(request.getParameter("Diagnosis"));
    u.setMedicinePrescribed(request.getParameter("MedicinePrescribed"));
    u.setDetail(request.getParameter("Detail"));
    u.setAdvice(request.getParameter("Advice"));
    u.setOperation(request.getParameter("Operation"));
    u.setOperationDetail(request.getParameter("OperationDetail"));
    CivilianDAO cid = new CivilianDAO();
    if(cid.addTreatement(u)>0){
        out.print("Treatement Added");
    
    }else{
        out.print("Unable to add Treatement");
    }


%>