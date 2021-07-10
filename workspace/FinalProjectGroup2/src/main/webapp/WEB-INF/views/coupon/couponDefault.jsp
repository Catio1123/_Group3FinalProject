<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="css/fontAwesome.css">
        <link rel="stylesheet" href="css/hero-slider.css">
        <link rel="stylesheet" href="css/owl-carousel.css">
        <link rel="stylesheet" href="css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
<script>
let dataArea = null;
window.addEventListener('load', function(){
	dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
// 	alert("aaa");
	xhr.open('GET', "jsoncreator1", true);
// 	alert("bbb");
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status === 200){
			console.log(xhr.responseText);
			dataArea.innerHTML = showData(xhr.responseText);
		}
	};
	xhr.send();	
})
function showData(textData){
	
	let coupons = JSON.parse(textData);
	let segment = "<table border='1'>";
	
	segment += "<tr><th>編號</th><th>公司</th><th>名稱</th><th>描述</th>";
	for(n = 0; n < coupons.length ; n++){
		let coupon = coupons[n];
		segment += "<tr>";
		segment += "<td>" + coupon.id + "</td>";
		segment += "<td>" + coupon.company + "</td>";
		segment += "<td>" + coupon.name + "</td>";
		segment += "<td>" + coupon.description + "</td>";
		segment += "</tr>";
	}
	segment += "</table>";
	return segment;
	
}
</script>
<meta charset="UTF-8">
<title>Coupons</title>
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
                        <li><a href="<c:url value='/' />">主頁</a></li>
                        <li><a href="">合作餐廳</a></li>
                        <li><a href="">食記文章</a></li>
                        <li><a href="admin">管理員</a></li>
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
                    <h4>Here you can find delecious foods</h4>
                    <h2>Asian Restaurant</h2>
                    <p>Quisque nec nibh id lacus fringilla eleifend sed sit amet sem. Donec lectus odio, mollis a nisl non, tempor interdum nisl.</p>
                    <div class="primary-button">
                        <a href="#" class="scroll-link" data-id="book-table">Order Right Now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>



<h3  align="center">Coupon</h3>
<hr>
<div align="center">
    <h2>Search by ID</h2>
    <form method="post" action="searchCoupon">
        <input type="text" name="id" /> &nbsp;
        <input type="submit" value="Search" />
    </form>
</div>
<hr>
<div align="center">
<h2>Edit an Coupon</h2>
<form:form method="POST" action="updateCoupon" modelAttribute="coupon">
	<table>
		<tr>
			<td><form:label path="id">折價券編號:</form:label></td>
			<td><form:input path="id"/></td>
		</tr>
		<tr>
			<td><form:label path="company">公司:</form:label></td>
			<td><form:input path="company"/></td>
		</tr>
		<tr>
			<td><form:label path="name">活動名稱:</form:label></td>
			<td><form:input path="name"/></td>
		</tr>
		<tr>
			<td><form:label path="description">活動描述:</form:label></td>
			<td><form:input path="description"/></td>
		</tr>
		<tr>
			<td colspan="2"><form:button value="Send">Submit</form:button></td>
		</tr>
	</table>
</form:form>
</div>
<hr>

<div align="center">
        <h2>Add a New Coupon</h2>
        <form:form action="addCoupon" method="post" modelAttribute="coupon">
            <table border="0" cellpadding="5">
                <tr>
                    <td>編號: </td>
                    <td><form:input path="id" /></td>
                </tr>
                <tr>
                    <td>公司: </td>
                    <td><form:input path="company" /></td>
                </tr>
                <tr>
                    <td>活動名稱: </td>
                    <td><form:input path="name" /></td>
                </tr>
                <tr>
                    <td>活動描述: </td>
                    <td><form:input path="description" /></td>
                </tr>
                    <td colspan="2"><input type="submit" value="Save"></td>
                           
            </table>
        </form:form>
    </div>
    <hr>
<div align="center">
    <h2>Delete by ID</h2>
    <form method="post" action="deleteCoupon">
        <input type="text" name="id" /> &nbsp;
        <input type="submit" value="Delete" />
        ${hDelete}<br>
    </form>
</div>

<hr>

<div id='dataArea'>


</div>
 <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <p>Copyright &copy; 2020 Victory Template</p>
                </div>
                <div class="col-md-4">
                    <ul class="social-icons">
                        <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-facebook"></i></a></li>
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
</body>
</html>