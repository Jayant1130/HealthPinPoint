<%@page import="Model.Login"%>
<%@page import="Controller.CommonDAO"%>
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
    CommonDAO cd = new CommonDAO();
    Login l = new Login();
    l.setUserID(request.getParameter("aadhar"));
    l.setPassword(request.getParameter("password"));
    if(cid.CivilianGenerateID(c)>0 && cd.AddLoginID(l)> 0){
        out.print("<script>alert('User Added');</script>");
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.include(request, response);
    }
    out.print(request);
%>