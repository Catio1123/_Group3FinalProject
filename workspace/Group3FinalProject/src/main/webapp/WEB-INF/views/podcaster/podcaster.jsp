<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />

    <title>IPodcast</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/catio/css/pagination.css'/>">
  </head>
  <body>
  
    <!-- User id -->
    <input type="hidden" id="uid" value="1">
    <!--Header-->
    <div id="header-wrapper" >
      <header class="p-3 bg-dark text-white">
        <nav class="navbar sticky-top">

          
        </nav>
        <div
          class="
            d-flex
            flex-wrap
            align-items-center
            justify-content-center justify-content-lg-start
          "
        >
          <!--Logo-->
          <a
            href="/"
            class="
              d-flex
              align-items-center
              mb-2 mb-lg-0
              text-white text-decoration-none
              me-5
              ms-3
            "
          >
            <strong class="fs-3">IPodcast</strong>
          </a>

          <!--Nav-->
          <ul
            class="
              nav
              col-12 col-lg-auto
              me-lg-auto
              mb-2
              justify-content-start
              mb-md-0
            "
          >
            <li><a href="<c:url value='/'/>" class="nav-link px-2 text-white">首頁</a></li>
            <li><a href="#" class="nav-link px-2 text-white">資源共享</a></li>
            <li><a href="#" class="nav-link px-2 text-white">線下活動</a></li>
            <li><a href="#" class="nav-link px-2 text-white">廣告</a></li>
            <li><a href="#" class="nav-link px-2 text-white">論壇</a></li>
          </ul>

          <strong class="me-3">您好 ! <span id="usernickname"></span></strong>
          
          <div class="dropdown text-end">
            <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser" data-bs-toggle="dropdown" aria-expanded="false">
              <span>XXX</span>
            </a>
            <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser">
              <li><a class="dropdown-item" href="#">我的頻道</a></li>
              <li><a class="dropdown-item" href="#">設定</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">登出</a></li>
            </ul>
          </div>
        </div>
      </header>
    </div>

    <!--Main-->
    <main>

      <!--搜尋和新增列-->
      <div class="row justify-content-around imp-medium bg-light mt-4 ms-4 col-12">
        <form class="col-3" action="#">
          <input type="search" class="form-control" placeholder="搜尋頻道" aria-label="Search">
        </form>
        
        <div class="row  justify-content-end col me-5">
          <button type="button" class="btn btn-outline-primary me-5 col-1" data-bs-toggle="offcanvas" data-bs-target="#addchannel" aria-controls="offcanvasRight">+新增頻道</button>

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

      
      </main>
      
    </div>

    <footer class="text-muted py-5">
      <div class="container">
        <p class="float-end mb-1">
          <a href="#">Back to top</a>
        </p>
        <p class="mb-1">
          Album example is &copy; Bootstrap, but please download and customize
          it for yourself!
        </p>
        <!-- <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="../getting-started/introduction/">getting started guide</a>.</p> -->
      </div>
    </footer>

    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/catio/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/catio/js/pagination.min.js'/>"></script>
    <script src="<c:url value='/catio/js/podcaster.js'/>"></script>

  </body>
</html>
