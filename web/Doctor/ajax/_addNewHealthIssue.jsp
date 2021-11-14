<%@page import="Controller.CivilianDAO"%>
<%@page import="Model.HealthIssue"%>
<%
            HealthIssue u = new HealthIssue();
            u.setHealthID(request.getParameter("HealthID"));
            u.setComplaint(request.getParameter("Complain"));
            u.setDuration(request.getParameter("Duration"));
            u.setDiseases(request.getParameter("Disease"));
            u.setDiseases(request.getParameter("Disease"));
            u.setOriginOfCause(request.getParameter("OriginofCause"));
            u.setTroubleTable(request.getParameter("TroubleTable"));
            if(request.getParameter("Major") == null){
                u.setMajor(0);
            }else{
            u.setMajor(Integer.parseInt(request.getParameter("Major")));
            }
            CivilianDAO cd = new CivilianDAO();
            if(cd.AddHealthIssue(u)>0){
                out.print("Health Issue Added");
            }else{
                out.print("Unable to Health Issue");
            }



%>