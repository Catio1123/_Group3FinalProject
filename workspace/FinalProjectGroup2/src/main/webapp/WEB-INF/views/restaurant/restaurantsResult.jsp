<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>餐廳查詢</title>


<link rel='stylesheet' href="<c:url value='/css/style2.css' />"
	type="text/css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<meta charset="UTF-8">
<title>Restaurants</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/fontAwesome.css">
<link rel="stylesheet" href="css/hero-slider.css">
<link rel="stylesheet" href="css/owl-carousel.css">
<link rel="stylesheet" href="css/templatemo-style.css">
<link
	href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">
<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>


</head>
<body>


<div class="header">
		<div class="container">
			<a href="#" class="navbar-brand scroll-top">餐廳</a>
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" id="nav-toggle" class="navbar-toggle"
						data-toggle="collapse" data-target="#main-nav">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="<c:url value='/' />">主頁</a></li>
						<li><a href="#">菜單</a></li>
						<li><a href="#">部落格</a></li>
						<li><a href="#">管理員</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</div>
	<!--/.header-->
<br>
	<br>
<div align="center">
<table>
餐廳編號: ${hId}<br/>
餐廳名稱: ${hName}<br/>
餐廳敘述: ${hDes}<br/>
餐廳電話: ${hTel}<br/>
餐廳地址: ${hAdr}<br/>
餐廳類別: ${hSort}<br/>
</table>
<a href="restaurant.controller"><button id="back">確定</button></a><br>
</div>
<br>
	<br>

<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<p>Copyright &copy; 2020 Victory Template</p>
				</div>
				<div class="col-md-4">
					<ul class="social-icons">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-rss"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<p>Design: TemplateMo</p>
				</div>
			</div>
		</div>
	</footer>


</body>
</html>