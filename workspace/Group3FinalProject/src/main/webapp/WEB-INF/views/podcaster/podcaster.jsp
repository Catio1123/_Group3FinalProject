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

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/catio/css/all.css'/>" rel="stylesheet" type="text/css">
    <link
        href="<c:url value='/catio/css/podcasater_google_font.css'/>"
        rel="stylesheet">

    <link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" >
    <!-- Custom styles for this template-->
    <link href="<c:url value='/catio/css/sb-admin-2.css'/>" rel="stylesheet">

    <link href="<c:url value='/catio/css/pagination.css'/>" rel="stylesheet">

</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <!-- Ipodcast 網址 -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value='/'/>">
                
                <div class="sidebar-brand-text mx-3">IPodcast</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
        

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- Podcast 區塊 -->
            <div class="sidebar-heading text-light" style="font-size: larger;">
                Podcast
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <!-- Podcast總資訊 -->

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" >
                    <span style="font-size: large">Podcast列表</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <!-- 廣告 -->
            <div class="sidebar-heading text-light" style="font-size: larger;">
                廣告
            </div>

            
            <!-- Nav Item - Tables -->
            <!-- 廣告列表網址 -->
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logged/podcaster/ad-list'/>">
                    <span style="font-size: large;">廣告列表</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <!-- 主要內容 -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- 使用者 -->
                        <!-- Nav Item - User Information -->
                        <li class="nav-item ">
                            <a class="nav-link "  role="button">
                                <!-- 使用者名子 -->
                                <span class="mr-2 d-none d-lg-inline text-dark " id="userName">${userName}</span>
                            </a>
                           
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!--搜尋和新增列-->
                    <div class="row justify-content-around imp-medium bg-light mt-4 ms-4 col-12">
                        <form class="col-3" action="#">
                        <input type="search" class="form-control" placeholder="搜尋頻道" aria-label="Search">
                        </form>
                        
                        <div class="row  justify-content-end col me-5">
                        <button type="button" class="btn btn-outline-primary me-5 col-2" data-bs-toggle="offcanvas" data-bs-target="#addchannel" aria-controls="offcanvasRight">+新增頻道</button>

                        </div>
                    <!-- 新增頻道按鈕 -->
                        <div class="offcanvas offcanvas-end " tabindex="-1" id="addchannel" aria-labelledby="offcanvasRightLabel" style="width: 700px;">
                        <div class="offcanvas-header ">
                            <strong class="fs-5">新增Podcast</strong>
                            
                        </div>
                        <div class="offcanvas-body">

                    
                            <!--新增Podcast表單-->
                            <form class="needs-validation" id="form_channel" enctype="application/x-www-form-urlencoded" onsubmit="return false;">
                            <div class="row">
                                <div class="col-4">

                                <img id="channel_img" class="mb-3" width="150" height="150" >
                                <form id="form_file" enctype="multipart/form-data">
                                    <input type="file" id="input_channel_img" name="file" class="form-control">
                                </form>
                                </div>
                                <div class="col-" >

                                <div class="mb-4 position-relative">
                                    <label for="title" class="form-label">Podcast頻道名稱：</label>
                                    <input type="text" class="form-control " id="title" name="title">
                                    <div class="invalid-tooltip" id="title_invalid_text">
                                    Please choose a unique and valid username.
                                    </div>
                                </div>
                                <div>
                                    <label for="category" class="form-label">分類：</label>
                                    <select class="form-select" id="category" name="category"></select>
                                    
                                </div>
                                </div>

                                <div class="col-12">
                                <label for="description" class="form-label my-4">簡介：</label>
                                <textarea class="form-control" id="description" name="description" rows="10" style="resize: none;"></textarea>
                                </div>
                                <div class="col-12 mt-4">
                                <button type="submit" id="btn_create_channel" class="btn btn-primary col-3 float-end">新增</button>
                                </div>
                            </div>
                            

                            </form>
                        </div>
                        </div>
                    </div>
                    

                    <!--Cards -->
                    <div class="album py-3 bg-light col-12 col-12-medium imp-medium">

                        <div class="album py-5 bg-light">
                        <div class="container">
                    
                            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4 " id="cards_container">

                            </div>
                        </div>
                        </div>
                        <!-- 分頁 -->
                        <div class="position-relative bottom-0 start-50 ">
                        
                            <div id="pagination-container"></div>
                        </div>
                    </div>  

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
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
    <script src="<c:url value='/catio/js/sweetalert2.all.min.js'/>"></script>
    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/catio/js/pagination.min.js'/>"></script>
    <script src="<c:url value='/catio/js/podcaster.js'/>"></script>

</body>

</html>