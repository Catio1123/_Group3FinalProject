<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<script>
let dataArea = null;
window.addEventListener('load', function(){
	dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	
	xhr.open("GET", "<c:url value='/getAllTypes'  />", true);
	xhr.send();
	xhr.addEventListener('readystatechange', function(){
		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log(xhr.responseText);
			dataArea.innerHTML = convertToHTML(xhr.responseText);
		}
		
	});
	
})

function convertToHTML(textData){
	let map = JSON.parse(textData);
	let segment = "<table border='1'>"; 
	segment += "<tr><th>類型編號</th><th>類型</th><th>日期</th><th>登錄時間</th><th>說明</th></tr>"; 
	if (map.size == 0){
		segment += "<tr colspan='5'> <td>查無餐廳類型資料</td></tr>";
	} else {
		let types = map.types;
		for(n =0 ; n < types.length; n++){
			let type = types[n];
			let typeId = type.typeId;
			let typeName = type.typeName;
			let createDate = type.createDate;
			let registerDate = type.registerDate;
			let comment = type.comment;
			segment += "<tr>";
			segment += "<td>" + typeId +  "</td>";
			segment += "<td>" + typeName +  "</td>";
			segment += "<td>" + createDate +  "</td>";
			segment += "<td>" + registerDate +  "</td>";
			segment += "<td>" + comment +  "</td>";
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
<h2>餐廳類型清單</h2>
<hr>
<div id='dataArea'>

</div>


</div>
</body>
</html>