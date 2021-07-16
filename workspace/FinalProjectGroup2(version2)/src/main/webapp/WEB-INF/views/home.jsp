<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>訂餐趣 - 首頁</title>
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

        <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>

<c:choose>
<c:when test="${not empty CurrentUser}">

<c:set var="currentaccount" scope="session" value="${CurrentUser.account}"/>
<c:set var="currentname" scope="session" value="${CurrentUser.customerName}"/>
<c:set var="loginorout" scope="session" value="登出"/>
</c:when>

<c:otherwise>
<c:set var="currentaccount" scope="session" value="訪客帳號"/>
<c:set var="currentname" scope="session" value="訪客"/>
<c:set var="loginorout" scope="session" value="會員登入"/>
</c:otherwise>
</c:choose>

<div class="header">
        <div class="container">
<!--         	<div align="right"><a href="#"><h3>會員登入</h3></a></div> -->
<div id="myAccount" style="visibility:hidden" align="right" >
                        <a href="<c:url value="/member/gotoCustomerHomePage"/>">
                            <h3>👥我的帳號</h3>
                        </a>
                    </div>
        	<div align="right" id="logoutHref" style="visibility:hidden"><a  href="<c:url value="/member/logout"/>" ><h3>登出</h3></a></div>
            <div align="right" id="loginHref" ><a href="<c:url value="/member"/>"><h3>👥登入</h3></a></div>
        	<br><div class="heading" align="center"><img src="${pageContext.request.contextPath}/templatemo_507_victory/img/LOGO4.png"></div>
        	<br><br>
            <h3>你好，${currentname}，歡迎來到訂餐趣！</h3>
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
						<li><a href="home"><h3>🏠首頁</h3></a></li>
<!-- 						<li><a href="member"><h3>👥會員</h3></a></li> -->
						<li><a href="order"><h3>☎️訂單</h3></a></li>
						<li><a href="blog"><h3>📚食記</h3></a></li>
						<li><a href="res"><h3>🍽️餐廳</h3></a></li>
						<li><a href="empty"><h3>🍄營養</h3></a></li>
						<li><a href="couponIndex"><h3>🈹優惠</h3></a></li>
                    </ul>
                </div>
                <!--/.navbar-collapse-->
            </nav>
            <!--/.navbar-->
        </div>
        <!--/.container-->
    </div>
    <!--/.header-->


    <section class="banner">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                </div>
            </div>
        </div>
    </section>



    <section class="cook-delecious">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-md-offset-1">
                    <div class="first-image">
<%--                         <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/cook_01.jpg" alt=""> --%>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="cook-content">
                        <h1>🍗🍕🍷</h1>
                        <div class="contact-content">
                            <H3>熱門預定</H3s>
                        </div>
                        <div class="primary-white-button">
                            <a href="#" class="scroll-link" data-id="book-table">Hot</a>
                        </div>
                    </div>  
                </div>
                <div class="col-md-3">
                    <div class="second-image">
<%--                         <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/cook_02.jpg" alt=""> --%>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="services">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service-item">
                        <a href="menu.html">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/hot1.png" alt="Breakfast">
                        <h4>意舍酒店(排名1️⃣)</h4>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service-item">
                        <a href="menu.html">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/hot2.png" alt="Lunch">
                        <h4>missKOREA(排名2️⃣)</h4>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service-item">
                        <a href="menu.html">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/hot3.png" alt="Dinner">
                        <h4>台南大飯店(排名3️⃣)</h4>
                        </a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12">
                    <div class="service-item">
                        <a href="menu.html">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/hot4.png" alt="Desserts">
                        <h4>agnès b. CAFÉ(排名4️⃣)</h4>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="featured-food">
        <div class="container">
            <div class="row">
                <div class="heading">
                    <h2>餐廳品牌</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Breakfast</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/breakfast_item.jpg" alt="">
                        <div class="price">$4.50</div>
                        <div class="text-content">
                            <h4>Kale Chips Art Party</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Lunch</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/lunch_item.jpg" alt="">
                        <div class="price">$7.50</div>
                        <div class="text-content">
                            <h4>Taiyaki Gastro Tousled</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Dinner</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/dinner_item.jpg" alt="">
                        <div class="price">$12.50</div>
                        <div class="text-content">
                            <h4>Batch Squid Jean Shorts</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <section class="our-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading">
                        <h2>食記文章</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_01.jpg" alt="">
                        <div class="date">26 Oct 2020</div>
                        <div class="right-content">
                            <h4>Stumptown Tofu Schlitz</h4>
                            <span>Branding / Admin</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_02.jpg" alt="">
                        <div class="date">21 Oct 2020</div>
                        <div class="right-content">
                            <h4>Succulents Hashtag Folk</h4>
                            <span>Branding / Admin</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_03.jpg" alt="">
                        <div class="date">11 Oct 2020</div>
                        <div class="right-content">
                            <h4>Knaus Sriracha Pinterest</h4>
                            <span>Dessert / Chef</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_04.jpg" alt="">
                        <div class="date">03 Oct 2020</div>
                        <div class="right-content">
                            <h4>Crucifix Selvage Coat</h4>
                            <span>Plate / Chef</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


	<section class="featured-food">
        <div class="container">
            <div class="row">
                <div class="heading">
                    <h2>營養資訊</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Breakfast</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/breakfast_item.jpg" alt="">
                        <div class="price">$4.50</div>
                        <div class="text-content">
                            <h4>Kale Chips Art Party</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Lunch</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/lunch_item.jpg" alt="">
                        <div class="price">$7.50</div>
                        <div class="text-content">
                            <h4>Taiyaki Gastro Tousled</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="food-item">
                        <h2>Dinner</h2>
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/dinner_item.jpg" alt="">
                        <div class="price">$12.50</div>
                        <div class="text-content">
                            <h4>Batch Squid Jean Shorts</h4>
                            <p>Dreamcatcher squid ennui cliche chicharros nes echo  small batch jean shorts hexagon street art knausgaard wolf...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
	<section class="our-blog">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading">
                        <h2>廣告資訊</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_01.jpg" alt="">
                        <div class="date">26 Oct 2020</div>
                        <div class="right-content">
                            <h4>Stumptown Tofu Schlitz</h4>
                            <span>Branding / Admin</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_02.jpg" alt="">
                        <div class="date">21 Oct 2020</div>
                        <div class="right-content">
                            <h4>Succulents Hashtag Folk</h4>
                            <span>Branding / Admin</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_03.jpg" alt="">
                        <div class="date">11 Oct 2020</div>
                        <div class="right-content">
                            <h4>Knaus Sriracha Pinterest</h4>
                            <span>Dessert / Chef</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="blog-post">
                        <img src="${pageContext.request.contextPath}/templatemo_507_victory/img/blog_post_04.jpg" alt="">
                        <div class="date">03 Oct 2020</div>
                        <div class="right-content">
                            <h4>Crucifix Selvage Coat</h4>
                            <span>Plate / Chef</span>
                            <p>Skateboard iceland twee tofu shaman crucifix vice before they sold out corn hole occupy drinking vinegar chambra meggings kale chips hexagon...</p>
                            <div class="text-button">
                                <a href="#">Continue Reading</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="sign-up">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading">
						<h2>登入獲得更多餐廳資訊！</h2>
					</div>
				</div>
			</div>
			<form id="contact" action="" method="get">
				<div class="row">
					<div class="col-md-4 col-md-offset-3">
						<fieldset>
							<input name="email" type="text" class="form-control" id="email"
								placeholder="輸入您的郵件地址..." required="">
						</fieldset>
					</div>
					<div class="col-md-2">
						<fieldset>
							<button type="submit" id="form-submit" class="btn">聯絡我們</button>
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
					<p>Copyright &copy; 2021 訂餐趣</p>
				</div>
				<div class="col-md-4">
					<ul class="social-icons">
						<li><a rel="nofollow" href="https://fb.com/templatemo"><i
								class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-rss"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<p>Design: Team No.2</p>
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
		var currentUser = "${CurrentUser}";
		var customerName = "${CurrentUser.customerName}";

		window.onload = function(){

			if("${loginSuccess}" == "登入成功!"){
			// 	alert("${name}" + "," + "歡迎回來!");
			Swal.fire("${name}" + "," + "歡迎回來!");
		}


		// 有登入:隱藏登入標籤 & 沒登入:隱藏登出標籤，秀登入標籤
		var logoutHref = document.getElementById("logoutHref");
		var loginHref = document.getElementById("loginHref");
		var myAccount = document.getElementById("myAccount");

		if (!customerName) {
			logoutHref.hidden = true;
			myAccount.hidden = true;
			loginHref.style.visibility = "visible";
		}
		if (customerName) {
			logoutHref.style.visibility = "visible";
			myAccount.style.visibility = "visible";
			loginHref.hidden = true;
		}
}
</script>
</body>
</html>