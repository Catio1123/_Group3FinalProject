<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<style>
	*{
		margin:0;
		padding:0
	}

	div img{
		padding: 20px;
	}
	
	.bg{
		/* flex-wrap: wrap; */
		flex-direction: column;
        display: flex;
        justify-content: center;
        align-items: center; 
        width: 100%;
        height: 720px;
        background-size: cover;
        background-image: url("https://images.squarespace-cdn.com/content/v1/5f28ff920ae34d61da923b1e/1604051578816-PBCFUFPXMUUNFWW63BFM/ff.jp")
    }
</style>

<title>iPodcast Event Site</title>
</head>

<body style="background-color: black;">

	<div class="bg">
		<b style="color: aliceblue;font-size: 100px;">iPodcast Events</b>
		<p style="color: aliceblue;font-size: 25px;padding: 20px 50px 0px 50px; text-align: center;">iPodcast 舉辦一系列串連活動，推廣台灣 Podcast 產業、促進台灣 Podcaster 交流，也探索 Podcast 在這片土地上的各種可能性。
			<br>透過各種主題企劃，我們期望拉近聽眾與創作者之間的距離，讓聲音與你的生活愈來越靠近。</p>
		
	</div>
	
	<c:forEach var="event" items="${event}">
		<div align="center">
			<a href="<c:url value='/eventInfo/${event.eventId}'/>"> 
				<img src="${event.pictureString}" width='700' height='500'>
			</a>
		</div>
	</c:forEach> 
	<div id="layoutAuthentication_footer">
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; iPodcast</div>
					<div>
						<a href="#">Privacy Policy</a>
						&middot;
						<a href="#">Terms &amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>