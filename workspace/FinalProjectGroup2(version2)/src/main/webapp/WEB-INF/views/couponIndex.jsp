<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<script>
let cname = null;
let query = null;

window.onload = function() {
	cname = document.getElementById("cname");
	query = document.getElementById("query");
	showall = document.getElementById("showall");
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/couponList'/>", true);

	xhr.send();
	query.addEventListener('click',
			function() {
				let ccname = cname.value;
				if (!ccname) {
					alert('請輸入餐廳店名，可輸入部分名稱');
					return;
				}
				let xhr2 = new XMLHttpRequest();
				xhr2.open('GET', "<c:url value='/queryByName' />?ccname="
						+ ccname);
				xhr2.send();
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						var content = "<table id=coupon><thead>";
						let members = JSON.parse(xhr2.responseText);
						let length = members.length;
						if (length == 0){
							content += "<tr><th colspan='8'>查無資料</th><tr>";	
						}else{
							content += "<tr><th colspan='8'>共計"+ length +" 筆資料</th><tr>";
						content += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th></tr></thead><tbody>";
						for (var i = 0; i < members.length; i++) {
							
							let tmp1 = "<c:url value='/delete/'/>" + members[i].id;
							let tmp2 = "<c:url value='/updateCoupon/'/>" + members[i].id;

							content += "<tr><td width='70'>"
									+ members[i].id
									+ "</td>"
									+ "<td align='center'>"
									+ members[i].company
									+ "</td>"
									+ "<td>"
									+ members[i].name
									+ "</td>"
									+ "<td align='left'>"
									+ members[i].description
									+ "&nbsp;</td>"
									
							"</tr>";
						}
						}
						content += "</tbody></table>";
						var divs = document.getElementById("somedivS");
						divs.innerHTML = content;
					}
				}

			});

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var content = "<table id=coupon><thead>";
			content += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th></tr></thead><tbody>";
			var members = JSON.parse(xhr.responseText);
			for (var i = 0; i < members.length; i++) {
				tmp = "<c:url value='/couponList'/>";
				let tmp1 = "<c:url value='/delete/'/>" + members[i].id;
				let tmp2 = "<c:url value='/updateCoupon/'/>" + members[i].id;

				content += "<tr><td width='70'>"
						+ members[i].id
						+ "</td>"
						+ "<td align='center'>"
						+ members[i].company
						+ "</td>"
						+ "<td>"
						+ members[i].name
						+ "</td>"
						+ "<td align='left'>"
						+ members[i].description
						+ "&nbsp;</td>"
					
					
				"</tr>";
			}
			content += "</tbody></table>";
			var divs = document.getElementById("somedivS");
			divs.innerHTML = content;
		}
	}
	
	showall.addEventListener('click',function() {
	window.location.reload(false);});

}


</script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>訂餐趣 - 廣告優惠</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">

<link
	href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">

<script
	src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC:wght@900&family=Open+Sans&display=swap" rel="stylesheet">

</head>
<body>
	<div class="header">
		<div class="container">
			<br><div class="heading" align="center"><img src="${pageContext.request.contextPath}/templatemo_507_victory/img/LOGO4.png"></div>
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">

				</div>
				<!--/.navbar-header-->
				<div id="main-nav" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="home"><h3>🏠首頁</h3></a></li>
						<li><a href="index"><h3>👥會員</h3></a></li>
						<li><a href="menu"><h3>☎️訂單</h3></a></li>
						<li><a href="blog"><h3>📚食記</h3></a></li>
						<li><a href="res"><h3>🍽️餐廳</h3></a></li>
						<li><a href="dish"><h3>🍄營養</h3></a></li>
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
	

<br><br>
		<div class="container">
			<div class="row">
				<div class="heading" align="center">
					<h1><font face="Noto Serif TC">🥂訂餐趣獨家優惠🍹</font></h1>
				</div>
				<div align="center">
					<br> 活動名稱：<input id="cname" type='text' /><br> <br>
					<button
						style="border: none; background-color: #555555; color: white; border-radius: 4px;"
						id='query'>查詢</button>
					<button
						style="border: none; background-color: #555555; color: white; border-radius: 4px;"
						id='showall'>顯示全部</button>
					

				</div>
				<br><br><br>
				<div class="card-body">
									<div class='center' id='somedivS'></div>
									<br>
								</div>
			</div>
			<div class="heading" align="center">
			<h1>🍽️精選優惠🍜</h1>
				</div>
				<br><br>
			<div class="row">
				<div class="col-md-4">
					<div class="food-item">
						<h2>獨家優惠一</h2>
						<a href="https://www.cathaybk.com.tw/cathaybk/">
						<img
							src="${pageContext.request.contextPath}/templatemo_507_victory/img/coupon1.png"
							alt="">
							</a>
						<div class="price">67% OFF</div>
						<div class="text-content">
							<h4>國泰世華銀行卡友尊享 限量優惠33折起</h4>
							<p>EZTABLE 簡單桌  國泰世華 萬國美食節
【活動一：國泰世華卡友刷卡訂位 可享預付最高 5% 回饋】
（指定餐廳預付現折 3% + 折扣後金額再享 2% EZCASH回饋）
活動時間：2021/4/8~2021/5/9
優惠席次：訂位限量3,500席
以上優惠，還可併用指定餐廳再享平台回饋 0.5~5% EZCASH
所有優惠併用，最高可享 10%回饋！

＊活動一與活動二不可併用，須使用於不同筆消費＊

EZTABLE 簡單桌 ? 國泰世華 萬國美食節
【活動二：國泰世華卡友刷卡訂位 用餐後可獲得現折50元優惠代碼x2組】
活動時間：2021/4/8~2021/5/9
優惠席次：訂位限量3,500筆
以上優惠，還可併用指定餐廳再享平台回饋 0.5~5% EZCASH
（本優惠代碼將於活動結束後匯入符合資格卡友之EZTABLE簡單桌會員帳號中，可適用於次筆消費預訂EZGO自由座滿100元現折50，單筆消費可以抵用一組優惠代碼，部分優惠餐廳不適用。）

＊活動一與活動二不可併用，須使用於不同筆消費＊</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="food-item">
						<h2>獨家優惠二</h2>
						<a href="https://www.visa.com.tw/">
						<img
							src="${pageContext.request.contextPath}/templatemo_507_victory/img/coupon2.png"
							alt="">
							</a>
						<div class="price">25% OFF</div>
						<div class="text-content">
							<h4>Visa無限卡精選米其林餐廳 預付訂位享 20% EZCASH回饋</h4>
							<p>指定餐廳線上預付金額20% EZCASH回饋
（單筆消費回饋上限500 EZCASH）
活動時間：2021/01/01-2021/12/31
限量 600席/月
名額有限 額滿為止

除了Visa無限卡的加碼回饋之外，還能享有原本指定餐廳最高5% EZCASH的平台回饋喔！ 所有優惠併用，最高有機會享25%。(20%EZCASH+部分餐廳0-5% EZCASH回饋)</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="food-item">
						<h2>獨家優惠三</h2>
						<a href="https://www.post.gov.tw/post/internet/Visa/">
						<img
							src="${pageContext.request.contextPath}/templatemo_507_victory/img/coupon3.png"
							alt="">
							</a>
						<div class="price">10% OFF</div>
						<div class="text-content">
							<h4>郵政Visa金融卡友專屬優惠 預付訂位享 10%現折</h4>
							<p>預付享10%現折，最高15%回饋
指定餐廳線上預付金額10% 現折
活動時間：2020/11/01-2022/3/31
限量 2000席/月
名額有限 額滿為止
每卡每月(以訂購日計算)限使用2次，且不適用於併桌或併單。

除了金融卡的加碼回饋之外，還能享有原本指定餐廳最高5% EZCASH的平台回饋喔！ 所有優惠併用，最高有機會享15%。(10%現折+部分餐廳0-5% EZCASH回饋)</p>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/bootstrap.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/templatemo_507_victory/js/main.js"></script>

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