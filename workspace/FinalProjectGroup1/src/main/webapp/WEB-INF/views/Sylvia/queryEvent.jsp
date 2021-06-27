<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>

<script>

let dataArea = null; 
let restname = null; 
let query = null; 
window.addEventListener('load',function(){

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
			alert('輸入想搜尋的內容');
			return;
		}
		
		let xhr2 = new XMLHttpRequest();
		xhr2.open('GET', "<c:url value='/findByName' />?rname=" + rname);
		xhr2.send();
		xhr2.onreadystatechange=function(){
			if (xhr2.readyState == 4 && xhr2.status == 200){
				
				dataArea.innerHTML = showData(xhr2.responseText);
		
		}
		
	}
		
	});
		
})

function showData(textData){
	let events =  JSON.parse(textData);
	let segment = "<table border='1' >";
	/*
	if (size == 0){
		segment += "<tr><th colspan='8'>查無資料</th><tr>";
	} else {		
	segment += "<tr><th colspan='8'>共計" + size + "筆資料</th><tr>";
	*/
	segment += "<tr><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th></tr>";
	for(n = 0 ; n < events.length ; n++ ){
		let event = events[n];
		let tmpurl1 ="<c:url value='/modifyEvent/' />" + event.id;
    	let tmpurl0 = "<a href='" + tmpurl1 + "'>" + event.name  + "</a>";
    //	console.log( "tmpurl0",tmpurl0);
		segment += "<tr>";
		segment += "<td>" + event.id +"</td>";
		segment += "<td>" + tmpurl0 +"</td>";
		segment += "<td>" + ' $ ' + event.price  +"</td>";
		segment += "<td>"+ event.address  +"</td>";
		segment += "<td><img width='100' height='60' src='" +event.pictureString  +"'></td>";
		segment += "</tr>";
//	 }
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
<h2>All Event</h2>
<hr>
<a href="<c:url value='/'/>"> 返回上一頁</a>
<br>

<input id='restname' type='text' />
<button id='query' >搜尋</button>

<br>
${successMessage}&nbsp;
<hr>
<div id='dataArea'></div>

</div>
</body>
</html>