<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   

<!doctype html>
<html lang="en">
  <head>
    <title>JobBoard &mdash; Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <link rel="stylesheet" href="/ipodcast/ben/css/custom-bs.css">
    <link rel="stylesheet" href="/ipodcast/ben/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/ipodcast/ben/css/bootstrap-select.min.css">

    <link rel="stylesheet" href="/ipodcast/ben/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/ipodcast/ben/css/animate.min.css">
    <link rel="stylesheet" href="/ipodcast/ben/css/quill.snow.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/ipodcast/ben/css/style.css">    
  </head>
  <body id="top">

  <div id="overlayer"></div>
  <div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  </div>
    

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    <!-- NAVBAR -->
    <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="site-logo col-6"><a href="index.html">IForum</a></div>

          <nav class="mx-auto site-navigation">
            <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
              <li><a href="<c:url value='/' />" class="nav-link">Home</a></li>
              <li><a href="services.html" class="active">Pages</a></li>
              <li><a href="blog.html">Blog</a></li>

              <li class="d-lg-none"><a href="post-job.html"><span class="mr-2">+</span> Post a Comment</a></li>
              <li class="d-lg-none"><a href="<c:url value='/LoginPage'/>">Log In</a></li>
            </ul>
          </nav>
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
              <a href="post-job.html" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-add"></span>Post a Comment</a>
              <a href="<c:url value='/LoginPage'/>" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Log In</a>
            </div>
            <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>

        </div>
      </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('/ipodcast/ben/image/hero_1.jpg');" id="home-section">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h1 class="text-white font-weight-bold">Post A Comment</h1>
            <div class="custom-breadcrumbs">
              <a href="<c:url value='/' />">Home</a> <span class="mx-2 slash">/</span>
              <a href="#">Job</a> <span class="mx-2 slash">/</span>
              <span class="text-white"><strong>Post a Comment</strong></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    
    <section class="site-section">
      <div class="container">
      <h2> 更新文章</h2>
      <br>
		<form:form modelAttribute="bean" method="post">
			<div>
			<label>標題:</label>
			<form:input path="topic"/>			
			</div>
			<form:hidden path="type"/>
			<form:hidden path="fid"/>
			<div>
			<label>內容:</label>
			</div>
			<div>
			<form:textarea path="con" cols="80" rows="10"/>		
			</div>
			<input type='submit' class="btn btn-block btn-primary btn-md" value="Send" style="width:6em;">
		</form:form>	
		
				
			
			
<!--         <div class="row align-items-center mb-5"> -->
<!--           <div class="col-lg-8 mb-4 mb-lg-0"> -->
<!--             <div class="d-flex align-items-center"> -->
<!--               <div> -->
<!--                 <h2>Post A Comment</h2> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="col-lg-4"> -->
<!--             <div class="row"> -->
<!--               <div class="col-6"> -->
<!--                 <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Preview</a> -->
<!--               </div> -->
<!--               <div class="col-6"> -->
<%--                 <a href="<c:url value='/' />" class="btn btn-block btn-primary btn-md">Back Home</a> --%>
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         <div class="row mb-5"> -->
<!--           <div class="col-lg-12"> -->
<%--             <form:form modelAttribute="bean" class="p-4 p-md-5 border rounded" method="post" onsubmit="return check()"> --%>
<!--               <h3 class="text-black mb-5 border-bottom pb-2">Say Something</h3> -->
              
<!--               <div class="form-group"> -->
<!--                 <label for="company-website-tw d-block">Upload Featured Image</label> <br> -->
<!--                 <label class="btn btn-primary btn-md btn-file"> -->
<!--                   Browse File<input type="file"> -->
<!--                 </label> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<%--                 <form:label path="topic" for="email">文章標題</form:label> --%>
<%--                 <form:input path="topic" name="topic" type="text" class="form-control" id="topic" placeholder="請輸入標題" /> --%>
<!--               </div> -->
<!--               <div class="form-group"> -->
<%--                 <form:label path="type" for="job-title" >文章類型</form:label> --%>
<%--                 <form:select path="type" name="type" class="selectpicker border rounded" id="job-region" data-style="btn-black" data-width="100%" data-live-search="true" title="選擇類型"> --%>
<!--                   <option>--選擇類型--</option> -->
<%--                   <form:option>八卦</form:option> --%>
<%--                   <form:option>寵物</form:option> --%>
<%--                   <form:option>感情</form:option> --%>
<%--                   <form:option>求學</form:option> --%>
<%--                 </form:select> --%>
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="job-location">文章內容</label> -->
<!--                 <input type="text" class="form-control" id="job-location" placeholder="e.g. New York"> -->
<!--               </div> -->
<%--                   <form:input path="con" id="content001" type="text" name="content" hidden="true" />	 --%>
<!--               <div class="form-group"> -->
<!--                 <label for="job-description">文章內容</label> -->
<!--                 <div onkeyup="myFunction()" class="editor" id="editor-1"> -->
<!--                   <p></p> -->
			
<!--                 </div> -->
<!--               </div> -->


<!--               <h3 class="text-black my-5 border-bottom pb-2">Company Details</h3> -->
<!--               <div class="form-group"> -->
<!--                 <label for="company-name">Company Name</label> -->
<!--                 <input type="text" class="form-control" id="company-name" placeholder="e.g. New York"> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<!--                 <label for="company-tagline">Tagline (Optional)</label> -->
<!--                 <input type="text" class="form-control" id="company-tagline" placeholder="e.g. New York"> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<!--                 <label for="job-description">Company Description (Optional)</label> -->
<!--                 <div class="editor" id="editor-2"> -->
<!--                   <p>Description</p> -->
<!--                 </div> -->
<!--               </div> -->
              
<!--               <div class="form-group"> -->
<!--                 <label for="company-website">Website (Optional)</label> -->
<!--                 <input type="text" class="form-control" id="company-website" placeholder="https://"> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<!--                 <label for="company-website-fb">Facebook Username (Optional)</label> -->
<!--                 <input type="text" class="form-control" id="company-website-fb" placeholder="companyname"> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<!--                 <label for="company-website-tw">Twitter Username (Optional)</label> -->
<!--                 <input type="text" class="form-control" id="company-website-tw" placeholder="@companyname"> -->
<!--               </div> -->
<!--               <div class="form-group"> -->
<!--                 <label for="company-website-tw">Linkedin Username (Optional)</label> -->
<!--                 <input type="text" class="form-control" id="company-website-tw" placeholder="companyname"> -->
<!--               </div> -->

<!--               <div class="form-group"> -->
<!--                 <label for="company-website-tw d-block">Upload Logo</label> <br> -->
<!--                 <label class="btn btn-primary btn-md btn-file"> -->
<!--                   Browse File<input type="file" hidden> -->
<!--                 </label> -->
<!--               </div> -->
<!-- 					<input id="sendbtn" type="submit" class="btn btn-block btn-primary btn-md" value="Send" /> -->
<%--             </form:form> --%>
<!--           </div> -->

         
<!--         </div> -->
<!--         <div class="row align-items-center mb-5"> -->
<!--           <div class="col-lg-4 ml-auto"> -->
<!--             <div class="row"> -->
<!--               <div class="col-6"> -->
<!--                 <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>Preview</a> -->
<!--               </div> -->
<!--               <div class="col-6"> -->
<%--                 <a href="<c:url value='/' />" class="btn btn-block btn-primary btn-md">Send</a> --%>
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
      </div>
    </section>

    
    
    <footer class="site-footer">

<!--       <a href="#top" class="smoothscroll scroll-top"> -->
<!--         <span class="icon-keyboard_arrow_up"></span> -->
<!--       </a> -->

      <div class="container">
        <div class="row mb-5">
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>Search Trending</h3>
            <ul class="list-unstyled">
              <li><a href="#">Web Design</a></li>
              <li><a href="#">Graphic Design</a></li>
              <li><a href="#">Web Developers</a></li>
              <li><a href="#">Python</a></li>
              <li><a href="#">HTML5</a></li>
              <li><a href="#">CSS3</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>Company</h3>
            <ul class="list-unstyled">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Career</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Resources</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>Support</h3>
            <ul class="list-unstyled">
              <li><a href="#">Support</a></li>
              <li><a href="#">Privacy</a></li>
              <li><a href="#">Terms of Service</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>Contact Us</h3>
            <div class="footer-social">
              <a href="#"><span class="icon-facebook"></span></a>
              <a href="#"><span class="icon-twitter"></span></a>
              <a href="#"><span class="icon-instagram"></span></a>
              <a href="#"><span class="icon-linkedin"></span></a>
            </div>
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
    <script src="/ipodcast/ben/js/jquery.min.js"></script>
    <script src="/ipodcast/ben/js/bootstrap.bundle.min.js"></script>
    <script src="/ipodcast/ben/js/isotope.pkgd.min.js"></script>
    <script src="/ipodcast/ben/js/stickyfill.min.js"></script>
    <script src="/ipodcast/ben/js/jquery.fancybox.min.js"></script>
    <script src="/ipodcast/ben/js/jquery.easing.1.3.js"></script>
    
    <script src="/ipodcast/ben/js/jquery.waypoints.min.js"></script>
    <script src="/ipodcast/ben/js/jquery.animateNumber.min.js"></script>
    <script src="/ipodcast/ben/js/owl.carousel.min.js"></script>
    <script src="/ipodcast/ben/js/quill.min.js"></script>
    
    <script src="/ipodcast/ben/js/bootstrap-select.min.js"></script>
    
    <script src="/ipodcast/ben/js/custom.js"></script>
	<script type="text/javascript">
		function myFunction(){
// 			let x = document.getElementsByClassName("ql-editor")[0]
// 			let y = x.getElementsByTagName("p")[0];
// 			let z = document.getElementById("content001");

// 			z.value = y.innerText;
		}
		
		 function check()
	        {
			 	let topic = document.getElementById("topic");
				let type = document.getElementById("type");
				let content = document.getElementById("content001");	
				let sendbtn = document.getElementById("sendbtn");
                <!-- 若<form>屬性name值為reg裡的文字方塊值為空字串，則顯示「未輸入姓名」 -->
                if(topic.value == "") 
                {
                        alert("請不要留白");
                        return false;
                }
                <!-- 若<form>屬性name值為reg裡的文字方塊與下拉式選單值為空字串或是沒有選擇月或日，則顯示「未輸入完整生日日期」 -->
                else if(type.value == "")
                {
                        alert("請不要留白");
                        return false;
                }
                <!-- 若<form>屬性name值為reg裡的核取方塊沒有選擇，則顯示「未選擇性別」 -->
                else if(content.value == "")
                {
                         alert("請不要留白");
                         return false;
                }
                <!-- 若以上條件皆不符合，也就是表單資料皆有填寫的話，則將資料送出 -->
                else {
                	return true;
                }
;
	         }
		
		window.onload = function(){
			
			
			
			
				
			
		}
		
	</script>   

     
  </body>
</html>