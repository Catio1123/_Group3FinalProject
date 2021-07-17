<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
	

<style>
	*{
		margin:0;
		padding:0;
	}
	.coverImg{	
        width: 100%;
		height: 100%;
		object-fit:cover;
    }
	.firstdiv{
		background-color:black;
		align-items: center;
	}

	.seconddiv{
		width: 80%;
		background-color: #F0F0F0;
		align-items: center;
		margin: auto;
		padding: 20px 20px 20px 20px;
	}
</style>

<title>${event.topic}--iPocast Event Site</title>
</head>

<body style="background-color: black;">
<div class="firstdiv">
	<div>
		<img  class="coverImg" src="${event.pictureString}">
	</div>

	<div class="seconddiv">
		<div>
			<b>${event.topic}</b><br><br>
		</div>
		<div>
			<b>活動時間</b>
			<p>${event.date}</p><br>
		</div>
		<div>
			<b>活動介紹</b><br>
			<p>${event.intro}</p><br>
		</div>
		<div>
			<b>相關連結</b><br>
			<a href="${event.link}" target="_blank">${event.link}</a><br><br>
		</div>
		<div>
			<b>活動地點</b>
			<p>${event.address}</p><br>
		</div>
	</div>
</div>
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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7aYRjJCDCo3Qw9PZe6TS9YfBYRmU1Vg4&callback=initMap"
    async defer></script>

</body>
</html>