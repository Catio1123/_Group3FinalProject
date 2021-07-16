<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!doctype html>
<html lang="en">
  <head>
    <title>登入/註冊 &mdash; 歡迎您回來</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="<c:url value='/ben/css/custom-bs.css'/> ">
	<link rel="stylesheet" href="<c:url value='/ben/css/jquery.fancybox.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/ben/css/bootstrap-select.min.css'/> ">
	
	<link rel="stylesheet" href="<c:url value='/ben/css/owl.carousel.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/ben/css/animate.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/ben/css/quill.snow.css'/>">
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="<c:url value='/ben/css/style.css'/> ">

    <style>
    
.logo{
	 font-family: sans-serif;
	 text-align: center;
	 background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	 background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	 background-clip: text;
	 -webkit-background-clip: text;
	 color: transparent;
	 font-size: 30px;
   }

body{
    background-color:#F0F0F0	
}
    
    </style>
    
    
    

<!--     MAIN CSS -->
<!--     <link rel="stylesheet" href="css/style.css">     -->
  </head>
  <body>

<!-- 進入畫面 -->
<!--   <div id="overlayer"></div> -->
<!--   <div class="loader"> -->
<!--     <div class="spinner-border text-primary" role="status"> -->
<!--       <span class="sr-only">Loading...</span> -->
<!--     </div> -->
<!--   </div> -->


    

<div class="site-wrap">

<!--     <div class="site-mobile-menu site-navbar-target"> -->
<!--       <div class="site-mobile-menu-header"> -->
<!--         <div class="site-mobile-menu-close mt-3"> -->
<!--           <span class="icon-close2 js-menu-toggle"></span> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="site-mobile-menu-body"></div> -->
<!--     </div> .site-mobile-menu -->
    

    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="logo"><a href="/ipodcast" class="logo">iPodcast</a></div>

        </div>
      </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-color:#3C3C3C;" id="home-section">
      <div class="container">
<!--         <div class="row"> -->
          <div class="col-md-7">
            <h2 class="text-white font-weight-bold">歡迎回來！請登入您的帳戶。</h2>
            <div class="custom-breadcrumbs">
              <a href="#">Home</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Log In</strong></span>
            </div>
          </div>
<!--         </div> -->
      </div>
    </section>
<!--================================= 一般會員登入 =================================-->

    <section class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5">
            <h2 class="mb-4">會員登入</h2>
            <form action="checklogin" method="Post" class="p-4 border rounded">

              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">帳號 :</label>
                  <span style=color:red;>${errors.acctno}</span>
                  <input type="text" id="fname" name="acctno" class="form-control" placeholder="User">
                </div>
              </div>
              
              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">密碼 :</label>
                  <span style=color:red;>${errors.pw}</span>
                  <input type="password" id="fname" name="pw" class="form-control" placeholder="Password">
                </div>
              </div>
              
                <div style=color:red;>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                ${errors.msg}</div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" id="log" value="Log in" class="btn px-4 btn-primary text-white">
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                  <a href="/sendMail">忘記密碼</a>
                </div>               
                <br>
                <br>
                <div>
                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                 還不是會員嗎?<a href="<c:url value='/signUpMember' />">註冊</a>
                </div>
              </div>
            </form>
          </div>
            
<!--================================= 廣告商登入 =================================-->
          <div class="col-lg-6">
            <h2 class="mb-4">廣告商登入</h2>
            <form action="checkloginAd" method="Post" class="p-4 border rounded">

              <div class="row form-group">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">帳號 :</label>
                <span style=color:red;>${errors.acctnoAd}</span>
                  <input type="text" id="fname" name="acctnoAd" class="form-control" placeholder="User">
                </div>
              </div>
              <div class="row form-group mb-4">
                <div class="col-md-12 mb-3 mb-md-0">
                  <label class="text-black" for="fname">密碼 :</label>
                  <span style=color:red;>${errors.pwAd}</span>
                  <input type="password" id="fname" name="pwAd" class="form-control" placeholder="Password">
                </div>
              </div>
              <div style=color:red;>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                ${errors.msgAd}</div>

              <div class="row form-group">
                <div class="col-md-12">
                  <input type="submit" value="Log In" class="btn px-4 btn-primary text-white">
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                  <a href="/sendMail">忘記密碼</a>
                </div>
                  
               <br>
               <br>
               <div>
                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                 還不是會員嗎?<a href="<c:url value='/signUpMember' />">註冊</a>
               </div>
              </div>              
            </form>
          </div>
        </div>
      </div>
    </section>
    

    
    
    
    
    <footer class="site-footer">

      <a href="#top" class="smoothscroll scroll-top">
        <span class="icon-keyboard_arrow_up"></span>
      </a>

      <div class="container">
        <div class="row mb-5">
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組長</h3>
            <ul class="list-unstyled">
              <li><a href="#">19 張大品</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>技術長</h3>
            <ul class="list-unstyled">
              <li><a href="#">33 廖帝凱</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組員</h3>
            <ul class="list-unstyled">
              <li><a href="#">37 程偉勝</a></li>
              <li><a href="#">21 許佳崴</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組員</h3>
            <ul class="list-unstyled">
              <li><a href="#">32 洪豪均</a></li>
              <li><a href="#">10 陳宣佑</a></li>
            </ul>
          </div>
        </div>

        <div class="row text-center">
          <div class="col-12">
            <p class="copyright"><small>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small></p>
          </div>
        </div>
      </div>
    </footer>
  
  </div>

    <!-- SCRIPTS -->
    <script src="<c:url value='/ben/js/jquery.min.js'/> "></script>
    <script src="<c:url value='/ben/js/bootstrap.bundle.min.js'/> "></script>
    <script src="<c:url value='/ben/js/isotope.pkgd.min.js'/> "></script>
    <script src="<c:url value='/ben/js/stickyfill.min.js'/> "></script>
    <script src="<c:url value='/ben/js/jquery.fancybox.min.js'/> "></script>
    <script src="<c:url value='/ben/js/jquery.easing.1.3.js'/>" ></script>
    
    <script src="<c:url value='/ben/js/jquery.waypoints.min.js'/>" ></script>
    <script src="<c:url value='/ben/js/jquery.animateNumber.min.js'/> "></script>
    <script src="<c:url value='/ben/js/owl.carousel.min.js'/> "></script>
    
    <script src="<c:url value='/ben/js/bootstrap-select.min.js'/> "></script>

    <script src="<c:url value='/ben/js/custom.js'/> "></script>
  
  </body>
</html>