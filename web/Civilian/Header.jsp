<nav class="header">
    <div class="header-logo"><img src="../img/logo.png"/></div>
    <div class="header-right">
        <div class="link">Home</div>
        <div class="link" onclick="window.location.href = 'login.jsp'">Login</div>
        <div class="link" onclick="window.location.href = 'accountType.jsp'">Generate ID</div>
        <div class="link">Facility</div>
        <div class="link">Contact</div>
        <div class="link"><img style="width: 69px;" src="../img/idlogo.svg"/></div>
    </div>
    <%
        String UserID = (String) session.getAttribute("UserID");
    %>
</nav>

<div class="loader" id="loader">
    <div class="loadergif">
        <img src="../img/loader.gif"></img>
    </div>
</div>
