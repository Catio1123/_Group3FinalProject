<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>IPodcast</title>

    <!-- Custom fonts for this template -->
    <link href="<c:url value='/catio/css/all.css'/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/catio/css/podcasater_google_font.css'/>" rel="stylesheet" />

    <link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="<c:url value='/catio/css/sb-admin-2.css'/>" rel="stylesheet" />

    <!-- Custom styles for this page -->
    <link href="<c:url value='/catio/css/dataTables.bootstrap4.css'/>" rel="stylesheet" />

    <link href="<c:url value='/catio/css/pagination.css'/>" rel="stylesheet" />
    <style>
      tr[data-href] {
        cursor: pointer;
      }
    </style>
  </head>

  <body id="page-top">

    <!-- Channel Id -->
    <input type="hidden" id="cid" value="${cid}"/>
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <!-- Ipodcast 網址 -->
        <a
          class="sidebar-brand d-flex align-items-center justify-content-center"
          href="<c:url value='/'/>"
        >
          <div class="sidebar-brand-text mx-3">IPodcast</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Dashboard -->

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading -->
        <!-- Podcast 區塊 -->
        <div class="sidebar-heading text-light" style="font-size: larger">
          Podcast
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <!-- Podcast總資訊 -->

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
          <a class="nav-link" href="<c:url value='/logged/podcaster/channel-info/${cid}'/>">
            <span style="font-size: large">Podcast詳細資訊</span>
          </a>
        </li>
        <li class="nav-item active">
          <a
            class="nav-link"
            href="#"
          >
            <span style="font-size: large">Episode列表</span>
          </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading -->
        <!-- 廣告 -->
        <div class="sidebar-heading text-light" style="font-size: larger">
          廣告
        </div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
          <a
            class="nav-link"
            href="<c:url value='/logged/podcaster/channel/${cid}/episode-list'/>"
          >
            <span style="font-size: large">廣告管理</span></a
          >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block" />

        <li class="nav-item">
          <a
            class="nav-link"
            href="<c:url value='/logged/podcaster/podcaster-info'/>"
          >
            <span style="font-size: large">回上一層</span></a
          >
        </li>
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <nav
            class="
              navbar navbar-expand navbar-light
              bg-white
              topbar
              mb-4
              static-top
              shadow
            "
          >
            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
              <!-- 使用者 -->
              <!-- Nav Item - User Information -->
              <li class="nav-item">
                <a class="nav-link" role="button">
                  <!-- 使用者名子 -->
                  <span class="mr-2 d-none d-lg-inline text-dark" id="userName"
                    >${userName}</span
                  >
                </a>
              </li>
            </ul>
          </nav>
          <!-- End of Topbar -->
          <!--搜尋和新增列-->
        
        <div class="row justify-content-end col me-5">
        <button
            type="button"
            class="btn btn-outline-primary me-5 col-2"
            data-bs-toggle="offcanvas"
            data-bs-target="#addep"
            aria-controls="offcanvasRight"
        >
            +新增單集
        </button>

        <!-- 新增頻道按鈕 -->
        <div
            class="offcanvas offcanvas-end"
            tabindex="-1"
            id="addep"
            aria-labelledby="offcanvasRightLabel"
            style="width: 700px"
        >
            <div class="offcanvas-header">
            <strong class="fs-5">新增Episode</strong>
            </div>
            <div class="offcanvas-body">
            <!--新增Episode表單-->
            <form
                class="needs-validation"
                id="form_episode"
                enctype="application/x-www-form-urlencoded"
                onsubmit="return false;"
            >
                <div class="mb-4 position-relative">
                <label for="title" class="form-label"
                    >Episode名稱：</label
                >
                <input
                    type="text"
                    class="form-control"
                    id="title"
                    name="title"
                />
                <div
                    class="invalid-tooltip"
                    id="title_invalid_text"
                ></div>
                </div>

                <div class="mb-4 position-relative">
                <label for="sound_file" class="form-label">檔案：</label>
                <input type="file" class="form-control" id="epFile" />
                <div
                    class="invalid-tooltip"
                    id="epFile_invalid_text"
                ></div>
                </div>
                <!-- MP3 -->
                <audio controls class="mb-3" id="audio">
                <source id="audio_source" src="" />
                Your browser does not support the audio element.
                </audio>

                <div>
                <label for="description" class="form-label my-4"
                    >簡介：</label
                >
                <textarea
                    class="form-control"
                    id="description"
                    name="description"
                    rows="10"
                    style="resize: none"
                ></textarea>
                </div>
                <div class="mt-5">
                <button
                    type="button"
                    id="btn_create_episode"
                    class="btn btn-primary col-3 float-end"
                >
                    新增
                </button>
                </div>
            </form>
            </div>
        </div>
        </div>
          <div class="container mt-5">
            <!--Ep 列表 -->
            <table class="table table-hover" id="ep_list">
              <thead>
                <tr>
                  <th scope="col" style="width: 5%">#</th>
                  <th scope="col" style="width: 65%">標題</th>
                  <th scope="col" style="width: 30%">上傳日期</th>
                </tr>
              </thead>
              <tbody id="table_body"></tbody>
            </table>
            <!-- 分頁 -->
            <div class="position-relative bottom-0 start-50">
              <div id="pagination-container"></div>
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

    <script src="<c:url value='/catio/js/episode_list.js'/>"></script>
  </body>
</html>
