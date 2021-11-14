<%@page import="Controller.DoctorDAO"%>
<%@page import="Controller.CivilianDAO"%>
<%@page import="Controller.CommonDAO"%>

<%
    
    String UserID = request.getParameter("UserID");
    String Password =  request.getParameter("Password");
    CommonDAO cd = new CommonDAO();
    CivilianDAO cid = new CivilianDAO();
    DoctorDAO dd = new DoctorDAO();
    if(cd.isCorrectLogin(UserID, Password)){
        String url = "./LoginType.jsp?";
        session.setAttribute("UserID", UserID);
        if(cid.isCivilianID(UserID) && !dd.isDoctorID(UserID)){
        session.setAttribute("AccountType", "Civilian");
            url = url+"Civilian=1";
        }

        if(dd.isDoctorID(UserID))
        {
        session.setAttribute("AccountType", "Civilian | Doctor");
       url = url+"CivilianDoctor=1";
        }
        
        response.sendRedirect(url);
        
    }else{
        out.print("<script>alert('Invalid Credential');</script>");
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.include(request, response);
    }

%>