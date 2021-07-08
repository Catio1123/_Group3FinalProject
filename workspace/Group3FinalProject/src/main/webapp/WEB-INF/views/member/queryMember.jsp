<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script>
let dataArea = null;
window.addEventListener('load',function(){
	dataArea = document.getElementById("dataArea");//不能放在外面，因為還沒有吃到下面的id
	let xhr = new XMLHttpRequest();
	xhr.open('Get', "<c:url value ='/findAll' />",true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			console.log(xhr.responseText);
			dataArea.innerHTML = showData(xhr.responseText);
		}
	};
	xhr.send();
	
	
})
function showData(textData){
	let members = JSON.parse(textData);
// 	segment 文件的片段
	let segment = "<table border='1'>";
	
	segment += "<tr><th>帳號</th><th>密碼</th><th>姓名</th><th>別稱</th><th>信箱</th><th>手機號</th><th>生日</th><th>性別</th></tr>";
	for(n = 0; n < members.length ; n++){
		let member = members[n];
		segment += "<tr>";
		segment += "<td>"+member.acctno   +"</td>";
		segment += "<td>"+member.pw       +"</td>";
		segment += "<td>"+member.name     +"</td>";
		segment += "<td>"+member.nickname +"</td>";
		segment += "<td>"+member.email    +"</td>";
		segment += "<td>"+member.celno    +"</td>";
		segment += "<td>"+member.dob      +"</td>";
		segment += "<td>"+member.gender   +"</td>";
		segment += "<td>"+member.role     +"</td>";
		segment += "<td>"+"<a href="+"<c:url value='/member/"+member.acctno+ "' />"+">"+"刪除"+"</a>"+"</td>";
// 		如果是圖檔的話
// 		segment += "<td><img width = '100' height = '60' src='"+member.photo'"> +"</td>";
		
		
		segment += "</tr>";
	}
		segment += "</table>";
		return segment;
	
	
}
</script>
<style>

body{
    background-color:#F0F0F0	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align = 'center'>
<h2>所有會員資料</h2>
<hr>
<a href="<c:url value='/'/> " >回首頁</a>
<div id='dataArea'>

</div>

</div> 

</body>
</html>