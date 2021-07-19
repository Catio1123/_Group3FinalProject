<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Video Catalog</title>
<link rel="stylesheet"
	href="/ipodcast/gavin/guest/fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link rel="stylesheet" href="/ipodcast/gavin/guest/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/ipodcast/gavin/guest/css/templatemo-video-catalog.css">
</head>
<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->
<body>
	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<!-- <div class="col-7 col-md-4">
							<a href="index.html"
								class="tm-bg-black text-center tm-logo-container"> <i
								class="fas fa-video tm-site-logo mb-3"></i>
								<h1 class="tm-site-name">Video Catalog</h1>
							</a>
						</div> -->
						<div class="col-5 col-md-8 ml-auto mr-0">
							<div class="tm-site-nav">
								<nav class="navbar navbar-expand-lg mr-0 ml-auto"
									id="tm-main-nav">
									<button
										class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed"
										type="button" data-toggle="collapse" data-target="#navbar-nav"
										aria-controls="navbar-nav" aria-expanded="false"
										aria-label="Toggle navigation">
										<span> <i class="fas fa-bars tm-menu-closed-icon"></i>
											<i class="fas fa-times tm-menu-opened-icon"></i>
										</span>
									</button>
									<!-- <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
										<ul class="navbar-nav text-uppercase">
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="index.html">Videos <span
													class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="about.html">About</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="contact.html">Contact</a></li>
										</ul>
									</div> -->
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-1">
				<div class="text-center">
					<p
						class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 text-white mx-auto">Background
						image can be fixed. Content will simply slide over.</p>
				</div>
			</div>

			<!-- Header image -->
			<div id="tm-fixed-header-bg"></div>
		</div>

		<!-- Page content -->
		<div class="container-fluid">

			<div class="mx-auto tm-content-container">
				<main>

					<div class="row mb-5 pb-4">
						<div class="col-12">
							<!-- Video player 1422x800 -->
							<!-- 							<video width="1422" height="800" controls autoplay> -->
							<%-- 							  <source src="${studio.pictureString}" type="video/mp4">							   --%>
							<!-- 							Your browser does not support the video tag. -->
							<!-- 							</video> -->

							<img width='1422' src='${studio.pictureString}' margin:auto>
						</div>
					</div>

					<form id="bookStudio" class="tm-contact-form">
						<div class="row mb-5 pb-5">
							<div class="col-xl-8 col-lg-7">
								<!-- Video description -->
								<div class="mx-auto pb-3 tm-about-text-container px-3">
									<div class="row">
										<div class="col-lg-6 mb-5">

											<div class="form-group">
												<input type="text" name="studioName" id="studioName"
													class="form-control rounded-0" placeholder="studioName"
													disabled="disabled" value="${studio.name} " />
											</div>
											<div class="form-group">
												<input type="hidden" name="studioName" id="studioName"
													class="form-control rounded-0" placeholder="studioName"
													 value="${studio.name} " />
											</div>
							
											<div class="form-group">
												<input type="text" name="studioLocation"
													class="form-control rounded-0" placeholder="studioLocation"
													disabled="disabled" value="${studio.location} " />
											</div>
											<div class="form-group">
												<input type="text" name="fee"
													class="form-control rounded-0" placeholder="studioName"
													disabled="disabled" value="${studio.fee} " />
											</div>
										</div>
										<div class="col-lg-6 mb-5">

											<div class="form-group">
												<input type="text" name="name" id="name"
													class="form-control rounded-0" placeholder="Name"
													required="" />
											</div>
											<div class="form-group">
												<input type="email" name="email" id="email"
													class="form-control rounded-0" placeholder="Email"
													required="" />
											</div>
											<div class="form-group">
												<select class="form-control" id="people"
													name="people">
													<option value="-">人數</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>

												</select>
											</div>
											<div class="form-group">
												<input id="date" type="text" name="date" value="2021-07-23 AM7:30" class="form-control rounded-0">
											</div>
											<div class="form-group">
												<input type="text" name="msg" id="msg"
													class="form-control rounded-0" placeholder="備註"
													required="" />
											</div>

											<div class="form-group mb-3">
												<button type="button" id="btnRegister"
													class="btn btn-primary rounded-0 d-block ml-auto mr-0 tm-btn-animate tm-btn-submit tm-icon-submit">
													<span>Submit</span>
												</button>
												</div>
											<div class="form-group mb-0">
												<button type="button" id="btnInput" class="btn btn-primary rounded-0 d-block ml-auto mr-0 tm-btn-animate tm-btn-submit tm-icon-submit"><span>自動加入</span></button>
											</div>
										</div>


									</div>
								</div>
							</div>

						</div>
					</form>
			</div>

			</main>

			<!-- Subscribe form and footer links -->
			<div class="row mt-5 pt-3">
				<div class="col-xl-6 col-lg-12 mb-4">
					<div class="tm-bg-gray p-5 h-100">
						<h3 class="tm-text-primary mb-3">Do you want to get our
							latest updates?</h3>
						<p class="mb-5">Please subscribe our newsletter for upcoming
							new videos and latest information about our work. Thank you.</p>
						<%--                             <form action="" method="GET" class="tm-subscribe-form"> --%>
						<!--                                 <input type="text" name="email" placeholder="Your Email..." required> -->
						<!--                                 <button type="submit" class="btn rounded-0 btn-primary tm-btn-small">Subscribe</button> -->
						<%--                             </form> --%>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
					<div class="p-5 tm-bg-gray">
						<h3 class="tm-text-primary mb-4">Quick Links</h3>
						<ul class="list-unstyled tm-footer-links">
							<li><a href="#">Duis bibendum</a></li>
							<li><a href="#">Purus non dignissim</a></li>
							<li><a href="#">Sapien metus gravida</a></li>
							<li><a href="#">Eget consequat</a></li>
							<li><a href="#">Praesent eu pulvinar</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
					<div class="p-5 tm-bg-gray h-100">
						<h3 class="tm-text-primary mb-4">Our Pages</h3>
						<ul class="list-unstyled tm-footer-links">
							<li><a href="#">Our Videos</a></li>
							<li><a href="#">License Terms</a></li>
							<li><a href="#">About Us</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Privacy Policies</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- row -->

			<footer class="row pt-5">
				<div class="col-12">
					<p class="text-right">
						Copyright 2020 The Video Catalog Company - Designed by <a
							href="https://templatemo.com" rel="nofollow" target="_parent">TemplateMo</a>
					</p>
				</div>
			</footer>
		</div>
		<!-- .tm-content-container -->
	</div>


	<script src="/ipodcast/gavin/guest/js/jquery-3.4.1.min.js"></script>
	<script src="/ipodcast/gavin/guest/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.tm-likes-box').click(function(e) {
				e.preventDefault();
				$(this).toggleClass('tm-liked');

				if ($(this).hasClass('tm-liked')) {
					$('#tm-likes-count').html('486 likes');
				} else {
					$('#tm-likes-count').html('485 likes');
				}
			});
		});
	</script>
		<script>
		$(function(){
			$("#btnRegister").on("click", function(){
				let formData = {};
				$.each($("#bookStudio").serializeArray(), function(index, field){
					formData[field.name] = field.value;
				})
				$.ajax({
					method: "POST",
					url: "<c:url value='/studiobooking'/>",
					data: JSON.stringify(formData),
					contentType: "application/json",
					dataType: "json",
					async: false,
				}).done(function(response){
					alert(response.msg);
					window.location.href ='<c:url value="/querybooking"/>';
				});
			
			
			
			})
		})
	</script>
		<script>
		$(function(){
			$("#btnInput").on("click", function(){
			console.log("yes")
			$("#name").val("Gavin")
			$("#email").val("group3@ipodcast.com")
			$("#people").val("2")
			$("#msg").val("132")
			})
		})
		</script>
</body>
</html>