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
        object-fit: cover;
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

  <section class="py-3  container">
    <div class="row pt-5">
      <div class="col-lg-6 col-md-8 mx-auto text-center">
        <a href="<c:url value='/'/>"><img src="<c:url value='/catio/image/IPocast.png'/>" style="width:300px;"></a>
      </div>
    </div>
    <!-- 搜尋列 -->
    <p class="text-center">
      <button class="btn btn-outline-secondary mt-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
       +搜尋
      </button>
    </p>
    <div class="collapse" id="collapseExample">
      <form class="mt-3 mx-auto col-10 ">
        <fieldset>
          <legend class="mb-3">包含</legend>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">Podcast標題：</label>
            <input class="col form-control me-3" id="and_precise_podcast_title"   placeholder="精準查詢">
            <input class="col form-control" id="and_fuzzy_podcast_title" placeholder="模糊查詢">
    
          </div>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">類別名稱：</label>
            <input class="col form-control me-3" id="and_precise_category_cnName"   placeholder="精準查詢">
            <input class="col form-control" id="and_fuzzy_category_cnName" placeholder="模糊查詢">
    
          </div>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">Podcaster名子：</label>
            <input class="col form-control me-3" id="and_precise_podcaster_name"   placeholder="精準查詢">
            <input class="col form-control" id="and_fuzzy_podcaster_name" placeholder="模糊查詢">
    
          </div>
          
        </fieldset>  
        <hr class="my-5">
        <fieldset>
          <legend class="mb-3">額外包含</legend>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">Podcast標題：</label>
            <input class="col form-control me-3" id="or_precise_podcast_title"   placeholder="精準查詢">
            <input class="col form-control" id="or_fuzzy_podcast_title" placeholder="模糊查詢">
    
          </div>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">類別名稱：</label>
            <input class="col form-control me-3" id="or_precise_category_cnName"   placeholder="精準查詢">
            <input class="col form-control" id="or_fuzzy_category_cnName" placeholder="模糊查詢">
    
          </div>
          <div class="row  mt-3">
            <label  class="col-2 col-form-label col-form-label-lg ">Podcaster名子：</label>
            <input class="col form-control me-3" id="or_precise_podcaster_name"   placeholder="精準查詢">
            <input class="col form-control" id="or_fuzzy_podcaster_name" placeholder="模糊查詢">
    
          </div>
          
        </fieldset>  
  
        
        <div class="text-end mt-3">
          <button class="btn btn-outline-secondary " id="btnDemo1" type="button">一鍵輸入1</button>
          <button class="btn btn-outline-secondary " id="btnDemo2" type="button">一鍵輸入2</button>
          <button class="btn btn-outline-secondary " id="btnDemo3" type="button">一鍵輸入3</button>
          <button class="btn btn-outline-secondary " id="btnDemo4" type="button">一鍵輸入4</button>
          <button class="btn btn-outline-secondary " id="btnDemo5" type="button">一鍵輸入5</button>
          <button class="btn btn-outline-secondary " id="btnDemo6" type="button">一鍵輸入6</button>
          <button class="btn btn-outline-secondary " type="button" id="btnSearch">送出</button>
  
        </div>
      </form>
      
    </div>
  </section>
  

  <div class=" py-5 bg-light">
    <div class="container col-8  align-items-center ">
   
      <!-- podcast列表 -->
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5" id="podcastListContainer">
 
    

      </div>
        <div class="position-relative bottom-0 start-50 mt-5">
                                       
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
