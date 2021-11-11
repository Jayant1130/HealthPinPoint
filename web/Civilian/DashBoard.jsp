<html>
    <head>
        <title>Health PinPoint</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/footer.css">

        <link rel="stylesheet" href="../css/loader.css">
        <link rel="stylesheet" href="../css/Home.css">
        <link rel="stylesheet" href="../css/login.css">
        <link rel="stylesheet" href="../css/CivilianDashBoard.css">
    </head>
    <body onload="setInterval(Loader, 500); setLoader(0);">
        <%@include file="Header.jsp" %>

        <div class="main">
            <div class="DashBoard">
                <%@include file="DashBoard_Options.jsp" %>
                <div class="profile">
                    <div class="button-header">
                        <div class="button" onclick="getRequestModel();open_model('EntreatyScreen');"> -> Family Entreaty </div>
                        <div class="button" onclick="open_model('EntreatyScreen');"> Update </div>
                        <div class="modelscreen" style="display:none;" id="EntreatyScreen">

                        </div>
                    </div>
                    <div class="profileinfo">
                        <div class="photo">
                            <img src=""/>
                        </div>
                        <div class="profiledetail">
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                            <div class="Detail">
                                <div class="Property">Time Stamp : </div>
                                <div class="Value">Value</diV>                               
                            </div>
                        </div>
                    </div>
                    <div class="profilestatic">
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                        <div class="staticwindow">
                            <div class="staticwindowheader">Header Static</div>
                            <div class="staticwindowinfo">25<div class="staticpercent">%</div></div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>	
    </body>
</html>
<script src="../js/index.js"></script>
<script src="../js/signup.js"></script>
<script src="../js/CivilianDashBoard.js"></script>
