<%@page import="Controller.CivilianDAO"%>
<%@page import="Controller.CommonDAO"%>
<%
    
    String UserID = request.getParameter("UserID");
    String Password =  request.getParameter("Password");
    CommonDAO cd = new CommonDAO();
    CivilianDAO cid = new CivilianDAO();
    if(cd.isCorrectLogin(UserID, Password)){
        String url = "./LoginType.jsp?";
        if(cid.isCivilianID(UserID)){
            url = url+"Civilian=1";
        }
        
        response.sendRedirect(url);
        
    }else{
        out.print("<script>alert('Invalid Credential');</script>");
        RequestDispatcher rd=request.getRequestDispatcher("index.jsp");  
        rd.include(request, response);
    }

%>