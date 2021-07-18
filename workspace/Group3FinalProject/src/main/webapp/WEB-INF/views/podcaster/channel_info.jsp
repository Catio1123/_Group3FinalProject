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
    <link href="<c:url value='/catio/css/sb-admin-2.css" rel="stylesheet'/>">


</head>

<body id="page-top">

    <!-- UserAct -->
    <input type="hidden" id="cid" value="${cid}">
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
                    <span style="font-size: large">Podcast詳細資訊</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logged/podcaster/channel/${cid}/episode-list'/>" >
                    <span style="font-size: large">Episode列表</span>
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
            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logged/podcaster/channel/${cid}/ad-list'/>">
                    <span style="font-size: large;">廣告管理</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <li class="nav-item">
                <a class="nav-link" href="<c:url value='/logged/podcaster/podcaster-info'/>">
                    <span style="font-size: large;">回上一層</span></a>
            </li>

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
                    <form class="needs-validation" id="form_channel" enctype="application/x-www-form-urlencoded" onsubmit="return false;">
                        <div class="row">
                          <div class="col-4">
          
                            <img id="channel_img" class="mb-3" width="150" height="150" >
                            <form id="form_file" enctype="multipart/form-data">
                              <input type="file" id="input_channel_img" name="file" class="form-control">
                            </form>
                          </div>
                          <div class="col-8" >
          
                            <div class="mb-4 position-relative">
                              <label for="title" class="form-label">Podcast頻道名稱：</label>
                              <input type="text" class="form-control " id="title" name="title">
                              <div class="invalid-tooltip" id="title_invalid_text"></div>
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
                            <button type="submit" id="btn_delete_channel" class="btn btn-danger col-3 float-start">刪除</button>
                            <button type="submit" id="btn_update_channel" class="btn btn-primary col-3 float-end">修改</button>
                          </div>
                        </div>
                        
          
                      </form>


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
    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/catio/js/channel_info.js'/>"></script>

</body>

</html>