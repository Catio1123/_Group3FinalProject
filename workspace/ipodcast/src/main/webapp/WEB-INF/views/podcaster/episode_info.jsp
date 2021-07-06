<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />

    <title>Album example · Bootstrap v5.0</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" />
    
  </head>
  <body>

    <input type="hidden" id="uid" value="${uid}">
    <input type="hidden" id="cid" value="${cid}">
    <input type="hidden" id="eid" value="${eid}">

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
      <div class="row col-12">
        <!--SideBar-->
        <div class="d-flex flex-shrink-0 p-3 text-white bg-dark col-2 col-12-medium ">
         
          <hr />
          <ul class="nav nav-pills flex-column mb-auto ms-5">
            <li class="nav-item">
              <a href="<c:url value='/logged/podcaster/channel-info/${uid}/${cid}'/>" class="nav-link text-white" aria-current="page">
                
                Podcast資訊
              </a>
            </li>
            <li>
              <a href="<c:url value='/logged/podcaster/episode-list/${uid}/${cid}'/>" class="nav-link active">
                
                Episode列表
              </a>
            </li>
          
            <li>
              <a href="<c:url value='/logged/podcaster/podcaster-info/${uid}'/>" class="nav-link text-white">
                
                回Podcast總覽
              </a>
            </li>
          
          <hr />
         
        </div>
        
        <!--Content-->
        <div class="py-5 bg-light col-10 col-12-medium imp-medium">
          
     
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
              <div class="form-check">
                <input class="form-check-input" type="radio" name="free" id="all_user" value="true" checked>
                <label class="form-check-label" for="all_user">
                  所有使用者皆可收聽
                </label>
              </div>

              <div class="form-check">
                <input class="form-check-input" type="radio" name="free" id="only_subscription" value="false">
                <label class="form-check-label" for="only_subscription">
                  僅限訂閱會員
                </label>
              </div>

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

      </div>
    </main>

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

    <script src="<c:url value='/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/js/episode_info.js'/>"></script>
  </body>
</html>
