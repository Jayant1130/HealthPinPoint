<div class="options">
    <div class="option <%
         if(request.getServletPath().equals("/Civilian/DashBoard.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard.jsp';setLoader(1);"><span>@</span>Profile</div>
    <div class="option <%
         if(request.getServletPath().equals("/Civilian/DashBoard_HealthIssue.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_HealthIssue.jsp';setLoader(1);"><span>@</span>Health Issue</div>
    <div class="option <%
         if(request.getServletPath().equals("/Civilian/DashBoard_FamilyMember.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_FamilyMember.jsp';setLoader(1);"><span>@</span>Family Members</div>
    <div class="option<%
         if(request.getServletPath().equals("/Civilian/DashBoard_CurrentHealthIssue.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_CurrentHealthIssue.jsp';setLoader(1);"><span>@</span>Current Health Issue</div>
</div>

