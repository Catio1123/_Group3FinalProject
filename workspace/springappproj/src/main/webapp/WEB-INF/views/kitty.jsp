<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Boot</title>
<!--  <link  rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' />-->
<!-- <link  rel='stylesheet' href='/springapp/css/style.css' /> -->
<!-- <link rel='stylesheet' href='/css/style.css' /> <!-- / = html的文件根目錄( Document Root ) 也就是在伺服器( tomcat )裡面的資料夾 目前我們專案是放在 webapps 的資料夾-->
<link  rel='stylesheet' href="<c:url value='/css/style.css' />" />
</head>
<body>
<div align='center'>
    <h2>Spring Boot 範例</h2>
    <hr>
    <a href="/hello"> Hello </a><br> 
    <a href="<c:url value='/readfile/excel/abc' />"> 匯入初始資料</a><br> 
    <a href="<c:url value='/queryRestaurant' />"> 查詢餐廳資料 </a><br> 
    <a href="<c:url value='/insertRestaurant' />"> 新增餐廳資料 </a><br> 
    <a href="<c:url value='/toTextarea' />"> 測試TextArea </a><br> 
    <hr>
    Context Path 1= ${pageContext.request.contextPath}<br>
    Context Path 2= <c:url value="/" /><br>
    <hr>
<!-- <img  src='${pageContext.request.contextPath}/images/PDF.png' > -->
	<img src="<c:url value='/images/PDF.png' />">
	<br>
 </div>   
</body>
</body>
</html>