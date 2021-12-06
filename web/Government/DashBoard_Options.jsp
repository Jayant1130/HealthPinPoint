<div class="options Doctoroption">
    <div class="option <%
         if(request.getServletPath().equals("/Government/DashBoard.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard.jsp';setLoader(1);"><span>@</span>Welcome</div>
     <div class="option <%
         if(request.getServletPath().equals("/Government/DashBoard_VerifyHospital.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_VerifyHospital.jsp';setLoader(1);"><span>@</span>Verify Hospital</div>
     <div class="option <%
         if(request.getServletPath().equals("/Government/DashBoard_VerifyDoctor.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_VerifyDoctor.jsp';setLoader(1);"><span>@</span>Verify Doctor</div>
    </div>

