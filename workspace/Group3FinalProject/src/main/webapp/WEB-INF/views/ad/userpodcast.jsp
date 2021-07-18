<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<script src="<c:url value='/wayne/creative/js/jquery-3.6.0.min.js' />"></script>
<script>

window.onload=function(){
	<c:forEach var="clicktime" items="${clicktime}">
	var button = document.getElementById("clickme${clicktime.aid}");
	button.addEventListener("click", function() {
		$.ajax({
			method: "POST",
			url: "<c:url value='/clicktimeadd'/>",
			data:{ "aid" : ${clicktime.aid }, "uid": ${clicktime.uid } },
			
		}),$.ajax({
			method: "POST",
			url: "<c:url value='/recordClickTimeAdd'/>",
			data: { 'aid' : ${clicktime.aid}, 'uid' : ${clicktime.uid } }
			
		}),$.ajax({
			method: "POST",
			url: "<c:url value='/addTotalClick'/>",
			data: { 'aid' : ${clicktime.aid } }
			
		});
	});
	
	

</c:forEach>
}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>使用者1Podcast</h2>



	<c:forEach var="clicktime" items="${clicktime}">


		
		<a id="clickme${clicktime.aid }"
			href="${clicktime.url}" target="_blank"><img width='100' height='60' src='${clicktime.pictureString }'></a>
		<h4>${clicktime.text }</h4>
		<br>
		<br>



	</c:forEach>

</body>
</html>