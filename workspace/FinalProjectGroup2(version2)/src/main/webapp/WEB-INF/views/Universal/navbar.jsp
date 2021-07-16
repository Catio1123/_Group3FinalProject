<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<title>訂餐趣 - 頭</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

        <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>

<c:choose>
<c:when test="${not empty CurrentUser}">

<c:set var="currentaccount" scope="session" value="${CurrentUser.account}"/>
<c:set var="currentname" scope="session" value="${CurrentUser.customerName}"/>
<c:set var="loginorout" scope="session" value="登出"/>
</c:when>

<c:otherwise>
<c:set var="currentaccount" scope="session" value="訪客帳號"/>
<c:set var="currentname" scope="session" value="訪客"/>
<c:set var="loginorout" scope="session" value="會員登入"/>
</c:otherwise>
</c:choose>

<div class="header">
        <div class="container">
<!--         	<div align="right"><a href="#"><h3>會員登入</h3></a></div> -->
<div id="myAccount" style="visibility:hidden" align="right" >
                        <a href="<c:url value="/member/gotoCustomerHomePage"/>">
                            <h3>👥我的帳號</h3>
                        </a>
                    </div>
        	<div align="right" id="logoutHref" style="visibility:hidden"><a  href="<c:url value="/member/logout"/>" ><h3>登出</h3></a></div>
        	<div align="right" id="loginHref"  style="visibility:hidden"><a href="<c:url value="/member"/>"><h3>👥登入</h3></a></div>
        	
        	
        	<br><div class="heading" align="center"><img src="${pageContext.request.contextPath}/templatemo_507_victory/img/LOGO4.png"></div>
        	<br><br>
            <h3>你好，${currentname}，歡迎來到訂餐趣！</h3>
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="navbar-header">
                    <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!--/.navbar-header-->
                <div id="main-nav" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
						<li><a href="home"><h3>🏠首頁</h3></a></li>
<!-- 						<li><a href="index"><h3>👥會員</h3></a></li> -->
						<li><a href="menu"><h3>☎️訂單</h3></a></li>
						<li><a href="blog"><h3>📚食記</h3></a></li>
						<li><a href="res"><h3>🍽️餐廳</h3></a></li>
						<li><a href="dish"><h3>🍄營養</h3></a></li>
						<li><a href="couponIndex"><h3>🈹優惠</h3></a></li>
                    </ul>
                </div>
                <!--/.navbar-collapse-->
            </nav>
            <!--/.navbar-->
        </div>
        <!--/.container-->
    </div>
    <!--/.header-->
<script>
var currentUser = "${CurrentUser}";
var customerName = "${CurrentUser.customerName}";

window.onload = function(){

if("${loginSuccess}" == "登入成功!"){
// 	alert("${name}" + "," + "歡迎回來!");
	Swal.fire("${name}" + "," + "歡迎回來!");
}


// 有登入:隱藏登入標籤 & 沒登入:隱藏登出標籤，秀登入標籤
var logoutHref = document.getElementById("logoutHref");
var loginHref = document.getElementById("loginHref");
var myAccount = document.getElementById("myAccount");

	if (!customerName) {
			logoutHref.hidden = true;
			myAccount.hidden = true;
			loginHref.style.visibility = "visible";
		}
		if (customerName) {
			logoutHref.style.visibility = "visible";
			myAccount.style.visibility = "visible";
			loginHref.hidden = true;
		}
}
</script>
</body>
</html>