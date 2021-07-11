<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bookerTemplate/plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bookerTemplate/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/bookerTemplate/dist/css/adminlte.min.css">
<script>
	window.addEventListener("load", function() {

		let id = ${id};

		let dataArea = document.getElementById("dataArea");
		let btn04 = document.getElementById("btn04");

// 		let uid = document.getElementById("userid");
//  		let uac = document.getElementById("customerName");
//  		let upwd = document.getElementById("userpassword");
//  		let utp = document.getElementById("usertelephone");
//  		let umail = document.getElementById("useremail");

//若要查詢 要加這串
// 		let xhr = new XMLHttpRequest();
// 		var url = "<c:url value='/customerBean/'/>" + id;
// 		xhr.open("post", url, true);
// 		xhr.send();
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				let response = JSON.parse(xhr.responseText);

// 				uid.value = response.userid;


//  				uac.value = response.customerName;
//  				upwd.value = response.userpassword;
//  				utp.value = response.usertelephone;
//  				umail.value = response.useremail;

// 			}
// 		};
// 到這邊
		btn04.onclick = function() {
			var url = "<c:url value='/articleList/'/>" + id;
			var result = confirm("確定刪除此筆記錄(帳號:" + id + ")?");
		
			if (result) {
			    var xhr2 = new XMLHttpRequest();
		   		xhr2.open("post", url, true);
		   		xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		   		xhr2.send();
		   		xhr2.onreadystatechange = function() {
							// 伺服器請求完成
		   		if (xhr2.readyState == 4 && xhr2.status == 200) {
		      		let json = JSON.parse(xhr2.responseText);
		      		if (json.success === "false") {
		      			alert(json.msg);
			  		} else if(json.success === "true") {
			  			alert(json.msg);
						window.location.href='<c:url value="/article"/>';
		      		}                                                             
				} 
		      
			  }
		   } 
	 
		}
	})
</script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.css">

</head>

<body class="hold-transition sidebar-mini layout-fixed">
	
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="<c:url value='/'/>" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="#" class="nav-link">Contact</a>
      </li>
    </ul>
    
        <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
            <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>


      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
          <i class="fas fa-th-large"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="/" class="brand-link">
      <img src="${pageContext.request.contextPath}/bookerTemplate/dist/img/panda.jpeg" alt="Admin" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">訂餐趣</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="${pageContext.request.contextPath}/bookerTemplate/dist/img/linux.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">admin</a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-header">EXAMPLES</li>
          <li class="nav-item">
            <a href="<c:url value='/'/>" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
              </p>
            </a>
          </li>
          
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-copy"></i>
              <p>
                category
                <i class="fas fa-angle-left right"></i>
                <span class="badge badge-info right">6</span>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="<c:url value='/article'/>" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>食記/文章</p>
                </a>
              </li>
            </ul>
          </li>
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
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Default box -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">食記/文章</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
<div align="center">
<form>

		<fieldset style="width: 1000px;">
			<legend align="center">刪除食記條目</legend>
		<table border="1" style="width:1000px" width="100%">
			<tr>
				<td>id:</td>
				<td><input type="text" value="${myTable02.id}" id="articleidDel" disabled/></td>
			</tr>
						<tr>
							<td>餐廳名稱:</td>
							<td><input type="text" value="${articleList.name}" id="nameDel" disabled/></td>
						</tr>
						<tr>
							<td>評分:</td>
							<td><input type="number" value="${articleList.rate}" id="rateDel" disabled/></td>

						</tr>
						<tr>
							<td>食記網址:</td>
							<td><input type="text" value="${articleList.url}" id="urlDel" disabled/></td>

						</tr>
						
						<tr>
							<td>城市:</td>
							<td><input type="text" value="${articleList.city}" id="cityDel" disabled/></td>
						</tr>
						<tr>
							<td>食物種類:</td>
							<td><input type="email" value="${articleList.foodtype}" id="foodtypeDel" disabled/></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<td>圖片:</td> -->
<%-- 							<td><img width='150' height='200' src= "${articleList.pictureString} "></td> --%>
<!-- 						</tr> -->

		</table>
		<br>
		<input id='btn04' type="button" value="確定刪除(AJAX)">
		<!--  <button type="submit">確定新增(submit)</button>-->

	</form>
		</fieldset>
	</div>
              
              <div class="card-body">
              		<div class='center'  id='somedivS'></div><br>
              </div>
              
              
              
              
              <!-- /.card-body -->
              <div class="card-footer">
              </div>
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
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/bookerTemplate/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/bookerTemplate/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="${pageContext.request.contextPath}/bookerTemplate/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/bookerTemplate/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/bookerTemplate/dist/js/demo.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.js"></script>

</body>
</html>





</body>
</html>