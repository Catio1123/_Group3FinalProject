<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Studio</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="<c:url value='/gavin/assets/css/main.css' />" />
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
						<li  class="current"><a href="<c:url value='/gavin' />">資源共享</a></li>
						<li><a href="<c:url value='/bill' />">線下活動</a></li>
						<li><a href="<c:url value='/wayne' />">廣告</a></li>
						<li><a href="<c:url value='/ben' />">論壇</a></li>

					</ul>
				</nav>
			</header>
		</div>

		<!-- Main -->
		<div id="main-wrapper">
			<div class="container">
				<div id="content">
					<!-- Content -->
					<form id="studioForm">
						
						<label for="studioId">編號:</label> 
						<input type="text" id="studioId" name="id" disabled /> <br/>
						<br/>
						
						<label for="studioName">名稱:</label>
						<input type="text" id="studioName" name="name" />
						<br/>
						
						<label for="studiLocation">地點:</label>
						<input type="text" id="studioLocation" name="location" />
						<br/>
						
						<label for="studioFee">費用:</label>
						<input type="text" id="studioFee" name="fee" />
						<br/>
						
						<button type="button" id="btnUpdate">更新</button>
						<button type="button" id="btnDel">刪除</button>
						
					</form>

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
		$(function() {
			let id = ${id};
			$.ajax({
				method: "GET",
				url: "<c:url value='/gavin/studio/'/>" + id,
				dataType: "json",
				async: false,
			}).done(function(response){
				$("#studioId").val(response.id);
				$("#studioName").val(response.name);
				$("#studioLocation").val(response.location);
				$("#studioFee").val(response.fee);
				
			});
			
			$("#btnUpdate").on("click", function(){

				let formData = {};
				
				$.each($("#studioForm").serializeArray(), function(index, field){
					formData[field.name] = field.value;
				})
				
				$.ajax({
					method: "PUT",
					url: "<c:url value='/gavin/studio/'/>" + $("#studioId").val(),
					data: JSON.stringify(formData),
					contentType: "application/json",
					dataType: "json",
					async: false,
				}).done(function(response){
					alert(response.msg);
					window.location.href = '<c:url value="/gavin"/>';
				});
			});
			
			
			$("#btnDel").on("click", function(){
				$.ajax({
					method: "DELETE",
					url: "<c:url value='/gavin/studio'/>/" + $("#studioId").val(),
					dataType: "json",
					async: false,
				}).done(function(response){
					alert(response.msg);
					window.location.href ='<c:url value="/gavin"/>';
				});
			});
			
		})
	</script>


</body>
</html>