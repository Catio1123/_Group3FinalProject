<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head> <!-- Document Root -->

<!-- <link  rel='stylesheet'  -->
<%-- 	 href='${pageContext.request.contextPath}/css/style.css' /> --%>
<!-- <link  rel='stylesheet' href='/springapp/css/style.css' /> -->
<link  rel='stylesheet' href='<c:url value='/css/style.css'/>' />

<meta charset="UTF-8">
<title>Spring Boot</title>
</head>
<body>
<div align='center'>
    <h2>Spring Boot 範例</h2>
    <hr>
    <a href="<c:url value='/hello' />"> Hello World</a><br> 
    <a href="<c:url value='/readfile/testing/elena' />"> 匯入初始資料 </a><br> 
    <a href="<c:url value='/queryRestaurant' />"> 查詢餐廳資料 </a><br> 
    <hr>
    <!-- 下面第一個才是真的contextPath -->
<%--     Context Path 1= ${pageContext.request.contextPath}<br> --%>
<%--     Context Path 2= <c:url value='/'/><br> --%>
<%--     Context Path 3= <c:url value='/springapp'/><br> --%>
    <hr>
<%--     <img  src='${pageContext.request.contextPath}/images/PDF.png' > --%>
<!-- 最好用c:url -->
    <img  src='<c:url value='/images/PDF.png'/>' >
 </div>   
</body>
</body>
</html>
