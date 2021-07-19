<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>EditStudio</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/ipodcast/gavin/css2/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">Settings</a></li>
					<li><a class="dropdown-item" href="#!">Activity Log</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="index.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">Static
									Navigation</a> <a class="nav-link" href="layout-sidenav-light.html">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Tables</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
						<li class="breadcrumb-item active">Tables</li>
					</ol>

					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> 編輯錄音室資料
						</div>

						<div class="card-body">
							<div id="content">
								<!-- Content -->
								<%-- 					<form id="studioForm"> --%>

								<!-- 						<label for="studioId">編號:</label> -->
								<!-- 						<input type="text" id="studioId" name="id" disabled /> <br /> <br /> -->
								<!-- 						<label for="studioName">名稱:</label> -->
								<!-- 						<input type="text" id="studioName" name="name" /> <br />  -->
								<!-- 						<label for="studiLocation">地點:</label> 3 -->
								<!-- 						<input type="text" id="studioLocation" name="location" /> <br /> -->
								<!-- 						<label for="studioFee">費用:</label> -->
								<!-- 						<input type="text" id="studioFee" name="fee" /> <br /> -->
								<!-- 						<label for="picture">照片</label> -->
								<!-- 						<input type="file" id="newPic"> -->
								<!-- <!-- 							<img width="300" height="300" id="studioPicture" name="picture"> -->
								
								<!-- <br> -->
								<!-- 						<button type="button" id="btnUpdate">更新</button> -->
								<!-- 						<button type="button" id="btnDel">刪除</button> -->

								<%-- 					</form> --%>
								<form:form method="POST" modelAttribute="studio" enctype='multipart/form-data'>
									<Table>
										<c:choose>
											<c:when test='${studio.id == null}'>
												<tr>
													<td>&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td>編號 :</td>
													<td><form:hidden path='id' /> ${studio.id}<br>&nbsp;</td>
												</tr>
											</c:otherwise>
										</c:choose>
										<tr>

											<td>名稱<br>&nbsp;
											</td>
											<td width='360'><form:input path='name' /><br>&nbsp;
												<form:errors path='name' cssClass="error" /></td>

										</tr>
										<tr>
											<td>地址：<br>&nbsp;
											</td>
											<td><form:input path="location" /><br>&nbsp; <form:errors
													path='location' cssClass="error" /></td>
										</tr>
										<tr>
											<td>費用：<br>&nbsp;
											</td>
											<td><form:input path="fee" /><br>&nbsp; <form:errors
													path="fee" cssClass="error" /></td>
											<td>照片：<br>&nbsp;
											</td>
											<td><form:input path="studioImage" type='file' /><br>&nbsp;
												<form:errors path="studioImage" cssClass="error" /></td>
										</tr>
										<tr>
											<td colspan='4' align='center'><br>&nbsp;
											<input type='submit'></td>
										</tr>
									</Table>
								</form:form>
<!-- 								<button type="button" id="btnDel">刪除資料</button> -->
								
							</div>

						</div>
					</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2021</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/ipodcast/gavin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/ipodcast/gavin/js/datatables-simple-demo.js"></script>
	<script>
		$(function() {
			let id = $
			{
				id
			}
			;
			$.ajax({
				method : "GET",
				url : "<c:url value='/studio/findById/'/>" + id,
				dataType : "json",
				async : false,
			}).done(function(response) {
				$("#studioId").val(response.id);
				$("#studioName").val(response.name);
				$("#studioLocation").val(response.location);
				$("#studioFee").val(response.fee);
				// 			let response.picture=pic
				//  			$("#studioPicture").attr("src",responese.pictureString)

			});

			$("#btnUpdate").on(
					"click",
					function() {

						let formData = {};

						$.each($("#studioForm").serializeArray(), function(
								index, field) {
							formData[field.name] = field.value;
						})

						// 			$.ajax({
						// 				method: "POST",
						// 				url: "<c:url value='/gavin/studio/'/>" + id,
						// 				data: JSON.stringify(formData),
						// 				contentType: "application/json",
						// 				dataType: "json",
						// 				async: false,
						// 			}).done(function(response){
						// 				alert(response.msg);
						// 				window.location.href = '<c:url value="/queryStudio"/>';
						// 			});
					});

			$("#btnDel").on("click", function() {
				$.ajax({
					method : "DELETE",
					url : "<c:url value='/gavin/studio'/>/" + id,
					dataType : "json",
					async : false,
				}).done(function(response) {
					alert(response.msg);
					window.location.href = '<c:url value="/queryStudio"/>';
				});
			});

		})
	</script>


</body>
</html>