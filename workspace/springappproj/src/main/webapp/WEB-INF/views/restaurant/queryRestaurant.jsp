<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />">
<script type="text/javascript">

	window.onload = function(){
		let dataArea = document.getElementById("dataArea");
		let xhr1 = new XMLHttpRequest();
		xhr1.open("GET","<c:url value='/findAll' />", true);
		xhr1.send();
		xhr1.onreadystatechange = function(){
			if(xhr1.readyState == 4 && xhr1.status == 200){
				console.log(xhr1.responseText);
				dataArea.innerHTML = showData(xhr1.responseText);
			}
		}
		
		function showData(textData){
			let places = JSON.parse(textData);
			let segment = "<table border='1'>";
			segment += "<tr><th>編號</th><th>類型</th><th>店名</th><th>電話</th><th>地址</th><th>經度</th><th>緯度</th><th>照片</th></tr>";
			for(let i =0; i<places.length;i++){
				let place = places[i];
				segment += "<tr>";
				segment += "<td>" + place.placeId + "</td>";				
				segment += "<td>" + place.typeId + "</td>";				
				segment += "<td>" + place.name + "</td>";				
				segment += "<td>" + place.phone + "</td>";				
				segment += "<td>" + place.address + "</td>";				
				segment += "<td>" + place.longitude + "</td>";				
				segment += "<td>" + place.latitude + "</td>";				
				segment += "<td>" + "<image width='100' height='100' src='" + place.pictureString + "' >" + "</td>";				
				segment += "</tr>";
			}
			segment += "</table>";
			return segment;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2>所有餐廳資料</h2>
		<div id="dataArea">
		
		</div>
	</div>
</body>
</html>