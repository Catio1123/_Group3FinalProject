<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>I Podcast</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="landing is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<h1>
				<a href="<c:url value='/' />">I Podcast</a> by HTML5 UP
			</h1>
			<nav id="nav">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li><a href="#" class="icon solid fa-angle-down">Layouts</a>
						<ul>
							<li><a href="<c:url value='/kevin' />">普通用戶</a></li>
							<li><a href="<c:url value='/catio' />">Podcaster</a></li>
							<li><a href="<c:url value='/gavin' />">資源共享</a></li>
							<li><a href="<c:url value='/bill' />">線下活動</a></li>
							<li><a href="<c:url value='/adindex' />">廣告</a></li>
							<li><a href="<c:url value='/ben' />">論壇</a></li>
							<li><a href="<c:url value='/userpodcast/1' />">測試1</a></li>
							<li><a href="<c:url value='/userpodcast/2' />">測試2</a></li>

							<li><a href="#" class="button">Sign Up</a></li>
						</ul>
						</li>
						</ul>
			</nav>
		</header>

		<!-- Banner -->
		<section id="banner">
			<h2>I Podcast</h2>
			<p>Another fine responsive site template freebie by HTML5 UP.</p>
			<ul class="actions special">
				<li><a href="#" class="button primary">Sign Up</a></li>
				<li><a href="#" class="button">Learn More</a></li>
			</ul>
		</section>

		<!-- Main -->
		<section id="main" class="container">

			<section class="box special">
				<header class="major">
					<h2>
						更精準、高黏著、高轉換的廣告選擇， <br /> 為什麼眾多知名品牌指定 SoundOn 廣告服務？
					</h2>
					<p>
						Blandit varius ut praesent nascetur eu penatibus nisi risus
						faucibus nunc ornare<br /> adipiscing nunc adipiscing.
						Condimentum turpis massa.
					</p>
				</header>
				<span class="image featured"><img src="images/pic01.jpg"
					alt="" /></span>
			</section>

			<section class="box special features">
				<div class="features-row">
					<section>
						<span class="icon solid major fa-bolt accent2"></span>
						<h3>Magna etiam</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
					<section>
						<span class="icon solid major fa-chart-area accent3"></span>
						<h3>Ipsum dolor</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
				</div>
				<div class="features-row">
					<section>
						<span class="icon solid major fa-cloud accent4"></span>
						<h3>Sed feugiat</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
					<section>
						<span class="icon solid major fa-lock accent5"></span>
						<h3>Enim phasellus</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
					</section>
				</div>
			</section>

			<div class="row">
				<div class="col-6 col-12-narrower">

					<section class="box special">
						<span class="image featured"><img src="images/pic02.jpg"
							alt="" /></span>
						<h3>Sed lorem adipiscing</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
						<ul class="actions special">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>

				</div>
				<div class="col-6 col-12-narrower">

					<section class="box special">
						<span class="image featured"><img src="images/pic03.jpg"
							alt="" /></span>
						<h3>Accumsan integer</h3>
						<p>Integer volutpat ante et accumsan commophasellus sed
							aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis
							accumsan dolore magna aliquam veroeros.</p>
						<ul class="actions special">
							<li><a href="#" class="button alt">Learn More</a></li>
						</ul>
					</section>

				</div>
			</div>

		</section>

		<!-- CTA -->
		<section id="cta">

			<h2>Sign up for beta access</h2>
			<p>Blandit varius ut praesent nascetur eu penatibus nisi risus
				faucibus nunc.</p>

			<form>
				<div class="row gtr-50 gtr-uniform">
					<div class="col-8 col-12-mobilep">
						<input type="email" name="email" id="email"
							placeholder="Email Address" />
					</div>
					<div class="col-4 col-12-mobilep">
						<input type="submit" value="Sign Up" class="fit" />
					</div>
				</div>
			</form>

		</section>

		<!-- Footer -->
		<footer id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon brands fa-google-plus"><span
						class="label">Google+</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>