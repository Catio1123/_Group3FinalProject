<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	<link rel="stylesheet" href="/ipodcast/ben/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/ipodcast/ben/fonts/line-icons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/ipodcast/ben/css/style.css">
    <style type="text/css">
    	.col-md-7{
    	margin-left:12%;
    	margin-right:12%;
    	margin-bottom:10px;
    	}
    	#Contopic{
    	color:#212122;
    	font-weight:700;
    	font-size:30px;
    	}
    	#forumCon{
    	background-color:waterblue;
    	border-style:none;
    	border-radius:5px 5px 5px 5px;
    	margin-left:12%;
    	margin-right:12%;
    	padding-left:20px;
    	padding-top:20px;
    	padding-bottom:20px;
    	font-weight:bold;
    	font-size:16px;
    	}
    	#forumCon > p{
    	margin-bottom:1px;
    	}
    	
    </style>    
  </head>
  <body id="top">

<!-- 跳轉動畫 -->
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
          <div class="site-logo col-6" style=""><a href="<c:url value='/'/>">to IPodcast</a></div>

          <nav class="mx-auto site-navigation">
            <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
<%--               <li><a href="<c:url value='/forum'/>" class="nav-link">Forum Home</a></li> --%>
<!--               <li><a href="services.html" class="active">Pages</a></li> -->

              <li class="d-lg-none"><a href="<c:url value='/forum'/>"><span class="mr-2 icon-home"></span>回論壇</a></li>
              <li class="d-lg-none"><a href="#"><span class="mr-2 icon-user"></span>${Member.name}</a></li>
            </ul>
          </nav>
          
          <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
            <div class="ml-auto">
              <a href="<c:url value='/forum'/>" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-add"></span>回論壇</a>
	          <a href="#" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="icon-user"> </span>${Member.name}</a>
            </div>
            <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
          </div>

        </div>
      </div>
    </header>

    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" id="home-section">
      <div class="container">
        <div class="row">
        </div>
      </div>
    </section>

	
    
    <section class="site-section" style="background-color:#f1f1f1;">
    
    	<!-- 標題 -->
    	<div class="col-md-7"> 
            <h1 id="Contopic"></h1>
            <div class="custom-breadcrumbs">
<%--               <a href="<c:url value='/forum'/>">Forum Home</a> <span class="mx-2 slash"></span> --%>
              <a href="#" id="Contype">Job</a> <span class="mx-2 slash">/</span>
              <span id="Contime"><strong>Product Designer</strong></span>
            </div>
          </div>
    		
    		<!-- 內文 -->
            <p id="forumCon"></p>
              
      <div class="container">
        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
<!--               <div class="border p-2 d-inline-block mr-3 rounded"> -->
<!--                 <img src="/ipodcast/ben/image/job_logo_5.jpg" alt="Image"> -->
<!--               </div> -->
              <div>
<%--                 <h2>${fcontent.topic}</h2> --%>
                <div>
<%--                   <span class="ml-0 mr-2 mb-2"><span class="icon-briefcase mr-2">${fcontent.type}版</span></span> --%>
<%--                   <span class="m-2"><span class="icon-room mr-2"></span>${fcontent.date}</span> --%>
<!--                   <span class="m-2"><span class="icon-clock-o mr-2"></span><span class="text-primary">Full Time</span></span> -->
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="row">
<!--               <div class="col-6"> -->
<!--                 <a href="#" class="btn btn-block btn-light btn-md"><span class="icon-heart-o mr-2 text-danger"></span>Update</a> -->
<!--               </div> -->
<!--               <div class="col-6"> -->
<!--                 <a href="#" class="btn btn-block btn-primary btn-md">Apply Now</a> -->
<!--               </div> -->
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-8">
            <div class="mb-5">
<!--               <figure class="mb-5"><img src="/ipodcast/ben/image/job_single_img_1.jpg" alt="Image" class="img-fluid rounded"></figure> -->
<!--               <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-align-left mr-3"></span>Job Description</h3> -->
<!--               <p>Velit unde aliquam et voluptas reiciendis non sapiente labore, deleniti asperiores blanditiis nihil quia officiis dolor vero iste dolore vel molestiae saepe. Id nisi, consequuntur sunt impedit quidem, vitae mollitia!</p> -->
            </div>
<!--             <div class="mb-5"> -->
<!--               <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-rocket mr-3"></span>Responsibilities</h3> -->
<!--               <ul class="list-unstyled m-0 p-0"> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Necessitatibus quibusdam facilis</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Velit unde aliquam et voluptas reiciendis n Velit unde aliquam et voluptas reiciendis non sapiente labore</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Commodi quae ipsum quas est itaque</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Deleniti asperiores blanditiis nihil quia officiis dolor</span></li> -->
<!--               </ul> -->
<!--             </div> -->

<!--             <div class="mb-5"> -->
<!--               <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-book mr-3"></span>Education + Experience</h3> -->
<!--               <ul class="list-unstyled m-0 p-0"> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Necessitatibus quibusdam facilis</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Velit unde aliquam et voluptas reiciendis non sapiente labore</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Commodi quae ipsum quas est itaque</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Deleniti asperiores blanditiis nihil quia officiis dolor</span></li> -->
<!--               </ul> -->
<!--             </div> -->

<!--             <div class="mb-5"> -->
<!--               <h3 class="h5 d-flex align-items-center mb-4 text-primary"><span class="icon-turned_in mr-3"></span>Other Benifits</h3> -->
<!--               <ul class="list-unstyled m-0 p-0"> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Necessitatibus quibusdam facilis</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Velit unde aliquam et voluptas reiciendis non sapiente labore</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Commodi quae ipsum quas est itaque</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit</span></li> -->
<!--                 <li class="d-flex align-items-start mb-2"><span class="icon-check_circle mr-2 text-muted"></span><span>Deleniti asperiores blanditiis nihil quia officiis dolor</span></li> -->
<!--               </ul> -->
<!--             </div> -->

            <div class="row mb-5">
              <div class="col-6">
                <a hidden="true" href="<c:url value='/forum/toUpdate'/>" class="btn btn-block btn-primary btn-md" id="updatebtn"><span class="mr-2 text-danger"></span>Update</a>
              </div>
              <div class="col-6">
              <form id="todelete" action="/toDelete" method="post">
              	<button hidden="true" id="deletebtn" class="btn btn-block btn-primary btn-md" ><span class="mr-2 text-danger"></span>Delete it</button>
              
              </form>
                
              </div>
            </div>

          </div>
<!--           <div class="col-lg-4"> -->
<!--             <div class="bg-light p-3 border rounded mb-4"> -->
<!--               <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Info</h3> -->
<!--               <ul class="list-unstyled pl-3 mb-0"> -->
<%--                 <li class="mb-2"><strong class="text-black">Po文時間: </strong>${fcontent.date}</li> --%>
<!--                 <li class="mb-2"><strong class="text-black">Vacancy:</strong> 20</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Employment Status:</strong> Full-time</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Experience:</strong> 2 to 3 year(s)</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Job Location:</strong> New ork City</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Salary:</strong> $60k - $100k</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Gender:</strong> Any</li> -->
<!--                 <li class="mb-2"><strong class="text-black">Application Deadline:</strong> April 28, 2019</li> -->
<!--               </ul> -->
<!--             </div> -->

<!--             <div class="bg-light p-3 border rounded"> -->
<!--               <h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">Share</h3> -->
<!--               <div class="px-3"> -->
<!--                 <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-facebook"></span></a> -->
<!--                 <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-twitter"></span></a> -->
<!--                 <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-linkedin"></span></a> -->
<!--                 <a href="#" class="pt-3 pb-3 pr-3 pl-0"><span class="icon-pinterest"></span></a> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
        </div>
      </div>
    </section>
    
    <section class="site-section" id="next-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 blog-content">
<!--             <div class="pt-5"> -->
<!--               <p>Categories:  <a href="#">Design</a>, <a href="#">Events</a>  Tags: <a href="#">#html</a>, <a href="#">#trends</a></p> -->
<!--             </div> -->


            <div class="pt-5">
              <h3 id="mb5" class="mb-5">6 Comments</h3>
              <ul id="commentlist" class="comment-list">
                <li class="comment">
                  <div class="vcard bio icon-user" style="font-size:48px;">
<!--                     <img src="/ipodcast/ben/image/user02.png" alt="Image placeholder"> -->
                  </div>
                  <div class="comment-body">
                    <h3> Jacob Smith</h3>
                    <div class="meta">January 9, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>

                <li class="comment">
                  <div class="vcard bio icon-user" style="font-size:48px;">
<!--                     <img src="images/person_3.jpg" alt="Image placeholder"> -->
                  </div>
                  <div class="comment-body">
                    <h3>Chris Meyer</h3>
                    <div class="meta">January 9, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>

                  <ul class="children">
                    <li class="comment">
                      <div class="vcard bio icon-user" style="font-size:48px;">
<!--                         <img src="images/person_5.jpg" alt="Image placeholder"> -->
                      </div>
                      <div class="comment-body">
                        <h3>Chintan Patel</h3>
                        <div class="meta">January 9, 2018 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                        <p><a href="#" class="reply">Reply</a></p>
                      </div>


                      <ul class="children">
                        <li class="comment">
                          <div class="vcard bio icon-user" style="font-size:48px;">
<!--                             <img src="images/person_1.jpg" alt="Image placeholder"> -->
                          </div>
                          <div class="comment-body">
                            <h3>Jean Doe</h3>
                            <div class="meta">January 9, 2018 at 2:21pm</div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                            <p><a href="#" class="reply">Reply</a></p>
                          </div>

                            <ul class="children">
                              <li class="comment">
                                <div class="vcard bio icon-user" style="font-size:48px;">
<!--                                   <img src="images/person_4.jpg" alt="Image placeholder"> -->
                                </div>
                                <div class="comment-body">
                                  <h3>Ben Afflick</h3>
                                  <div class="meta">January 9, 2018 at 2:21pm</div>
                                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                                  <p><a href="#" class="reply">Reply</a></p>
                                </div>
                              </li>
                            </ul>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li class="comment">
                  <div class="vcard bio icon-user" style="font-size:48px;">
<!--                     <img src="images/person_1.jpg" alt="Image placeholder"> -->
                  </div>
                  <div class="comment-body">
                    <h3>Jean Doe</h3>
                    <div class="meta">January 9, 2018 at 2:21pm</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p><a href="#" class="reply">Reply</a></p>
                  </div>
                </li>
              </ul>
              <!-- END comment-list -->
              
              <div class="comment-form-wrap pt-5">
                <div class="form-group">
                  <textarea name="message" onkeyup="autogrow(this);" style="resize:none;" id="message" cols="1" rows="1" placeholder="新增留言" class="form-control"></textarea>
                </div>
                <div class="form-group">
                  <input id="SendMessagebtn" type="submit" value="留言" class="btn btn-primary btn-md">
                </div>
              </div>
            </div>

          </div>
          <div class="col-lg-4 sidebar pl-lg-5">
            
            <div class="sidebar-box">
              <div class="categories">
                <h3>類別:</h3>
                <li><a href="#">八卦 <span></span></a></li>
                <li><a href="#">求學 <span></span></a></li>
                <li><a href="#">寵物 <span></span></a></li>
                <li><a href="#">感情 <span></span></a></li>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </section>
    
<!--     <section class="site-section" id="next"> -->
<!--       <div class="container"> -->

<!--         <div class="row mb-5 justify-content-center"> -->
<!--           <div class="col-md-7 text-center"> -->
<!--             <h2 class="section-title mb-2">22,392 Related Jobs</h2> -->
<!--           </div> -->
<!--         </div> -->
        
<!--         <ul class="job-listings mb-5"> -->
<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_1.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Product Designer</h2> -->
<!--                 <strong>Adidas</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> New York, New York -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-danger">Part Time</span> -->
<!--               </div> -->
<!--             </div> -->
            
<!--           </li> -->
<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_2.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Digital Marketing Director</h2> -->
<!--                 <strong>Sprint</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> Overland Park, Kansas  -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-success">Full Time</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </li> -->

<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_3.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Back-end Engineer (Python)</h2> -->
<!--                 <strong>Amazon</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> Overland Park, Kansas  -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-success">Full Time</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </li> -->

<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_4.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Senior Art Director</h2> -->
<!--                 <strong>Microsoft</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> Anywhere  -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-success">Full Time</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </li> -->

<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_5.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Product Designer</h2> -->
<!--                 <strong>Puma</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> San Mateo, CA  -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-success">Full Time</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_1.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Product Designer</h2> -->
<!--                 <strong>Adidas</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> New York, New York -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-danger">Part Time</span> -->
<!--               </div> -->
<!--             </div> -->
            
<!--           </li> -->
<!--           <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center"> -->
<!--             <a href="job-single.html"></a> -->
<!--             <div class="job-listing-logo"> -->
<!--               <img src="/ipodcast/ben/image/job_logo_2.jpg" alt="Image" class="img-fluid"> -->
<!--             </div> -->

<!--             <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4"> -->
<!--               <div class="job-listing-position custom-width w-50 mb-3 mb-sm-0"> -->
<!--                 <h2>Digital Marketing Director</h2> -->
<!--                 <strong>Sprint</strong> -->
<!--               </div> -->
<!--               <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"> -->
<!--                 <span class="icon-room"></span> Overland Park, Kansas  -->
<!--               </div> -->
<!--               <div class="job-listing-meta"> -->
<!--                 <span class="badge badge-success">Full Time</span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </li> -->

          

          
<!--         </ul> -->

        <div class="row pagination-wrap">
<!--           <div class="col-md-6 text-center text-md-left mb-4 mb-md-0"> -->
<!--             <span>Showing 1-7 Of 22,392 Jobs</span> -->
<!--           </div> -->
<!--           <div class="col-md-6 text-center text-md-right"> -->
<!--             <div class="custom-pagination ml-auto"> -->
<!--               <a href="#" class="prev">Prev</a> -->
<!--               <div class="d-inline-block"> -->
<!--               <a href="#" class="active">1</a> -->
<!--               <a href="#">2</a> -->
<!--               <a href="#">3</a> -->
<!--               <a href="#">4</a> -->
<!--               </div> -->
<!--               <a href="#" class="next">Next</a> -->
<!--             </div> -->
<!--           </div> -->
        </div>

      </div>
<!--     </section> -->
    

   

    <section class="pt-5 bg-image overlay-primary fixed overlay" style="background-color: url('/ipodcast/ben/image/hero_1.jpg');">
      <div class="container">
        <div class="row">
          <div class="col-md-6 align-self-center text-center text-md-left mb-5 mb-md-0">
            <h2 class="text-white">Get The Mobile Apps</h2>
            <p class="mb-5 lead text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit tempora adipisci impedit.</p>
            <p class="mb-0">
              <a href="#" class="btn btn-dark btn-md px-4 border-width-2"><span class="icon-apple mr-3"></span>App Store</a>
              <a href="#" class="btn btn-dark btn-md px-4 border-width-2"><span class="icon-android mr-3"></span>Play Store</a>
            </p>
          </div>
          <div class="col-md-6 ml-auto align-self-end">
            <img src="/ipodcast/ben/image/apps.png" alt="Image" class="img-fluid">
          </div>
        </div>
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

        <div class="row text-center" on>
          <div class="col-12">
            <p class="copyright"><small>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small></p>
          </div>
        </div>
      </div>
    </footer>
  
<!--   </div> -->

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
    
    <script src="/ipodcast/ben/js/bootstrap-select.min.js"></script>
    
    <script src="/ipodcast/ben/js/custom.js"></script>
    <script type="text/javascript">
    
    
    window.onload = function(){
    	
    	let forumCon = document.getElementById("forumCon");
    	let Contopic = document.getElementById("Contopic");
    	let Contype = document.getElementById("Contype");
    	let Contime = document.getElementById("Contime");
    	let todelete = document.getElementById("todelete");
    	let deletebtn = document.getElementById("deletebtn");
    	let updatebtn = document.getElementById("updatebtn");
    	let SendMessagebtn = document.getElementById("SendMessagebtn");
    	let Cid;
    	let Conuid;
    	
    	let xhrcontent = new XMLHttpRequest();
    	xhrcontent.open("GET", "<c:url value='/forum/getContentBean'/>", true);
    	xhrcontent.send();
    	xhrcontent.onreadystatechange = function(){
			 if(xhrcontent.readyState == 4 && xhrcontent.status == 200){
				 console.log(xhrcontent.responseText);
				 let content = unpackForContent(xhrcontent.responseText);
				 let stringData = content.con;
				 let newData = stringData.replace(new RegExp('\r\n','g'), '<br />');
				 forumCon.innerHTML = newData;
				 
				 Contopic.innerHTML = content.topic;
				 Contype.innerHTML = content.type;
				 
				 let time = content.date;
				 let showtime = time.slice(5,7)+"月"+time.slice(8,10)+"日 "+time.slice(11,16);
				 Contime.innerHTML = showtime;
				 
				 Conuid = content.uid;
			     Cid = content.fid;
		    	 todelete.action = "<c:url value='/forum/toDelete/" + Cid + "'/>";
			 }
		 }
    	
    	let acctno;
    	let xhruser = new XMLHttpRequest();
    	xhruser.open("GET", "<c:url value='/forum/getUserAcctno'/>", true);
    	xhruser.send();
    	xhruser.onreadystatechange = function(){
    		if(xhruser.readyState == 4 && xhruser.status == 200){
		    	acctno = xhruser.responseText;
		    	console.log(acctno == Conuid);
		    	if(acctno === Conuid){
		    		updatebtn.hidden = false;
		    		deletebtn.hidden = false;    		
		    	}
    		}
    	}
    	
    	findAllMessage();
    	
    	
    	SendMessagebtn.addEventListener("click",function(){
    		let message = document.getElementById("message");
    		console.log(message.value);
    		if(message.value != null){
	    		let xhr = new XMLHttpRequest();
	    		let url = "<c:url value='/forum/insertForumMessage/"+message.value+"' />";
	    		xhr.open("GET", url, true);
	    		xhr.send();
	    		xhr.onreadystatechange = function(){
	    			if(xhr.readyState == 4 && xhr.status == 200){
	    				let commentlist = document.getElementById("commentlist");
	    				commentlist.innerHTML = unpackForMessage(xhr.responseText);
	    			}
	    		}	
    		}
    	});
  	
    }
    
    function findAllMessage(){
    	let xhrmessage = new XMLHttpRequest();
    	xhrmessage.open("GET", "<c:url value='/forum/findForumMessage'/>", true);
    	xhrmessage.send();
    	xhrmessage.onreadystatechange = function(){
			 if(xhrmessage.readyState == 4 && xhrmessage.status == 200){
				 let commentlist = document.getElementById("commentlist");

				 commentlist.innerHTML = unpackForMessage(xhrmessage.responseText);
			 }
		 }
    }
    
   	function unpackForContent(text){
   		let content = JSON.parse(text);
   		return content;
   	}
   	
   	function unpackForMessage(text){
   		let messages = JSON.parse(text);
   		let mb5 = document.getElementById("mb5");
   		mb5.innerHTML = messages.length + "則留言";
   		let segment="";
   		for(let i = 0; i<messages.length;i++){
   			let message = messages[i];
   			segment += "<li class='comment'>";
   	   		segment += "<div class='vcard bio icon-user' style='font-size:48px;'></div>";
   	   		segment += "<div class='comment-body' onmouseenter='changeTags(this);'>";
   			segment += "<h3 style='font-weight:bold;'>"+message.uname+"</h3>";
   			segment += "<div class='meta'>"+message.date+"</div>";
   			segment += "<p>"+message.comment+"</p>";
   			segment += "<textarea hidden='true' onkeyup='autogrow(this);' style='resize:none;' rows='1'>"+message.comment+"</textarea>";
   			segment += "<p><button class='btn-primary' style='border:none;width:70px;display:inline-block;'>修改</button>&nbsp;<button id='"+message.mid+"' class='btn-primary' style='border:none;width:70px;display:inline-block;'>移除</button></p>";
   			segment += "</div>";
   	   		segment += "</li>";
   		}
   		return segment;
   	}
   	
   	function changeTags(messageDiv){
//    		if(messageDiv.onmouseleave){
//    			return;
//    		}
   		let innerP = messageDiv.getElementsByTagName("p")[0];
   		let innerUpdateBtn = messageDiv.getElementsByTagName("button")[0];
   		let innerDeleteBtn = messageDiv.getElementsByTagName("button")[1];
   		let innerTextarea = messageDiv.getElementsByTagName("textarea")[0];
   		let text = innerP.innerHTML;
   	 	
   		innerDeleteBtn.addEventListener("click", function(){
   			let xhrDeleteMessage = new XMLHttpRequest();
   			let url = "<c:url value='/forum/deleteMessage/"+innerDeleteBtn.id+"' />"
   			xhrDeleteMessage.open("POST", url, true);
   			xhrDeleteMessage.send();
   			xhrDeleteMessage.onreadystatechange = function(){
   				if(xhrDeleteMessage.readyState == 4 && xhrDeleteMessage.status == 200){
   					console.log(xhrDeleteMessage.responseText);
   				}
   			}
   			
   		});
   		
   		innerUpdateBtn.addEventListener("click", function(){
   			innerP.hidden = true;
	   		innerTextarea.hidden = false;
	   		innerDeleteBtn.hidden = true;
	   		innerUpdateBtn.innerHTML = "送出";
   		});
   		
   			
// 	   		innerUpdateBtn.onclick = "SendUpdateMessage()";   	 		
   	 	
   		
   	}
   	
//    	function SendUpdateMessage(){
//    		let xhr = new XMLHttpRequest();
//    		let url = "<c:url value=''/>"
//    		xhr.open("POST", url, true);
//    		xhr.send();
//    	}
   	
   	function autogrow(textarea){
   		let adjustedHeight = textarea.clientHeight;
   		adjustedHeight=Math.max(textarea.scrollHeight,adjustedHeight);
   		if (adjustedHeight > textarea.clientHeight){
   			textarea.style.height=adjustedHeight+'px';
   		}
   		
   		if(textarea.clientHeight>36 && textarea.scrollHeight <= textarea.clientHeight){
   			textarea.style.height = (textarea.scrollHeight-24) +'px';
   		}
   	}
   	
    </script>
  </body>
</html>