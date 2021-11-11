<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.FamilyMember"%>
<%
    FamilyMember fm = new FamilyMember();
    String HealthID = (String) session.getAttribute("UserID");
    fm.setHealthID(HealthID);
    fm.setRelationship(request.getParameter("Relationship"));
    fm.setRelativeHealthID(request.getParameter("aadhar"));
    CivilianDAO cd = new CivilianDAO();
    int status = cd.isFamilyEntreatyExist(fm); 
    if(cd.isAadharExist(fm.getRelativeHealthID())){
    if(HealthID.equals(fm.getRelativeHealthID())){
        out.print("<script>"
                + "alert('You can not add yourself!');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
    }else if(status == -1){
        if(cd.AddFamilyEntreatyID(fm) > 0){
        out.print("<script>"
                + "alert('Requested Sended !');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
            
        }else{
        out.print("<script>"
                + "alert('Unable to Send Request!');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
        }
    }else if(status == 0){
        out.print("<script>"
                + "alert('Already Requested but still pending !');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
    }else if(status == 1){
        out.print("<script>"
                + "alert('Already Added in your family member');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
    }
    }else{
        out.print("<script>"
                + "alert('Given aadhar card not exist in the System!');"
                + "window.location.href='DashBoard_FamilyMember.jsp';"
                + "</script>");
    }
%>