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

    <link href="<c:url value='/catio/css/all.css'/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value='/catio/css/podcasater_google_font.css'/>" rel="stylesheet" />

    <link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />

    <link href="<c:url value='/catio/css/sb-admin-2.css'/>" rel="stylesheet" />
   
  </head>

  <body id="page-top">

    <!-- Channel Id -->
    <input type="hidden" id="cid" value="${cid}"/>
    <input type="hidden" id="eid" value="${eid}"/>
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
          Episode
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <!-- EPisode資訊 -->

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item active">
          <a class="nav-link" href="#">
            <span style="font-size: large">Episode詳細資訊</span>
          </a>
        </li>
       

       

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block" />

        <li class="nav-item">
          <a
            class="nav-link"
            href="<c:url value='/logged/podcaster/channel/${cid}/episode-list'/>"
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
          <!--Podcast修改、刪除表格-->
          <div class="container">
           
            <!--新增Episode表單-->
            <form class="needs-validation" id="form_episode" enctype="application/x-www-form-urlencoded"  onsubmit="return false;">
              <!-- onsubmit="return false;" -->
              <div class="mb-4 position-relative">
                <label for="title" class="form-label">Episode名稱：</label>
                <input type="text" class="form-control " id="title" name="title">
                <div class="invalid-tooltip" id="title_invalid_text"></div>
              </div>

              <div class="mb-4 position-relative">
                <label for="sound_file" class="form-label">檔案</label>
                <input type="file" class="form-control " id="epFile" >
                <div class="invalid-tooltip" id="epFile_invalid_text"></div>
              </div>
              <!-- MP3 -->
              <audio controls class="mb-3" id="audio">
                <source id="audio_source" src=""/>
                Your browser does not support the audio element.
              </audio>
              

             

              <div >
                <label for="description" class="form-label my-4">簡介：</label>
                <textarea class="form-control" id="description" name="description" rows="10" style="resize: none;"></textarea>
              </div>
              <div class="col-12 mt-4">
                <button type="submit" id="btn_delete_channel" class="btn btn-danger col-3 float-start">刪除</button>
                <button type="submit" id="btn_update_channel" class="btn btn-primary col-3 float-end">修改</button>
              </div>
    

            </form>

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

    <script src="<c:url value='/catio/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <script src="<c:url value='/catio/js/jquery.easing.js'/>"></script>

    <script src="<c:url value='/catio/js/sb-admin-2.js'/>"></script>

    <script src="<c:url value='/catio/js/episode_info.js'/>"></script>


  </body>
</html>
