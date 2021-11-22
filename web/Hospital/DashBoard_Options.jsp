<div class="options Doctoroption">
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard.jsp';setLoader(1);"><span>@</span>Profile</div>
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard_HoapitalPatient.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_HoapitalPatient.jsp';setLoader(1);"><span>@</span>Patient</div>
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard_AdmitPatient.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_AdmitPatient.jsp';setLoader(1);"><span>@</span>Admit new patient</div>
    </div>

