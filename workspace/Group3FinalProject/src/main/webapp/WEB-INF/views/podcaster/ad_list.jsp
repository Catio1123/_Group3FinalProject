<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Podcaster</title>

    <!-- Custom fonts for this template -->
    <link href="<c:url value='/catio/css/all.css'/>" rel="stylesheet" type="text/css">
    <link
        href="<c:url value='/catio/css/podcasater_google_font.css'/>"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value='/catio/css/sb-admin-2.css'/>" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="<c:url value='/catio/css/dataTables.bootstrap4.css'/>" rel="stylesheet">

    <link href="<c:url value='/catio/css/pagination.css'/>" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

         <!-- Sidebar -->
         <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <!-- Ipodcast log -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/'/>">
                
                <div class="sidebar-brand-text mx-3">IPodcast</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
        

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- Podcast 區塊 -->
            <div class="sidebar-heading text-light" style="font-size: larger;">
                Podcast
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <!-- Podcast總資訊 -->

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logged/podcaster/podcaster-info'/>" >
                    <span style="font-size: large">Podcast列表</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- 廣告 -->
            <div class="sidebar-heading text-light" style="font-size: larger;">廣告</div>

            
            <!-- Nav Item - Tables -->
            <li class="nav-item active">
                <a class="nav-link" href="#">
                    <span style="font-size: large;">廣告列表</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                  <!-- Topbar -->
                  <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- 使用者 -->
                        <!-- Nav Item - User Information -->
                        <li class="nav-item ">
                            <a class="nav-link "  role="button">
                                <!-- 使用者名子­ -->
                                <span class="mr-2 d-none d-lg-inline text-dark " id="userName">${userName}</span>
                            </a>
                           
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- 廣告列表 -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                    
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="col-1" scope="col">編號</th>
                                            <th class="col-2" scope="col">廣告商</th>
                                            <th class="col-3 text-truncate" scope="col">廣告內容</th>
                                            <th class="col-1" scope="col">照片</th>
                                            <th class="col-4" scope="col">贊助網址</th>
                                            <th class="col-2" scope="col" colspan=2>指令</th>
                                        </tr>
                                    </thead>
                                    <tbody id="adListContainer">
                                       
                                
                                    </tbody>
                                </table>
                                <!-- 分頁 -->
                                <div class="position-relative bottom-0 end-0 ">
                                       
                                    <div id="pagination-container"> </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>



    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/catio/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/catio/js/jquery.easing.js'/>"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/catio/js/sb-admin-2.js'/>"></script>
    
    <script src="<c:url value='/catio/js/pagination.min.js'/>"></script>
    <script src="<c:url value='/catio/js/podcaster-ad-list.js'/>"></script>

</body>

</html>