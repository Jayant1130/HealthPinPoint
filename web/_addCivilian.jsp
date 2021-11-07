<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.Civilian"%>
<%
    Civilian c = new Civilian();
    c.setCityID(Integer.parseInt(request.getParameter("City")));
    c.setHealthID(request.getParameter("aadhar"));
    c.setName(request.getParameter("Name"));
    c.setMobileNo(request.getParameter("Mobile"));
    c.setAddress(request.getParameter("Address"));
    c.setDOB(request.getParameter("DOB"));
    c.setEmergencyNo(request.getParameter("Emergency"));
    c.setPhoto(request.getParameter("Photo"));
    c.setAadharImage(request.getParameter("AadharImage"));
    c.setEmail(request.getParameter("Email"));
    c.setMaritalStatus(request.getParameter("Maritial"));
    c.setReligion(request.getParameter("Religion"));
    c.setDiet(request.getParameter("Diet"));
    CivilianDAO cid = new CivilianDAO();
    if(cid.CivilianGenerateID(c)>0){
        out.print("<script>alert('User Added');<script>");
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.include(request, response);
    }
    out.print(request);
%>