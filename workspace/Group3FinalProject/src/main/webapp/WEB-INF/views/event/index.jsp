<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel='stylesheet' href="<c:url value='/bill/css/style.css' />" />
<meta charset="UTF-8">
<title>Event</title>
</head>

<body>
	<header>
		<div align='center'>
			<h2>活動</h2>
		</div>
	</header>
	
	<div align='center'>
		<br>
		<a href="<c:url value='/queryEvent' />" style="font-size:30px"> 查詢所有資料 </a><br><br>
		<a href="<c:url value='/insertEvent' />" style="font-size:30px">新增活動資料</a><br>
		<a href="<c:url value='/eventIndex' />" style="font-size:30px">AAAAAA</a><br>  
		
		
	</div>
	
</body>

</html>