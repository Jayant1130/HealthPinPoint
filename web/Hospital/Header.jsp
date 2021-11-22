<%
        String UserID = (String) session.getAttribute("UserID");
                
        if(UserID == null && !(request.getServletPath().equals("/index.jsp") || request.getServletPath().equals("/login.jsp"))){
            response.sendRedirect("./");
        }
        if(UserID == null && (request.getServletPath().equals("/index.jsp") || request.getServletPath().equals("/login.jsp"))){
           %>
            <nav class="header">
			<div class="header-logo"><img src="img/logo.png"/></div>
			<div class="header-right">
				<div class="link">Home</div>
				<div class="link" onclick="window.location.href='login.jsp'">Login</div>
				<div class="link" onclick="window.location.href='accountType.jsp'">Generate ID</div>
				<div class="link"><img style="width: 69px;" src="img/idlogo.svg"/></div>
			</div>
                        
		</nav>
    <%  
        
        }else{
%>
            <nav class="header">
			<div class="header-logo"><img src="../img/logo.png"/></div>
			<div class="header-right">
				<div class="link">Home</div>
				<div class="link" onclick="window.location.href='../logout.jsp'">Logout</div>
				<div class="link">E-mail: <%=UserID%> </div>
				<div class="link"><img style="width: 69px;" src="../img/idlogo.svg"/></div>
			</div>
                        
		</nav>

<%

        }

%>

<div class="loader" id="loader">
    <div class="loadergif">
        <img src="../img/loader.gif"></img>
    </div>
</div>
<div class="toasterdiv" id="toasterdiv">
<div class="toaster show" id="toastercon"></div>
</div>