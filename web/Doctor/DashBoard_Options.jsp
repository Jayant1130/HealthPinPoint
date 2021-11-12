<div class="options Doctoroption">
    <div class="option <%
         if(request.getServletPath().equals("/Doctor/DashBoard.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard.jsp';setLoader(1);"><span>@</span>Profile</div>
    <div class="option <%
         if(request.getServletPath().equals("/Doctor/DashBoard_DoctorStatitics.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_DoctorStatitics.jsp';setLoader(1);"><span>@</span>Statitics</div>
    <div class="option <%
         if(request.getServletPath().equals("/Doctor/DashBoard_DoctorTreatment.jsp")){
     out.print("active");
     }%>"   onclick="window.location.href='DashBoard_DoctorTreatment.jsp';setLoader(1);"><span>@</span>Treatment</div>
    </div>

