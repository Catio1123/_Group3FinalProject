<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script>
let dataArea = null;
window.addEventListener('load', function(){
	dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	xhr.open('GET', "jsoncreator", true);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status === 200){
			console.log(xhr.responseText);
			dataArea.innerHTML = showData(xhr.responseText);
		}
	};
	xhr.send();	
})
function showData(textData){
	let houses = JSON.parse(textData);
	let segment = "<table border='1'>";
	
	segment += "<tr><th>編號</th><th>名稱</th>";
	for(n = 0; n < houses.length ; n++){
		let house = houses[n];
		segment += "<tr>";
		segment += "<td>" + house.houseid + "</td>";
		segment += "<td>" + house.housename + "</td>";
		segment += "</tr>";
	}
	segment += "</table>";
	return segment;
	
}
</script>
<meta charset="UTF-8">
<title>Houses</title>
</head>
<body>
<h3>Welcome to House World</h3>
<form:form method="POST" action="updateHouse" modelAttribute="house">
	<table>
		<tr>
			<td><form:label path="houseid">houseId:</form:label></td>
			<td><form:input path="houseid"/></td>
		</tr>
		<tr>
			<td><form:label path="housename">houseName:</form:label></td>
			<td><form:input path="housename"/></td>
		</tr>
		<tr>
			<td colspan="2"><form:button value="Send">Submit</form:button></td>
		</tr>
	</table>
</form:form>
<hr>
<div id='dataArea'>

</div>
</body>
</html>