<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>QueryStudio</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
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
						
					</div>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> DataTable Example
						</div>

						<div class="card-body">
<%-- 						<a href="<c:url value='/insertStudio' />">新增</a><br> --%>
						
<!-- 						<fieldset> -->
<%-- 							<form:form method="POST" modelAttribute="studio" --%>
<%-- 								enctype='multipart/form-data'> --%>
<!-- 								<Table> -->
<%-- 									<c:choose> --%>
<%-- 										<c:when test='${studio.id == null}'> --%>
<!-- 											<tr> -->
<!-- 												<td>&nbsp;</td> -->
<!-- 												<td>&nbsp;</td> -->
<!-- 											</tr> -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<tr> -->
<!-- 												<td>編號<br>&nbsp; -->
<!-- 												</td> -->
<%-- 												<td><form:hidden path='id' /> ${studio.id}<br>&nbsp; --%>
<!-- 												</td> -->
<!-- 											</tr> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
<!-- 									<tr> -->

<!-- 										<td>名稱<br>&nbsp; -->
<!-- 										</td> -->
<%-- 										<td width='360'><form:input path='name' /><br>&nbsp; --%>
<%-- 											<form:errors path='name' cssClass="error" /></td> --%>

<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td>地址<br>&nbsp; -->
<!-- 										</td> -->
<%-- 										<td><form:input path="location" /><br>&nbsp; <form:errors --%>
<%-- 												path='location' cssClass="error" /></td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td>費用<br>&nbsp; -->
<!-- 										</td> -->
<%-- 										<td><form:input path="fee" /><br>&nbsp; <form:errors --%>
<%-- 												path="fee" cssClass="error" /></td> --%>
<!-- 										<td>照片<br>&nbsp; -->
<!-- 										</td> -->
<%-- 										<td><form:input path="studioImage" type='file' /><br>&nbsp; --%>
<%-- 											<form:errors path="studioImage" cssClass="error" /></td> --%>
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan='4' align='center'><br>&nbsp; <input -->
<!-- 											type='submit'></td> -->
<!-- 									</tr> -->
<!-- 								</Table> -->

<%-- 							</form:form> --%>
<!-- 							</fieldset> -->
							<div id='dataArea'>
								<table id="datatablesSimple">
									<thead>
										<tr>
											<th>編號</th>
											<th>名稱</th>
											<th>地點</th>
											<th>費用</th>
											<th>照片</th>

											<th><a href="<c:url value='/insertStudio' />">新增</a></th>
										</tr>
										<c:forEach var="studio" items="${studio}" >
											<tr>
												<td>${studio.id}</td>
												<td>${studio.name}</td>
												<td>${studio.location}</td>
												<td>${studio.fee}</td>
												<td><img width='100' height='60'
													src='${studio.pictureString}'></td>
												<td><a href='<c:url value='/editStudio/${studio.id}'/>'>編輯</a></td>

											</tr>
										</c:forEach>
										</tbody>
								</table>
							</div>
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
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
<!-- 	<script> -->
<!-- // 		$(function() { -->
<!-- // 			$.ajax({ -->
<!-- // 				method : "GET", -->
<%-- // 				url : "<c:url value='/findAll'/>", --%>
<!-- // 				dataType : "json", -->
<!-- // 			}).done(function(response) { -->
<!-- // 				$.each(response, function(index, studioBean) { -->
<!-- // 					appendTable(studioBean); -->
<!-- // 				}) -->
<!-- // 			}); -->

<!-- // 			function appendTable(bean) { -->

<!-- // 				let id = bean.id; -->
<%-- // 				let uri = "<c:url value='/editStudio/'/>" + id; --%>
<!-- // 				let temp = "<tr>"; -->
<!-- // 				temp += "<td>" + bean.id + "</td>" -->
<!-- // 				temp += "<td>" + bean.name + "</td>" -->
<!-- // 				temp += "<td>" + bean.location + "</td>" -->
<!-- // 				temp += "<td>" + bean.fee + "</td>" -->
<!-- // 				temp += "<td><img width='100' height='60' src='" + bean.pictureString + "' ></td>" -->
<!-- // 				temp += "<td><a href='" +uri+ "'>編輯</a></td>" -->

<!-- // 				temp += "</tr>"; -->
<!-- // // 				temp +="</tbody>"; -->
<!-- // // 				temp +="</table>"; -->
<!-- // 				$("#datatablesSimple").append(temp); -->

<!-- // 			} -->

<!-- // 		}) -->
<!-- 	</script> -->
</body>
</html>

