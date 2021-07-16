<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>食記CRUD</title>
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

<script>
	let dataArea = null;
	window.addEventListener('load', function() {
		dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		// 	alert("aaa");
		xhr.open('GET', "jsoncreator03", true);
		// 	alert("bbb");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status === 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = showData(xhr.responseText);
			}
		};
		xhr.send();
	})
	function showData(textData) {

		let articles = JSON.parse(textData);
		let segment = "<table border='1'>";

		segment += "<tr><th>編號</th><th>餐廳店名</th><th>評分</th><th>種類</th><th>食記連結</th><th>菜系</th><th>所在城市</th>";
		for (n = 0; n < articles.length; n++) {
			let article = articles[n];
			segment += "<tr>";
			segment += "<td>" + article.id + "</td>";
			segment += "<td>" + article.name + "</td>";
			segment += "<td>" + article.rate + "</td>";
			segment += "<td>" + article.foodtype + "</td>";
			segment += "<td width='70'>" + article.url + "</td>";
			segment += "<td>" + article.genre + "</td>";
			segment += "<td>" + article.city + "</td>";
			segment += "</tr>";
		}
		segment += "</table>";
		return segment;

	}
</script>
<meta charset="UTF-8">
<title>文章區 / Articles</title>
</head>
<body>
	<div class="header">
		<div class="container">
			<a href="#" class="navbar-brand scroll-top">Victory</a>
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
						<li><a href="">合作餐廳</a></li>
						<li><a href="">食記文章</a></li>
						<li><a href="admin">管理員</a></li>
					</ul>
				</div>
				<!--/.navbar-collapse-->
			</nav>
			<!--/.navbar-->
		</div>
		<!--/.container-->
	</div>
	<!--/.header-->


	
	<hr>
	<div align="center">
		<h3>由 ID 搜尋單筆</h3>
		<form method="post" action="searchArticle">
			<input type="text" name="id" /> &nbsp; <input type="submit" value="搜尋" />
		</form>
	</div>
	<hr>
<!-- 	<div align="center"> -->
<!-- 		<h3>由 店名 搜尋食記</h3> -->
<%-- 		<form method="post" action="selectArticleByName"> --%>
<!-- 			<input type="text" name="name" /> &nbsp; <input type="submit" value="搜尋" /> -->
<%-- 		</form> --%>
<!-- 	</div> -->
<!-- 	<hr> -->
	<div align="center">
		<h3>編輯單筆食記條目</h3>
		<form:form method="POST" action="updateArticle"
			modelAttribute="articleList">
			<table>
				<tr>
					<td><form:label path="id">食記條目 ID:</form:label></td>
					<td><form:input path="id" /></td>
				</tr>
				<tr>
					<td><form:label path="rate">食記條目 評分:</form:label></td>
					<td><form:input path="rate" /></td>
				</tr>
				<tr>
					<td><form:label path="foodtype">食物類型: </form:label></td>
					<td><form:input path="foodtype" /></td>
				</tr>
				<tr>
					<td><form:label path="url">食記連結: </form:label></td>
					<td><form:input path="url" /></td>
				</tr>
				<tr>
					<td><form:label path="genre">菜系: </form:label></td>
					<td><form:input path="genre" /></td>
				</tr>
				<tr>
					<td><form:label path="city">餐廳所在城市: </form:label></td>
					<td><form:input path="city" /></td>
				</tr>
				<tr>
					<td><form:label path="name">餐廳店名:</form:label></td>
					<td><form:input path="name" /></td>
				</tr>
				<tr>
					<td colspan="2"><form:button value="Send">確定</form:button><input type="reset" value="清除" style="margin:15px;"></td>
				</tr>
			</table>
		</form:form>
	</div>
	<hr>

	<div align="center">
		<h3>新增一筆食記條目</h3>
		<form:form action="addArticle" method="post"
			modelAttribute="articleList">
			<table border="0" cellpadding="5">
				
				<tr>
					<td>食記條目 評分:</td>
					<td><form:input path="rate" /></td>
				</tr>
				<tr>
					<td>食物類型:</td>
					<td><form:input path="foodtype" /></td>
				</tr>
				<tr>
					<td>食記連結:</td>
					<td><form:input path="url" /></td>
				</tr>
				<tr>
					<td>菜系:</td>
					<td><form:input path="genre" /></td>
				</tr>
				<tr>
					<td>餐廳所在城市:</td>
					<td><form:input path="city" /></td>
				</tr>
				<tr>
					<td>餐廳店名:</td>
					<td><form:input path="name" /></td>
				</tr>
				<td colspan="2"><input type="submit" value="新增"></td>

			</table>
		</form:form>
	</div>
	<hr>
	<div align="center">
		<h3>指定食記ID刪除單筆條目</h3>
		<form method="post" action="deleteArticle">
			<input type="text" name="id" /> &nbsp; <input type="submit"
				value="刪除" /> ${hDelete}<br>
		</form>
	</div>

	<hr>
	<h2 align="center">食記一覽</h2>
	<div id='dataArea'></div>

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


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')
	</script>

	<script src="js/vendor/bootstrap.min.js"></script>

	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			// navigation click actions 
			$('.scroll-link').on('click', function(event) {
				event.preventDefault();
				var sectionID = $(this).attr("data-id");
				scrollToID('#' + sectionID, 750);
			});
			// scroll to top action
			$('.scroll-top').on('click', function(event) {
				event.preventDefault();
				$('html, body').animate({
					scrollTop : 0
				}, 'slow');
			});
			// mobile nav toggle
			$('#nav-toggle').on('click', function(event) {
				event.preventDefault();
				$('#main-nav').toggleClass("open");
			});
		});
		// scroll function
		function scrollToID(id, speed) {
			var offSet = 0;
			var targetOffset = $(id).offset().top - offSet;
			var mainNav = $('#main-nav');
			$('html,body').animate({
				scrollTop : targetOffset
			}, speed);
			if (mainNav.hasClass("open")) {
				mainNav.css("height", "1px").removeClass("in").addClass(
						"collapse");
				mainNav.removeClass("open");
			}
		}
		if (typeof console === "undefined") {
			console = {
				log : function() {
				}
			};
		}
	</script>
</body>
</html>