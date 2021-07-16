<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<script>
	let cname = null;
	let query = null;

	window.onload = function() {
		cname = document.getElementById("cname");
		query = document.getElementById("query");
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/couponList'/>", true);

		xhr.send();
		query.addEventListener('click',
				function() {
					let ccname = cname.value;
					if (!ccname) {
						alert('請輸入餐廳店名，可輸入部分名稱');
						return;
					}
					let xhr2 = new XMLHttpRequest();
					xhr2.open('GET', "<c:url value='/queryByName' />?ccname="
							+ ccname);
					xhr2.send();
					xhr2.onreadystatechange = function() {
						if (xhr2.readyState == 4 && xhr2.status == 200) {
							var content = "<table id=coupon><thead>";
							let members = JSON.parse(xhr2.responseText);
							let length = members.length;
							if (length == 0){
								content += "<tr><th colspan='8'>查無資料</th><tr>";	
							}else{
								content += "<tr><th colspan='8'>共計"+ length +" 筆資料</th><tr>";
							content += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th><th>修改</th><th>刪除</th></tr></thead><tbody>";
							for (var i = 0; i < members.length; i++) {
								
								let tmp1 = "<c:url value='/delete/'/>" + members[i].id;
								let tmp2 = "<c:url value='/updateCoupon/'/>" + members[i].id;

								content += "<tr><td width='70'>"
										+ members[i].id
										+ "</td>"
										+ "<td align='center'>"
										+ members[i].company
										+ "</td>"
										+ "<td>"
										+ members[i].name
										+ "</td>"
										+ "<td align='left'>"
										+ members[i].description
										+ "&nbsp;</td>"
										+ "<td><a href='"+tmp2+"'>"
										+ "<img width='36' height='36' src='${pageContext.request.contextPath}/images/update.png' ></a>"
										+ "<td><a href='"+tmp1+"'>"
										+ "<img width='36' height='36' src='${pageContext.request.contextPath}/images/del2.png' ></a>"
										+ "</td>"
								"</tr>";
							}
							}
							content += "</tbody></table>";
							var divs = document.getElementById("somedivS");
							divs.innerHTML = content;
						}
					}

				});

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
// 				var content = "<table id=coupon><thead>";
// 				content += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th><th>修改</th><th>刪除</th></tr></thead><tbody>";
				var content = "";
				var members = JSON.parse(xhr.responseText);
				content += "<h2>"  + members[1].company + "</h2>";
				content += "<p>"  + members[1].description + "</p>";
// 				for (var i = 0; i < members.length; i++) {
// 					tmp = "<c:url value='/couponList'/>";
// 					let tmp1 = "<c:url value='/delete/'/>" + members[i].id;
// 					let tmp2 = "<c:url value='/updateCoupon/'/>" + members[i].id;

// 					content += "<tr><td width='70'>"
// 							+ members[i].id
// 							+ "</td>"
// 							+ "<td align='center'>"
// 							+ members[i].company
// 							+ "</td>"
// 							+ "<td>"
// 							+ members[i].name
// 							+ "</td>"
// 							+ "<td align='left'>"
// 							+ members[i].description
// 							+ "&nbsp;</td>"
// 							+ "<td><a href='"+tmp2+"'>"
// 							+ "<img width='36' height='36' src='${pageContext.request.contextPath}/images/update.png' ></a>"
// 							+ "<td><a href='"+tmp1+"'>"
// 							+ "<img width='36' height='36' src='${pageContext.request.contextPath}/images/del2.png' ></a>"
// 							+ "</td>"
// 					"</tr>";
// 				}
// 				content += "</tbody></table>";
				var divs = document.getElementById("somedivS");
				divs.innerHTML = content;
			}
		}

	}
</script>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>訂餐趣 - 廣告優惠</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">

<link
	href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@900&family=Open+Sans&display=swap" rel="stylesheet">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="<c:url value='/'/>" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"
					role="button"> <i class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/" class="brand-link"> <img
				src="${pageContext.request.contextPath}/bookerTemplate/dist/img/panda.jpeg"
				alt="Admin" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">訂餐趣</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="${pageContext.request.contextPath}/bookerTemplate/dist/img/linux.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a href="#" class="d-block">admin</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header">EXAMPLES</li>
						<li class="nav-item"><a href="<c:url value='/'/>"
							class="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
								<p>Dashboard</p>
						</a></li>

						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i class="nav-icon fas fa-copy"></i>
								<p>
									category <i class="fas fa-angle-left right"></i> <span
										class="badge badge-info right">6</span>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="<c:url value='/exciseSelectAll'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>會員登入</p>
								</a></li>
								<li class="nav-item"><a href="<c:url value='/orderList'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>訂單/訂位</p>
								</a></li>
								<li class="nav-item"><a href="<c:url value='/article'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>食記文章</p>
								</a></li>
								<li class="nav-item"><a href="<c:url value='/restaurant'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>餐廳管理</p>
								</a></li>
								<li class="nav-item"><a href="<c:url value='/list'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>營養資訊</p>
								</a></li>
								<li class="nav-item"><a href="<c:url value='/coupon'/>"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>廣告優惠</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>訂餐趣</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="<c:url value='/'/>">Home</a></li>
								<li class="breadcrumb-item"><a href="#">Layout</a></li>
								<li class="breadcrumb-item active">Fixed Layout</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">

				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<!-- Default box -->
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">優惠方案</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool"
											data-card-widget="collapse" title="Collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-tool"
											data-card-widget="remove" title="Remove">
											<i class="fas fa-times"></i>
										</button>
									</div>

								</div>
								<div>
								<br>
									活動名稱：<input id="cname" type='text' /><br>
									<br>
									<button
										style="border: none; background-color: #555555; color: white; border-radius: 4px;"
										id='query'>查詢</button>
									<button
										style="border: none; background-color: #555555; color: white; border-radius: 4px;"
										onclick="window.location.href='<c:url value='/insertCoupon'/>'">新增</button>
									<font color='red'>${successMessage}</font>
								</div>

								<div class="card-body">
									<div class='center' id='somedivS'></div>
									<br>
								</div>




								<!-- /.card-body -->
								<div class="card-footer"></div>
								<!-- /.card-footer-->
							</div>
							<!-- /.card -->
						</div>
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<p>Copyright &copy; 2021 訂餐趣</p>
				</div>
				<div class="col-md-4">
					<ul class="social-icons">
						<li><a rel="nofollow" href="https://fb.com/templatemo"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-rss"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<p>Design: Team No.2</p>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/main.js"></script>

	<script type="text/javascript">
    $(document).ready(function() {
        // navigation click actions 
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');         
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });
    // scroll function
    function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
    </script>
</body>
</html>
