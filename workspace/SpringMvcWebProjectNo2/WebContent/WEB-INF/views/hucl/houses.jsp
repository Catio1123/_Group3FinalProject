<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script>
let dataArea = null;
window.addEventListener('load', function(){
	dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
// 	alert("aaa");
	xhr.open('GET', "jsoncreator03", true);
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
<h3  align="center">Welcome to House World</h3>
<hr>
<div align="center">
    <h2>Search by ID</h2>
    <form method="post" action="searchHouse03">
        <input type="text" name="houseid" /> &nbsp;
        <input type="submit" value="Search" />
    </form>
</div>
<hr>
<div align="center">
<h2>Edit an Entry</h2>
<form:form method="POST" action="updateHouse03" modelAttribute="house03">
	<table>
		<tr>
			<td><form:label path="houseid">House ID:</form:label></td>
			<td><form:input path="houseid"/></td>
		</tr>
		<tr>
			<td><form:label path="housename">House Name:</form:label></td>
			<td><form:input path="housename"/></td>
		</tr>
		<tr>
			<td colspan="2"><form:button value="Send">Submit</form:button></td>
		</tr>
	</table>
</form:form>
</div>
<hr>

<div align="center">
        <h2>Add a New Entry</h2>
        <form:form action="addHouse03" method="post" modelAttribute="house03">
            <table border="0" cellpadding="5">
                <tr>
                    <td>House ID: </td>
                    <td><form:input path="houseid" /></td>
                </tr>
                <tr>
                    <td>House Name: </td>
                    <td><form:input path="housename" /></td>
                </tr>
                    <td colspan="2"><input type="submit" value="Save"></td>
                           
            </table>
        </form:form>
    </div>
    <hr>
<div align="center">
    <h2>Delete by ID</h2>
    <form method="post" action="deleteHouse03">
        <input type="text" name="houseid" /> &nbsp;
        <input type="submit" value="Delete" />
        ${hDelete}<br>
    </form>
</div>

<hr>

<div id='dataArea'>

</div>
</body>
</html>