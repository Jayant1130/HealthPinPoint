<div class="options Doctoroption">
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard.jsp';setLoader(1);"><span>@</span>Profile</div>
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard_HospitalPatient.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_HospitalPatient.jsp';setLoader(1);"><span>@</span>Patient</div>
    <div class="option <%
         if(request.getServletPath().equals("/Hospital/DashBoard_HospitalDoctor.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_HospitalDoctor.jsp';setLoader(1);"><span>@</span>Doctor</div>
    </div>

