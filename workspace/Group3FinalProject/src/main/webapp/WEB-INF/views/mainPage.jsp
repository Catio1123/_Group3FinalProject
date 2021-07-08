<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>歡迎來到iPodcast</title>

    <!-- Favicon -->
    <link rel="icon" href="/kevin/img/core-img/favicon.ico">

    <!-- Style CSS -->
   <link  rel='stylesheet' href="<c:url value='/kevin/css/style.css'  />" />	    
    
    <style>
h1 {
	font-family: sans-serif;
	margin: 5px auto ;
	text-align: center;
	background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
	font-size: 80px;
}
body{
    background-color:#F0F0F0	
}
.a1{

 font-size: 20px;
 margin: 5px auto ;
 font-family:Microsoft JhengHei;
}
h3{
font-size: 30px;
font-family:Microsoft JhengHei
}

    </style>
</head>




<body>
<!-- ##### Header Area Start ##### -->
    <header class="header-area">
     
         <div class="original-nav-area" id="stickyNav">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Classy Menu -->
                    <nav class="classy-navbar justify-content-between">

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu" id="originalNav">
                            <!-- close btn -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <!-- <li><a href="index.html">Home</a></li> -->
                                    <li><a href="#">Podcaster</a></li>
                                    <li><a href="<c:url value='/adindex'/>">廣告</a></li>
                                    <li><a href="<c:url value='/forum'/>">論壇</a></li>
                                    <li><a href="#">活動</a></li>
                                    <li><a href="<c:url value='/studioMainPage'/>">播客工廠</a></li>
                                    <li><a href="#">搜尋</a></li>

                                </ul>
                                <!-- Search Form  -->
                                <div id="search-wrapper">
                                    <form action="#">
                                        <input type="text" id="search" placeholder="Search something...">
                                        <div id="close-icon"></div>
                                        <input class="d-none" type="submit" value="">
                                    </form>
                                </div>
                                <ul>
                                    <li><a id="login" href="<c:url value='/loginController' />">登入</a></li>
                                    <li><a id="logout" href="<c:url value='/logout' />">登出</a></li>
                                    <li><a style="font-family:DFKai-SB;color:#6A6AFF">${Member.name}</a>
                                    <li><a style="display:none" id="role">${Member.role}</a>
                                      <ul class="dropdown">
                                            <li><a id="general" href="<c:url value='/updateMember' />" >修改訊息 </a></li>
                                            <li><a id="admin"   href="<c:url value='/memberCentre' />" >管理者後台</a></li>
                                            <li><a id="company" href="<c:url value='/adindex' />" >   廣告商後台</a></li>
                                      </ul>
                                   </li>
                                </ul>               
                            </div>
                            <!-- Nav End -->
                        </div>
                    </nav>
                </div>
            </div>
        </div>
<script>

let role      = document.getElementById("role");
let login     = document.getElementById("login");
let logout    = document.getElementById("logout");
let general   = document.getElementById("general");
let admin     = document.getElementById("admin");
let company   = document.getElementById("company");
window.onload=function(){

	load();
	
	}
function load(){
	if('${Member.role}'==""){
	    login  .style.display  ="block";
		logout .style.display  ="none";
		general.style.display  ="none";
		admin  .style.display  ="none";
		company.style.display  ="none";
		
	}else if('${Member.role}'!="" && '${Member.role}' == "admin"  ){
	    login  .style.display  ="none";
		logout .style.display  ="block";
		admin  .style.display  ="block";
		general.style.display  ="none";
		company.style.display  ="none";

    }else if('${Member.role}' != "" && '${Member.role}' == "general"){
        login  .style.display  ="none";
	    logout .style.display  ="block";
	    admin  .style.display  ="none";
	    general.style.display  ="block";
		company.style.display  ="none";
		
    }else if('${Member.role}' != "" && '${Member.role}' == "company"){
        login  .style.display  ="none";
	    logout .style.display  ="block";
	    general.style.display  ="none";
	    admin  .style.display  ="none";
		company.style.display  ="block";
}
}


</script>

        <!-- Logo Area -->
        <div class="logo-area text-center">
            <div class="container h-100">
                <div class="row h-100 align-items-center"> 
                    <div class="col-12 col-sm-8">
                        <div class="breaking-news-area">

                            <div id="breakingNewsTicker" class="ticker">
                                <ul>
                                    <li><a href="#">歡迎來到iPodcast</a></li>
                                    <li><a href="#">這裡會給您不一樣的聽覺饗宴</a></li>
                                    <li><a href="#">金麥大賽即將開始</a></li>
                                    <li><a href="#">歡迎廠商洽談合作</a></li>
                                    <li><a href="#">讓播客工廠幫你圓夢</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <h1>iPodcast</h1>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nav Area -->
       
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Hero Area Start ##### -->
    <div class="hero-area">
        <!-- Hero Slides Area -->
        <div class="hero-slides owl-carousel">
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(kevin/images/P1.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="slide-content text-center">
                                <div class="post-tag">
                                    <a href="#" data-animation="fadeInUp">iPodcast</a>
                                </div>
                                <h2 data-animation="fadeInUp" data-delay="250ms"><a href="single-post.html">你想成為Podcaster嗎?</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(kevin/images/P2.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="slide-content text-center">
                                <div class="post-tag">
                                    <a href="#" data-animation="fadeInUp">金麥大賽</a>
                                </div>
                                <h2 data-animation="fadeInUp" data-delay="250ms"><a href="single-post.html">到討論區看看誰是2021人氣王</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="single-hero-slide bg-img" style="background-image: url(kevin/images/P3.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="slide-content text-center">
                                <div class="post-tag">
                                    <a href="#" data-animation="fadeInUp">請砸錢</a>
                                </div>
                                <h2 data-animation="fadeInUp" data-delay="250ms"><a href="single-post.html">歡迎各路廣告商砸錢給我們</a></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Blog Wrapper Start ##### -->
    <div class="blog-wrapper section-padding-100 clearfix">
        <div class="container">
            <div class="row align-items-end">
                <!-- Single Blog Area -->
                <div class="col-12 col-lg-4">
                    <div class="single-blog-area clearfix mb-100">
                        <!-- Blog Content -->
                        <div class="single-blog-content">
                            <div class="line"></div>
                            <a href="#" class="post-tag">iPodcast</a>
                            <h4><a href="#" class="post-headline">隨時隨地，找到頻率最對的聲音</a></h4>
                            <p>經典並非老派
                                iPodcast以音頻為基礎，結合創新科技應用
                                收藏你所愛，毋須擔心過時的問題
                                人性化的設計讓您隨時享受有溫度的聲音</p>
                            <a href="#" class="btn original-btn">由此進入收聽</a>
                        </div>
                    </div>
                </div>
                <!-- Single Blog Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-catagory-area clearfix mb-100">
                        <img src="kevin/images/V1.png" alt="">
                        <!-- Catagory Title -->
                        <div class="catagory-title">
                            <a href="#"></a>
                        </div>
                    </div>
                </div>
                <!-- Single Blog Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-catagory-area clearfix mb-100">
                        <img src="kevin/images/V2.png" alt="">
                        <!-- Catagory Title -->
                        <div class="catagory-title">
                            <a href="#"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-9">

                    <!-- Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.2s" data-wow-duration="1000ms">
                        <div class="row align-items-center">
                            <div class="col-12 col-md-6">
                                <div class="single-blog-thumbnail">
                                    <img src="kevin/images/婊姐必請.jpg" alt="">
                                    <div class="post-date">
                                        <a href="#">12 <span>march</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Blog Content -->
                                <div class="single-blog-content">
                                    <div class="line"></div>
                                    <a href="#" class="post-tag">iPodcast</a>
                                    <h4><a href="#" class="post-headline">[第38集]時尚產業公務員 aka 李函 & Jun，顏值超高情侶如何相處？</a></h4>
                                    <p>✔如何駕馭各種衣物？時尚感從何而來？
                                        ✔時尚圈中，最討厭哪種現象？
                                        ✔李函最真心的夢想！
                                        ✔時尚圈的各種眉角，光想就累。
                                        ✔台灣業主與國外業主的最大差異？</p>
                                    <div class="post-meta">
                                        <p>By <a href="#">張大品</a></p>
                                        <p>3 comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.3s" data-wow-duration="1000ms">
                        <div class="row align-items-center">
                            <div class="col-12 col-md-6">
                                <div class="single-blog-thumbnail">
                                    <img src="kevin/images/瘋女人聊天室.jpg" alt="">
                                    <div class="post-date">
                                        <a href="#">12 <span>march</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Blog Content -->
                                <div class="single-blog-content">
                                    <div class="line"></div>
                                    <a href="#" class="post-tag">iPodcast</a>
                                    <h4><a href="#" class="post-headline">人生太多意想不到，你也和你小時候想像的不一樣嗎？</a></h4>
                                    <p>小時候以為我們長大會變成的樣子
                                        殊不知長大後發生了很多如此多改變
                                        今天來聊聊人生中那些意想不到的事情</p>
                                    <div class="post-meta">
                                        <p>By <a href="#">程偉勝</a></p>
                                        <p>3 comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.4s" data-wow-duration="1000ms">
                        <div class="row">
                            <div class="col-12">
                                <div class="single-blog-thumbnail">
                                    <img src="kevin/images/P5.jpg" alt="">
                                    <div class="post-date">
                                        <a href="#">10 <span>march</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <!-- Blog Content -->
                                <div class="single-blog-content mt-50">
                                    <div class="line"></div>
                                    <a href="#" class="post-tag">iPodcast</a>
                                    <h4><a href="#" class="post-headline">[播客工廠] 完成你想成為Podcaster的夢想</a></h4>
                                    <p>首先先來說說什麼是播客吧～可以把播客想成是一種新興電台收聽的形式，它跟電台最大的差別是，電台需要定時去收聽特定的內容，不過播客是會有播客主建立一系列的清單，聽眾可以自由選擇要在什麼時候、收聽怎樣的內容...</p>
                                    <div class="post-meta">
                                        <p>By <a href="#">許家崴</a></p>
                                        <p>3 comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

<!--                     Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.5s" data-wow-duration="1000ms">
                        <div class="row align-items-center">
                            <div class="col-12 col-md-6">
                                <div class="single-blog-thumbnail">
                                    <img src="kevin/images/英文留聲機.jpg" alt="">
                                    <div class="post-date">
                                        <a href="#">12 <span>march</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Blog Content -->
                                <div class="single-blog-content">
                                    <div class="line"></div>
                                    <a href="#" class="post-tag">iPodcast</a>
                                    <h4><a href="#" class="post-headline">英文留聲機</a></h4>
                                    <p>《英文留聲機》是一個舒適又有趣的英語聽書節目，以聆聽的方式享受膾炙人口的文學作品、輕鬆加強英語聽力，而且多聽也有助於提升英語語感。節目將在每週日晚間九點，推出最新一集節目，請記得準時收聽！</p>
                                    <div class="post-meta">
                                        <p>By <a href="#">廖帝凱</a></p>
                                        <p>3 comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Single Blog Area  -->
                    <div class="single-blog-area blog-style-2 mb-50 wow fadeInUp" data-wow-delay="0.6s" data-wow-duration="1000ms">
                        <div class="row align-items-center">
                            <div class="col-12 col-md-6">
                                <div class="single-blog-thumbnail">
                                    <img src="kevin/images/眼球地下電台.jpg" alt="">
                                    <div class="post-date">
                                        <a href="#">12 <span>march</span></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <!-- Blog Content -->
                                <div class="single-blog-content">
                                    <div class="line"></div>
                                    <a href="#" class="post-tag">iPodcast</a>
                                    <h4><a href="#" class="post-headline">眼球地下電台</a></h4>
                                    <p>反諷寫得好，新聞看到老；追新聞比追劇還勤勞，就是我們的日常。而這些精挑細選出來的內容，是為何重要，哪裡精彩，怎麼荒謬，如何可笑？那些沒有在幕前呈現的，我們在這裡說給你聽。</p>
                                    <div class="post-meta">
                                        <p>By <a href="#">洪豪均、陳宣佑</a></p>
                                        <p>3 comments</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Load More -->
                    <div class="load-more-btn mt-100 wow fadeInUp" data-wow-delay="0.7s" data-wow-duration="1000ms">
                        <a href="#" class="btn original-btn">Read More</a>
                    </div>
                </div>

                <!-- ##### Sidebar Area ##### -->
                <div class="col-12 col-md-4 col-lg-3">
                    <div class="post-sidebar-area">

                        <!-- Widget Area -->
                        <!-- <div class="sidebar-widget-area">
                            <form action="#" class="search-form">
                                <input type="search" name="search" id="searchForm" placeholder="Search">
                                <input type="submit" value="submit">
                            </form>
                        </div> -->

                        <!-- Widget Area -->
                        <!-- <div class="sidebar-widget-area">
                            <h5 class="title subscribe-title">Subscribe to my newsletter</h5>
                            <div class="widget-content">
                                <form action="#" class="newsletterForm">
                                    <input type="email" name="email" id="subscribesForm" placeholder="Your e-mail here">
                                    <button type="submit" class="btn original-btn">Subscribe</button>
                                </form>
                            </div>
                        </div> -->

                        <!-- Widget Area -->
                        <div class="sidebar-widget-area">
                            <h5 class="title">今天想要小酌一下</h5>
                            <a href="#"><img src="/ipodcast/kevin/images/_會動的.gif" alt=""></a>
                        </div>

                        <!-- Widget Area
                        <div class="sidebar-widget-area">
                            <h5 class="title">Latest Posts</h5>

                            <div class="widget-content"> -->

                                <!-- Single Blog Post -->
                                <!-- <div class="single-blog-post d-flex align-items-center widget-post"> -->
                                    <!-- Post Thumbnail -->
                                    <!-- <div class="post-thumbnail">
                                        <img src="img/blog-img/lp1.jpg" alt="">
                                    </div> -->
                                    <!-- Post Content -->
                                    <!-- <div class="post-content">
                                        <a href="#" class="post-tag">Lifestyle</a>
                                        <h4><a href="#" class="post-headline">Party people in the house</a></h4>
                                        <div class="post-meta">
                                            <p><a href="#">12 March</a></p>
                                        </div>
                                    </div>
                                </div> -->

                                <!-- Single Blog Post -->
                                <!-- <div class="single-blog-post d-flex align-items-center widget-post"> -->
                                    <!-- Post Thumbnail -->
                                    <!-- <div class="post-thumbnail">
                                        <img src="img/blog-img/lp2.jpg" alt="">
                                    </div> -->
                                    <!-- Post Content -->
                                    <!-- <div class="post-content">
                                        <a href="#" class="post-tag">Lifestyle</a>
                                        <h4><a href="#" class="post-headline">A sunday in the park</a></h4>
                                        <div class="post-meta">
                                            <p><a href="#">12 March</a></p>
                                        </div>
                                    </div>
                                </div> -->

                                <!-- Single Blog Post -->
                                <!-- <div class="single-blog-post d-flex align-items-center widget-post"> -->
                                    <!-- Post Thumbnail -->
                                    <!-- <div class="post-thumbnail"> -->
                                        <!-- <img src="img/blog-img/lp3.jpg" alt=""> -->
                                    <!-- </div> -->
                                    <!-- Post Content -->
                                    <!-- <div class="post-content"> -->
                                        <!-- <a href="#" class="post-tag">Lifestyle</a> -->
                                        <!-- <h4><a href="#" class="post-headline">Party people in the house</a></h4> -->
                                        <!-- <div class="post-meta"> -->
                                            <!-- <p><a href="#">12 March</a></p> -->
                                        <!-- </div> -->
                                    <!-- </div> -->
                                <!-- </div> -->

                                <!-- Single Blog Post -->
                                <!-- <div class="single-blog-post d-flex align-items-center widget-post"> -->
                                    <!-- Post Thumbnail -->
                                    <!-- <div class="post-thumbnail">
                                        <img src="img/blog-img/lp4.jpg" alt="">
                                    </div> -->
                                    <!-- Post Content -->
                                    <!-- <div class="post-content">
                                        <a href="#" class="post-tag">Lifestyle</a>
                                        <h4><a href="#" class="post-headline">A sunday in the park</a></h4>
                                        <div class="post-meta">
                                            <p><a href="#">12 March</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->

                        <!-- Widget Area -->
                        <!-- <div class="sidebar-widget-area">
                            <h5 class="title">Tags</h5>
                            <div class="widget-content">
                                <ul class="tags">
                                    <li><a href="#">design</a></li>
                                    <li><a href="#">fashion</a></li>
                                    <li><a href="#">travel</a></li>
                                    <li><a href="#">music</a></li>
                                    <li><a href="#">party</a></li>
                                    <li><a href="#">video</a></li>
                                    <li><a href="#">photography</a></li>
                                    <li><a href="#">adventure</a></li>
                                </ul>
                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <!-- ##### Blog Wrapper End ##### -->

    <!-- ##### Instagram Feed Area Start ##### -->
    <div class="instagram-feed-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="insta-title">
                        <h5>本日精選</h5>
                    </div>
                </div>
            </div>
        </div>
        <!-- Instagram Slides -->
        <div class="instagram-slides owl-carousel">
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/下班尬一下.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/今天要喝酒.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/法客電台.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/移工故事書.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/轉吧創夢大叔.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/那些你不敢跟老闆說的話.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <!-- Single Insta Feed -->
            <div class="single-insta-feed">
                <img src="kevin/images/雀雀聊影劇.jpg" alt="">
                <!-- Hover Effects -->
                <div class="hover-effects">
                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Instagram Feed Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
 <div style = "margin: 40px auto;" >
			<footer id="footer" class="container" style="background-color:#D2E9FF">
				<div class="row">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組長</h3>
							<ul class="style2">
								<li class=a1>19 張大品</li>
								<!-- <li><a href="#">Aliquam imperdiet suscipit odio</a></li>
											<li><a href="#">Sed porttitor cras in erat nec</a></li>
											<li><a href="#">Felis varius pellentesque potenti</a></li>
											<li><a href="#">Nullam scelerisque blandit leo</a></li> -->
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>技術長</h3>
							<ul class="style2">
								<li class=a1>33 廖帝凱</li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Links -->
						<section class="widget links">
							<h3>組員</h3>
							<ul class="style2">

								<li class=a1>21 許佳崴</li>
								<li class=a1>37 程偉勝</li>
							</ul>
						</section>

					</div>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Contact -->
						<section class="widget contact last">
							<h3>組員</h3>
							<ul>
								<li class=a1>32 洪豪均</li>
								<li class=a1>10 陳宣佑</li>
							</ul>
						</section>

					</div>
				</div>

			</footer>
		</div>
				

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="<c:url value='/kevin/js/jquery-2.2.4.min.js'  />"></script>
    <!-- Popper js -->
    <script src="<c:url value='/kevin/js/popper.min.js'  />"></script>
    <!-- Bootstrap js -->
    <script src="<c:url value='/kevin/js/bootstrap.min.js'  />"></script>
    <!-- Plugins js -->
    <script src="<c:url value='/kevin/js/plugins.js'  />"></script>
    <!-- Active js -->
    <script src="<c:url value='/kevin/js/active.js'  />"></script>



</body>
</html>