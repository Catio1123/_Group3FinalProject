<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script>
	let dataArea = null;
	window.addEventListener('load', function() {
		dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open('GET', "aaa", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status === 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = showData(xhr.responseText);
			}
		};
		xhr.send();
	})
	function showData(textData) {
		let restaurants = JSON.parse(textData);
		let segment = "<table border='1'>";

		segment += "<tr><th>編號</th><th>名稱</th><th>敘述</th><th>電話</th><th>地址</th><th>分類</th>";
		for (n = 0; n < restaurants.length; n++) {
			let restaurant = restaurants[n];
			segment += "<tr>";
			segment += "<td>" + restaurant.rid + "</td>";
			segment += "<td>" + restaurant.rname + "</td>";
			segment += "<td>" + restaurant.rdes + "</td>";
			segment += "<td>" + restaurant.rtel + "</td>";
			segment += "<td>" + restaurant.radr + "</td>";
			segment += "<td>" + restaurant.rsort + "</td>";
			segment += "</tr>";
		}
		segment += "</table>";
		return segment;

	}
</script>
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
	<h3 align="center"></h3>
	<hr>

	<div align="center">
		<h2>搜尋餐廳</h2>
		<form method="post" action="searchRestaurant">
			餐廳編號:<input type="text" name="rid" /> &nbsp; <br> <input
				type="submit" value="搜尋" />
		</form>
	</div>
	<hr>
	<div align="center">
		<h2>編輯餐廳</h2>
		<form:form method="POST" action="updateRestaurant"
			modelAttribute="restaurant">
			<table>
				<tr>
					<td><form:label path="rid">餐廳編號:</form:label></td>
					<td><form:input path="rid" /></td>
				</tr>
				<tr>
					<td><form:label path="rname">餐廳名稱:</form:label></td>
					<td><form:input path="rname" /></td>
				</tr>
				<tr>
					<td><form:label path="rdes">餐廳敘述:</form:label></td>
					<td><form:input path="rdes" /></td>
				</tr>
				<tr>
					<td><form:label path="rtel">餐廳電話:</form:label></td>
					<td><form:input path="rtel" /></td>
				</tr>
				<tr>
					<td><form:label path="radr">餐廳地址:</form:label></td>
					<td><form:input path="radr" /></td>
				</tr>
				<tr>
					<td><form:label path="rsort">餐廳類別:</form:label></td>
					<td><form:input path="rsort" /></td>
				</tr>
				<tr align="center">
					<td colspan="2"><form:button value="Send">送出</form:button></td>
				</tr>
			</table>
		</form:form>
	</div>
	<hr>

	<div align="center">
		<h2>新增餐廳</h2>
		<form:form action="addRestaurant" method="post"
			modelAttribute="restaurant">
			<table border="0" cellpadding="5">
				<tr>
					<td><form:input type="hidden" path="rid" /></td>
				</tr>
				<tr>
					<tr>
					<td>餐廳名稱:</td>
					<td><form:input path="rname" /></td></tr>
					<tr>
					<td>餐廳敘述:</td>
					<td><form:input path="rdes" /></td></tr>
					<tr>
					<td>餐廳電話:</td>
					<td><form:input path="rtel" /></td></tr>
					<tr>
					<td>餐廳地址:</td>
					<td><form:input path="radr" /></td></tr>
					<tr>
					<td>餐廳類別:</td>
					<td><form:input path="rsort" /></td></tr>
				</tr>
				<td colspan="2" align="center"><input type="submit" value="確定"></td>

			</table>
		</form:form>
	</div>
	<hr>
	<div align="center">
		<h2>刪除餐廳</h2>

		<form method="post" action="deleteRestaurant">
			餐廳編號: <input type="text" name="rid" /> &nbsp; <br> <input
				type="submit" value="刪除" />
		</form>

	</div>


	<br>
	<div id='dataArea' align="center">
		<hr>

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