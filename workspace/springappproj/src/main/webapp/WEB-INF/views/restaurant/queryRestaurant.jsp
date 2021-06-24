<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link  rel='stylesheet' href="<c:url value='/css/style.css'  />" />
<script>
let dataArea = null; 
let restname = null; 
let query = null; 
window.addEventListener('load', function(){
	
	restname = document.getElementById("restname");
	query = document.getElementById("query");
	dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	xhr.open('GET', "<c:url value='/findAll' />", true);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200 ){
			console.log(xhr.responseText);
			dataArea.innerHTML = showData(xhr.responseText);
		}
	};
	xhr.send();
	
	
	query.addEventListener('click', function(){
		let rname = restname.value;
		if (!rname){
			alert('請輸入餐廳店名，可輸入部分名稱');
			return;
		}
		
		let xhr2 = new XMLHttpRequest();
		xhr2.open('GET', "<c:url value='/queryByName' />?rname=" + rname);
		xhr2.send();
		xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && xhr2.status == 200){
				dataArea.innerHTML = showData(xhr2.responseText);
			}
		}
		
		
	});
})
function showData(textObj){
	
	let obj = JSON.parse(textObj);
	let size = obj.size;
	let places = obj.list;
	let segment = "<table border='1' style='width:1200px;'>";
	
	if (size == 0){
		segment += "<tr><th colspan='8'>查無資料</th><tr>";
	} else {
		segment += "<tr><th colspan='8'>共計" + size + "筆資料</th><tr>";
	    segment += "<tr><th>編號</th><th>類型</th><th>店名</th><th>電話</th><th>地址</th><th>經度</th><th>緯度</th><th>照片</th></tr>";
	    for(n = 0; n < places.length ; n++){
		   	let place = places[n];
			let tmp1 = "<c:url value='/modifyRestaurant/'  />" + place.placeId;
	     	let tmp0 = "<a href='" + tmp1 + "' >" + place.name + "</a>";
			segment += "<tr>"; 	
			segment += "<td>" + place.placeId + "</td>"; 	
			segment += "<td>" + place.typeId + "</td>"; 	
			segment += "<td>" + tmp0 + "</td>"; 	
			segment += "<td>" + place.phone + "</td>"; 	
			segment += "<td>" + place.address + "</td>"; 	
			segment += "<td>" + place.longitude + "</td>"; 	
			segment += "<td>" + place.latitude + "</td>"; 	
			segment += "<td><img width='100' height='60' src='" + place.pictureString + "' ></td>"; 	
			segment += "</tr>"; 	
	   }
	}
	segment += "</table>"; 
	return segment;
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align='center'>
<h2>所有餐廳資料</h2>
<hr>
<font color='red'>${successMessage}</font>&nbsp;
<hr>


餐廳店名：<input id="restname" type='text' />
<button id='query'>提交</button>


<div  id='dataArea'>
</div>
<a href="<c:url value='/'/> " >回前頁</a>
</div>
</body>
</html>