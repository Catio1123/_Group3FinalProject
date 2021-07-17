<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Victory - Blog page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/aviato/css/style.css">
		
        <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

		<script>
		let queryString = null;
		let query = null;
		
		window.onload = function() {
			queryString = document.getElementById("queryString");
			query = document.getElementById("query");
// 			queryType = document.getElementById("queryType");
			showall = document.getElementById("showall");
			
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/articleList'/>", true);
		
			xhr.send();
			query.addEventListener('click',
					function() {
						let userQueryString = queryString.value;
						if (!userQueryString) {
							alert('請輸入關鍵字，可輸入部分名稱');
							return;
						}
						let xhr2 = new XMLHttpRequest();
						xhr2.open('GET', "<c:url value='/queryByTitle' />?userQueryString="
								+ userQueryString);
						xhr2.send();
						xhr2.onreadystatechange = function() {
							if (xhr2.readyState == 4 && xhr2.status == 200) {
								var content = "<table id=reviewtable><thead>";
								let reviews = JSON.parse(xhr2.responseText);
								let length = reviews.length;
								if (length == 0){
									content += "<tr><th colspan='8'>查無資料</th></tr>";	
								}else{
									content += "<tr><th colspan='8'>找到"+ length +" 筆資料</th></tr>";
									var content = "<div class='col-md-8'>";
//			 						for (var i = 0; i <reviews.length ; i++) {
									for (var i = reviews.length-1; i >=0 ; i--) {
//			 						content += "";
									content += "	<div class='post'>";
									content += "		<div class='post-media post-thumb'>";
									content += "			<a href='"+reviews[i].url+"'>";
									content += "				<img src='"+ reviews[i].pictureString + "' alt=''>";
									content += "			<a>";
									content += "	</div>";
									content += "	<h2 class='post-title'><a href='"+reviews[i].url+"'>"+ reviews[i].reviewtitle + "</a></h2>";
									content += "		<div class='date'>"+ reviews[i].postdate + "</div>";
									content += "		<div class='post-meta'>";
									content += "			<ul>";
									content += "				<li>";
									content += "					<i class='tf-ion-android-person'></i> POSTED BY ADMIN";
									content += "				</li>";
									content += "				<li>";
									content += "					<a href='#!'><i class='tf-ion-ios-pricetags'></i>"+ reviews[i].foodtype + "</a>,";
									content += "					<a href='#!'>"+ reviews[i].genre + "</a>,";
									content += "					<a href='#!'>"+ reviews[i].city + "</a>;";
									content += "				</li>";
									content += "				<li>";
									content += "					<a href='#!'><i class='tf-ion-chatbubbles'></i> 4 COMMENTS</a>";
									content += "				</li>";
									content += "			</ul>";
									content += "		</div>";
									content += "			<div class='post-content'>";
									content += "			<p>" +reviews[i].highlight + "</p>";
									content += "			<a href='"+reviews[i].url+"' class='btn btn-main'>繼續閱讀</a>";
									content += "		</div>";
									}
									content += "</div>";
									var divs = document.getElementById("somedivS_post");
								}
								content += "</tbody></table>";
// 								var divs = document.getElementById("somedivS_post");
								divs.innerHTML = content;
							}
						}
					});
			
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
		// 				var content = "<table id=coupon><thead>";
		// 				content += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th><th>修改</th><th>刪除</th></tr></thead><tbody>";
						
						var reviews = JSON.parse(xhr.responseText);
// 						content1 += "<h2>"  + reviews[1].name + "</h2>";
// 						content1 += "<p>"  + reviews[1].reviewtitle + "</p>";
// 						content1 += "<p>"  + reviews[1].url + "</p>";
// 						content1 += "<img width='100' height='60' src='" + reviews[1].pictureString + "'>";
		
// 						var divs1 = document.getElementById("somedivS_1");
// 						divs1.innerHTML = content1;

						var content = "<div class='col-md-8'>";
// 						for (var i = 0; i <reviews.length ; i++) {
						for (var i = reviews.length-1; i >=0 ; i--) {
// 						content += "";
						content += "	<div class='post'>";
						content += "		<div class='post-media post-thumb'>";
						content += "			<a href='"+reviews[i].url+"'>";
						content += "				<img src='"+ reviews[i].pictureString + "' alt=''>";
						content += "			<a>";
						content += "	</div>";
						content += "	<h2 class='post-title'><a href='"+reviews[i].url+"'>"+ reviews[i].reviewtitle + "</a></h2>";
						content += "		<div class='date'>"+ reviews[i].postdate + "</div>";
						content += "		<div class='post-meta'>";
						content += "			<ul>";
						content += "				<li>";
						content += "					<i class='tf-ion-android-person'></i> POSTED BY ADMIN";
						content += "				</li>";
						content += "				<li>";
						content += "					<a href='#!'><i class='tf-ion-ios-pricetags'></i>"+ reviews[i].foodtype + "</a>,";
						content += "					<a href='#!'>"+ reviews[i].genre + "</a>,";
						content += "					<a href='#!'>"+ reviews[i].city + "</a>;";
						content += "				</li>";
						content += "				<li>";
						content += "					<a href='#!'><i class='tf-ion-chatbubbles'></i> 4 COMMENTS</a>";
						content += "				</li>";
						content += "			</ul>";
						content += "		</div>";
						content += "			<div class='post-content'>";
						content += "			<p>" +reviews[i].highlight + "</p>";
						content += "			<a href='"+reviews[i].url+"' class='btn btn-main'>繼續閱讀</a>";
						content += "		</div>";
						}
						content += "</div>";
						var divs = document.getElementById("somedivS_post");
						
						divs.innerHTML = content;
						
					<!-- EditorsPick No1 -->
						var contentEditorsPick01 = "";
						contentEditorsPick01 += "<div class='media'>"
						 + "	<a class='pull-left' href='"+ reviews[8].url +"'>"
						 + "	<img class='media-object' src='"+ reviews[8].pictureString + "' alt='Image'>"
						 + "		</a>"
						 + "			<div class='media-body'>"
						 + "			<h4 class='media-heading'><a href='"+ reviews[8].url +"'>" + reviews[8].reviewtitle + "</a></h4>"
						 + "	</div>"
						 + "</div>";
						var divsEditorsPick01 = document.getElementById("somedivS_EditorsPick01");
						divsEditorsPick01.innerHTML = contentEditorsPick01;
						
						<!-- EditorsPick No2 -->
						var contentEditorsPick02 = "";
						contentEditorsPick02 += "<div class='media'>"
						 + "	<a class='pull-left' href='"+ reviews[4].url +"'>"
						 + "	<img class='media-object' src='"+ reviews[4].pictureString + "' alt='Image'>"
						 + "		</a>"
						 + "			<div class='media-body'>"
						 + "			<h4 class='media-heading'><a href='"+ reviews[4].url +"'>" + reviews[4].reviewtitle + "</a></h4>"
						 + "	</div>"
						 + "</div>";
						var divsEditorsPick02 = document.getElementById("somedivS_EditorsPick02");
						divsEditorsPick02.innerHTML = contentEditorsPick02;
						
						<!-- EditorsPick No3 -->
						var contentEditorsPick03 = "";
						contentEditorsPick03 += "<div class='media'>"
						 + "	<a class='pull-left' href='"+ reviews[5].url +"'>"
						 + "	<img class='media-object' src='"+ reviews[5].pictureString + "' alt='Image'>"
						 + "		</a>"
						 + "			<div class='media-body'>"
						 + "			<h4 class='media-heading'><a href='"+ reviews[5].url +"'>" + reviews[5].reviewtitle + "</a></h4>"
						 + "	</div>"
						 + "</div>";
						var divsEditorsPick03 = document.getElementById("somedivS_EditorsPick03");
						divsEditorsPick03.innerHTML = contentEditorsPick03;
						
						<!-- EditorsPick No4 -->
						var contentEditorsPick04 = "";
						contentEditorsPick04 += "<div class='media'>"
						 + "	<a class='pull-left' href='"+ reviews[6].url +"'>"
						 + "	<img class='media-object' src='"+ reviews[6].pictureString + "' alt='Image'>"
						 + "		</a>"
						 + "			<div class='media-body'>"
						 + "			<h4 class='media-heading'><a href='"+ reviews[6].url +"'>" + reviews[6].reviewtitle + "</a></h4>"
						 + "	</div>"
						 + "</div>";
						var divsEditorsPick04 = document.getElementById("somedivS_EditorsPick04");
						divsEditorsPick04.innerHTML = contentEditorsPick04;
						
					
				}
		
				showall.addEventListener('click',function() {
					window.location.reload(false);});
				
			}}
		</script>
		
		
		<!-- 執行關鍵字連結 -->
		<script>
// 		let queryType = null;
		let tagQuery = null;
		
		window.onload = function() {
// 			queryType = document.getElementById("queryType");
			tagQuery = document.getElementById("snackFilter");
// 			queryType = document.getElementById("queryType");
			
			var xhr3 = new XMLHttpRequest();
			xhr3.open("GET", "<c:url value='/articleList'/>", true);
		
			xhr3.send();
			tagQuery.addEventListener('click',
					function() {
// 						let userQueryString = queryType.value;
// 						if (!userQueryString) {
// 							alert('請輸入關鍵字，可輸入部分名稱');
// 							return;
// 						}
						let xhr4 = new XMLHttpRequest();
						xhr4.open('GET', "<c:url value='/queryByFoodtype' />?'小吃'");
						xhr4.send();
						xhr4.onreadystatechange = function() {
							if (xhr4.readyState == 4 && xhr4.status == 200) {
								var content = "<table id=reviewtable><thead>";
								let reviews = JSON.parse(xhr4.responseText);
								let length = reviews.length;
								if (length == 0){
									content += "<tr><th colspan='8'>查無資料</th></tr>";	
								}else{
									content += "<tr><th colspan='8'>找到"+ length +" 筆資料</th></tr>";
									var content = "<div class='col-md-8'>";
//			 						for (var i = 0; i <reviews.length ; i++) {
									for (var i = reviews.length-1; i >=0 ; i--) {
//			 						content += "";
									content += "	<div class='post'>";
									content += "		<div class='post-media post-thumb'>";
									content += "			<a href='"+reviews[i].url+"'>";
									content += "				<img src='"+ reviews[i].pictureString + "' alt=''>";
									content += "			<a>";
									content += "	</div>";
									content += "	<h2 class='post-title'><a href='"+reviews[i].url+"'>"+ reviews[i].reviewtitle + "</a></h2>";
									content += "		<div class='date'>"+ reviews[i].postdate + "</div>";
									content += "		<div class='post-meta'>";
									content += "			<ul>";
									content += "				<li>";
									content += "					<i class='tf-ion-android-person'></i> POSTED BY ADMIN";
									content += "				</li>";
									content += "				<li>";
									content += "					<a href='#!'><i class='tf-ion-ios-pricetags'></i>"+ reviews[i].foodtype + "</a>,";
									content += "					<a href='#!'>"+ reviews[i].genre + "</a>,";
									content += "					<a href='#!'>"+ reviews[i].city + "</a>;";
									content += "				</li>";
									content += "			</ul>";
									content += "		</div>";
									content += "			<div class='post-content'>";
									content += "			<p>" +reviews[i].highlight + "</p>";
									content += "			<a href='"+reviews[i].url+"' class='btn btn-main'>繼續閱讀</a>";
									content += "		</div>";
									}
									content += "</div>";
									var divs = document.getElementById("somedivS_post");
								}
								content += "</tbody></table>";
// 								var divs = document.getElementById("somedivS_post");
								divs.innerHTML = content;
							}
						}
					});
			}
		</script>
		
		
</head>
<body>
<div class="header">
        <div class="container">
            <a href="#" class="navbar-brand scroll-top">Victory</a>
            <nav class="navbar navbar-inverse" role="navigation">
                <div class="navbar-header">
                    <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!--/.navbar-header-->
                <div id="main-nav" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="menu.html">Our Menus</a></li>
                        <li><a href="blog.html">Blog Entries</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                    </ul>
                </div>
                <!--/.navbar-collapse-->
            </nav>
            <!--/.navbar-->
        </div>
        <!--/.container-->
    </div>
    <!--/.header-->


    <section class="page-heading">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Our Blog</h1>
                    <p>You can feel free to use our template for any purpose of your websites. Thank you. Template re-distribution is <strong>not allowed</strong> in any download site.</p>
                </div>
            </div>
        </div>
    </section>







    <div class="page-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div>
						<table>
						   <tr>
						     <td align="center">
						        <input id="queryString" type='text' placeholder='關鍵字' />
						        <button
								style="border: none; background-color: #555555; color: white; border-radius: 4px;"
								id='query'>標題查詢</button>
								<button
								style="border: none; background-color: #555555; color: white; border-radius: 4px;"
								id='showall'>顯示全部</button>
						     </td>
						   </tr>
						</table>
					</div>
				
					<!-- <div class="post"></div> -->
					
					<hr>
					<div class="card-body">
						<div class='center' id='somedivS_post'></div>
					</div>
<!-- 					<div class="card-body"> -->
<!-- 						<div class='center' id='somedivS_Type'></div> -->
<!-- 						<br> -->
<!-- 					</div> -->
				
					
					

					<!-- <div class="post"></div> -->
					<!-- <div class="post"> -->
						<!-- Post-media Audio-->
<!-- 						<div class="post-media post-media-audio"> -->
<!-- 							<iframe -->
<!-- 								src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/115637399&amp;color=ff5500&amp;auto_play=false&amp;show_artwork=true" -->
<!-- 								class="DRAGDIS_iframe"></iframe> -->
<!-- 						</div> -->
<!-- 						<h2 class="post-title"><a href="blog-single.html">Standard Audio Post</a></h2> -->
<!-- 						<div class="post-meta"> -->
<!-- 							<ul> -->
<!-- 								<li> -->
<!-- 									<i class="tf-ion-ios-calendar"></i> 20, MAR 2017 -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<i class="tf-ion-android-person"></i> POSTED BY ADMIN -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#!"><i class="tf-ion-ios-pricetags"></i> LIFESTYLE</a>,<a href="#!"> -->
<!-- 										TRAVEL</a>, <a href="#!">FASHION</a> -->
<!-- 								</li> -->
<!-- 								<li> -->
<!-- 									<a href="#!"><i class="tf-ion-chatbubbles"></i> 4 COMMENTS</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 						<div class="post-content"> -->
<!-- 							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit vitae placeat ad -->
<!-- 								architecto nostrum asperiores vel aperiam, veniam eum nulla. Maxime cum magnam, adipisci -->
<!-- 								architecto quibusdam cumque veniam fugiat quae. Lorem ipsum dolor sit amet, consectetur -->
<!-- 								adipisicing elit. Odio vitae ab doloremque accusamus sit, eos dolorum officiis a -->
<!-- 								perspiciatis aliquid. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod, -->
<!-- 								facere</p> -->
<!-- 							<a href="blog-single.html" class="btn btn-main">Continue Reading</a> -->
					<div class="text-center">
						<!-- 分頁-->
						<ul class="pagination post-pagination">
							<li><a href="#!">Prev</a>
							</li>
							<li class="active"><a href="#!">1</a>
							</li>
							<li><a href="#!">2</a>
							</li>
							<li><a href="#!">3</a>
							</li>
							<li><a href="#!">4</a>
							</li>
							<li><a href="#!">5</a>
							</li>
							<li><a href="#!">Next</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<aside class="sidebar">
						<div class="widget widget-subscription">
							<!-- Right Side Bar - Get notified updates -->
							<h4 class="widget-title">搜尋食記</h4>
							<form>
								<div class="form-group">
									<input id="#" type='text' class="form-control" placeholder="關鍵字：台中、必比登" />
								</div>
								<button id='#' class="btn btn-main">查詢</button>
							</form>
						</div>

						<!-- Widget Latest Posts -->
						<div class="widget widget-latest-post">
							<!-- Right Side Bar - Latest Posts -->
							<h4 class="widget-title">編輯精選</h4>
							<div class="card-body">
								<div class='center' id='somedivS_EditorsPick01'></div>
							<br>
							</div>
							
							<div class="card-body">
								<div class='center' id='somedivS_EditorsPick02'></div>
							<br>
							</div>
							
							<div class="card-body">
								<div class='center' id='somedivS_EditorsPick03'></div>
							<br>
							</div>
							
							<div class="card-body">
								<div class='center' id='somedivS_EditorsPick04'></div>
							<br>
							</div>
						</div>
						<!-- End Latest Posts -->

						<div class="widget widget-category">
							<h4 class="widget-title">分類</h4>
							<ul class="widget-category-list">
								<li id='snackFilter'><a href="#!">小吃型態</a>
								</li>
								<li><a href="#!">餐廳型態</a>
								</li>
								<li><a href="#!">餐酒館</a>
								</li>
								<li><a href="#!">甜點</a>
								</li>
							</ul>
						</div> <!-- End category  --> 
			
						<!--Widget tag -->
						<div class="widget widget-tag">
							<h4 class="widget-title">熱門標籤</h4>
							<ul class="widget-tag-list">
								<li><a href="#!">必比登</a>
								</li>
								<li><a href="#!">台北</a>
								</li>
								<li><a href="#!">小吃</a>
								</li>
								<li><a href="#!">4分以上</a>
								</li>
							</ul>
						</div> <!-- End tag --> 
					</aside>
				</div>
			</div>
		</div>
	</div>
                
<!--                 <div class="col-md-8 col-md-offset-2"> -->
<!--                     <ul class="page-number"> -->
<!--                         <li class="active"><a href="#">1</a></li> -->
<!--                         <li><a href="#">2</a></li> -->
<!--                         <li><a href="#">3</a></li> -->
<!--                         <li><a href="#">4</a></li> -->
<!--                         <li><a href="#">&gt;&gt;</a></li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </section> -->

			

    <section class="sign-up">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading">
                        <h2>Signup for our newsletters</h2>
                    </div>
                </div>
            </div>
            <form id="contact" action="" method="get">
                <div class="row">
                    <div class="col-md-4 col-md-offset-3">
                        <fieldset>
                            <input name="email" type="text" class="form-control" id="email" placeholder="Enter your email here..." required="">
                        </fieldset>
                    </div>
                    <div class="col-md-2">
                        <fieldset>
                            <button type="submit" id="form-submit" class="btn">Send Message</button>
                        </fieldset>
                    </div>
                </div>
            </form>
        </div>
    </section>


    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <p>Copyright &copy; 2020 Victory Template</p>
                </div>
                <div class="col-md-4">
                    <ul class="social-icons">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <p>Design: TemplateMo</p>
                </div>
            </div>
        </div>
    </footer>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/main.js"></script>

    <script type="text/javascript">
    $(document).ready(function() {
        // navigation click actions 
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');         
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });
    // scroll function
    function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
    
    
    
    
    </script>
    
    
    
</body>
</html>