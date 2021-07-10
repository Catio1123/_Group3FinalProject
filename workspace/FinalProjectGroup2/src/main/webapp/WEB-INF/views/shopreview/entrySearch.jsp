<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>搜尋食記</title>
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

<title>搜尋食記</title>
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
	
<h2>您所述入的新條目如下</h2>
條目 ID:		${hId}<br/>
店名:		${hName}<br/>
評分:		${hRate}<br/>
餐點類型:	${hType}<br/>
食記連結:	${hUrl}<br/>
菜系:		${hGenre}<br/>
所在城市:	${hCity}<br/>

<a href="articleCrud.controller"><button id="back">確定</button></a><br>

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