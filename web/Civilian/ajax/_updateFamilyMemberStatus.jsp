<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.FamilyMember"%>
<%
    FamilyMember fm = new FamilyMember();
    String HealthID = (String) session.getAttribute("UserID");
    fm.setHealthID(request.getParameter("aadhar"));
    fm.setRelativeHealthID(HealthID);
    fm.setStatus(Integer.parseInt(request.getParameter("status")));
    CivilianDAO cd = new CivilianDAO();
    if(cd.updateFamilyMemberStatus(fm) > 0){
        if(fm.getStatus() == 1){
            out.print("Request Accepted");
        }
    }else{
        if(fm.getStatus() == 1){
            out.print("Unable to Accept");
        }
    }
%>