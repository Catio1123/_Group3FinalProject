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
    <title>Album example · Bootstrap v5.0</title>

    <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/album/"> -->

    

    <!-- Bootstrap core CSS -->
<link href="<c:url value='/catio/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">

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
      .text {
        overflow: auto;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 4; /* number of lines to show */
        -webkit-box-orient: vertical;
      }

      .episodes {
        max-height: 400px;
        overflow: auto;
        
      }

      .episode {
        height: 190px;
      }
      .episode > p {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2; /* number of lines to show */
        -webkit-box-orient: vertical;
      }
    </style>

    
  </head>
<body>

<input type="hidden" id="cid" value="${cid}">
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
  <div class="container" style="max-width: 800px;">
    <div class="row">
      <div class="col-4">
        <image id="podcastImg" class="mb-3" src="" style="width:200px; height:200px; "/>
        <div id="adContainer" class="mt-5">
          
        </div>
      </div>
      <div class="col-8">
        <!-- podcast title -->
        <h1 id="title"></h1>
        <!-- podcaster -->
        <h5 id="podcaster"></h5>
        <!-- category -->
        <h6 id="category" class="text-secondary"></h6>
        <!-- descrption -->
        <div id="description" class="text mt-5"></div>
        <div id="epContainer" class="mt-5 episodes bg-light">
          
        </div>
        
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
    <script src="<c:url value='/catio/js/podcast_info.js'/>"></script>
      
  </body>
</html>
