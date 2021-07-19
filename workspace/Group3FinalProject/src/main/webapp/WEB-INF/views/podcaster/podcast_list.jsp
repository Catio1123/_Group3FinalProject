<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <!-- <meta name="generator" content="Hugo 0.83.1"> -->
    <title>IPodcast</title>

    <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/"> -->

    

    <!-- Bootstrap core CSS -->
<link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/catio/css/pagination.css'/>" rel="stylesheet">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
       
      }
      .card{
        border-radius: 4px;
        background: #fff;
        box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
        transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
        cursor: pointer;
      }

      .card:hover{
        transform: scale(1.05);
        box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
      }
      .card-img-top {
        width: 100%;
        height: 15vw;
        /* object-fit: cover; */
      }
     
	  a.custom-card,a.custom-card:hover {
   		color: inherit;
   		text-decoration: none;
	  }
    </style>

    
  </head>
  <body>
    
<header>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="<c:url value='/podcast-list'/>" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <strong class="fs-5">IPodcast</strong>
      </a>

      
    </header>
  </div>

</header>

<main>

  <section class="py-3 text-center  container">
    <div class="row pt-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <a href="<c:url value='/'/>"><img src="<c:url value='/catio/image/IPocast.png'/>" style="width:300px;"></a>
      </div>
    </div>
    <!-- 搜尋列 -->
    <form class="mt-3">
      
      <div class="  justify-content-center row g-3">
        <div class="col-8">
          <input class="form-control" id="queryString" type="text" placeholder="Podcast搜尋" aria-label="Search" >
        </div>
        <div class="col-2">
          <select class=" form-select"></select>
        </div>
        <div class="col-auto">
          <button class="btn btn-outline-secondary " id="btnSearch" type="button">搜尋</button>
        </div>

      </div>
    </form>
  </section>
  

  <div class=" py-5 bg-light">
    <div class="container col-8  align-items-center ">
      <form action="">
        <div class="row  justify-content-end mb-4">   
          <div class="col-2 text-end">
            <label for="inputAccount" class="col-form-label">筆/頁</label>
            <select name="" id="" class="col-2 w-50">
            </select>
          </div >
         
        </div>
      </form>
      <!-- podcast列表 -->
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5" id="podcastListContainer">
 
    

      </div>
        <div class="position-relative bottom-0 start-50 ">
                                       
          <div id="pagination-container"></div>
      </div>
    </div>
  </div>

</main>

<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    
  </div>
</footer>


    <script src="<c:url value='/catio/js/jquery-3.6.0.min.js'/>"></script>
    <script src="<c:url value='/catio/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/catio/js/pagination.min.js'/>"></script>
    <script src="<c:url value='/catio/js/podcast_list.js'/>"></script>
  </body>
</html>
