<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>I Podcast</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value='/assets/css/main.css' />" />
</head>
<body class="is-preload no-sidebar">
	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper">
			<header id="header" class="container">

				<!-- Logo -->
				<div id="logo">
					<h1>
						<a href="<c:url value='/' />">I Podcast</a>
					</h1>
					<span>by group 3</span>
				</div>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="<c:url value='/kevin' />">普通用戶</a></li>
						<li><a href="<c:url value='/catio' />">Podcaster</a></li>
						<li><a href="<c:url value='/gavin' />">資源共享</a></li>
						<li><a href="<c:url value='/bill' />">線下活動</a></li>
						<li class="current"><a href="<c:url value='/wayne' />">廣告</a></li>
						<li><a href="<c:url value='/ben' />">論壇</a></li>

					</ul>
				</nav>
			</header>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div>
				<h3><a href= "<c:url value='/list_users'/>">List All User</a></h3>
				<h3><a href= "<c:url value='/login'/>">Login</a></h3>
				
				
				</div>
				<div id="content">
				
					<!-- Content -->
					<h2>廣告商</h2>
					<form action="<c:url value='/insert/${company.id}'/>" method="post" >
						<table>
							<tr>
								<td>廣告商:</td>
								<td><input type="text" name="company" value="${company.name }" readonly="readonly" /></td>
							</tr>
							<tr>
								<td>廣告內容:</td>
								<td><input type="text" name="text"  /></td>
							</tr>
						<tr>
								<td>贊助連結:</td>
								<td><input type="text" name="url"  /></td>
							</tr>
							<tr>
								<td>贊助金額:</td>
								<td><input type="text" name="sponsorshipAmount"  /></td>
							</tr>
							<tr>
								<td ><input type="submit" value="新增"></td>
							</tr>
						</table>
					</form>
					<h2>歡迎${company.name }</h2>
					
					<h2>廣告商列表</h2>
					<table>

						<tr>
							<th>編號</th>
							<th>廣告商</th>
							<th>廣告內容</th>
							
							<th colspan = 2>指令</th>
						</tr>
						<c:forEach var="ad" items="${ad}" >
							<tr>
								<td>${ad.id}</td>
								<td>${ad.company}</td>
								<td>${ad.text}</td>
								<td>${ad.url}</td>
								
								<td><a href="<c:url value='/updateProcess/${ad.id}/${company.id}'/>">修改</a></td>
								
								<td><a href= "<c:url value='/delete/${ad.id}/${company.id}'/>">刪除</a></td>
							
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>


		<!-- Footer -->
		<div id="footer-wrapper">
			<footer id="footer" class="container">
				<div class="row">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組長</h3>
							<ul class="style2">
								<li><a href="#">19 張大品</a></li>

							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>技術長</h3>
							<ul class="style2">
								<li><a href="#">33 廖帝凱</a></li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組員</h3>
							<ul class="style2">
								<li><a href="#">32 洪豪均</a></li>
								<li><a href="#">10 陳宣佑</a></li>
								<li><a href="#">21 許佳崴</a></li>
								<li><a href="#">37 程偉勝</a></li>

							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Contact -->
						<section class="widget contact last">
							<h3>Contact Us</h3>
							<ul>
								<li><a href="#" class="icon brands fa-twitter"><span
										class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands fa-facebook-f"><span
										class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands fa-instagram"><span
										class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands fa-dribbble"><span
										class="label">Dribbble</span></a></li>
								<li><a href="#" class="icon brands fa-pinterest"><span
										class="label">Pinterest</span></a></li>
							</ul>

						</section>

					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li>
								<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>

	</div>

	<!-- Scripts -->

	<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js' />"></script>
	<script src="<c:url value='/assets/js/browser.min.js' />"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js' />"></script>
	<script src="<c:url value='/assets/js/util.js' />"></script>
	<script src="<c:url value='/assets/js/main.js' />"></script>
	<script>

	</script>

</body>
</html>