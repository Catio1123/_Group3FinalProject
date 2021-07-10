<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bookerTemplate/plugins/fontawesome-free/css/all.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bookerTemplate/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bookerTemplate/dist/css/adminlte.min.css">
<script>

</script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">
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
										<p>會員</p>
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
									<h3 class="card-title">訂位資訊</h3>
									<div class="card-tools">
<!-- 										<button type="button" class="btn btn-tool" -->
<!-- 											data-card-widget="collapse" title="Collapse"> -->
<!-- 											<i class="fas fa-minus"></i> -->
<!-- 										</button> -->
<!-- 										<button type="button" class="btn btn-tool" -->
<!-- 											data-card-widget="remove" title="Remove"> -->
<!-- 											<i class="fas fa-times"></i> -->
<!-- 										</button> -->
									</div>
								</div>

<div>
								<form action="<c:url value='/insert'/>" method="post">
									<table>

										<tr>
											<td>公司:</td>
											<td><input type="text" name="company" /></td>
										</tr>
										<tr>
											<td>活動名稱:</td>
											<td><input type="text" name="name" /></td>
										</tr>
										<tr>
											<td>活動描述:</td>
											<td><input type="text" name="description" /></td>
										</tr>
										<tr>
											<td><input style="border: none; background-color: #555555; color: white; border-radius: 4px;" type="submit" value="新增"></td>
										</tr>
									</table>
								</form>

</div>

								<!-- /.card-body -->
								<div class="card-footer">
								<button style="border: none; background-color: #555555; color: white; border-radius: 4px;" onclick="window.location.href='<c:url value='/coupon'/>'">回上一頁</button></div>
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

		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.1.0
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/bookerTemplate/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/bookerTemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${pageContext.request.contextPath}/bookerTemplate/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/bookerTemplate/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/bookerTemplate/dist/js/demo.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>
	<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
		});
	</script>
</body>
</html>
