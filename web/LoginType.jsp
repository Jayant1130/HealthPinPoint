<html>
    <head>
        <title>Health PinPoint</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">

        <link rel="stylesheet" href="css/loader.css">
        <link rel="stylesheet" href="css/Home.css">
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include file="Header.jsp" %>
        <a href="LoginType.jsp"></a>

        <div class="main">
            <%
            if(request.getParameter("Civilian") != null){
                response.sendRedirect("Civilian/DashBoard.jsp");
            }
            if(request.getParameter("CivilianDoctor") != null){
            %>
            <a href="Civilian/Home.jsp">Login As Civilian </a>
            <a href="Doctor/Home.jsp">Login As Doctor</a>
            <%
            }
            %>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="js/index.js"></script>