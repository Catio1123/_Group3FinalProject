<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD</title>
<%-- <link rel='stylesheet' href="<c:url value='/css/styles.css' />" --%>
<!-- 	type="text/css" /> -->
</head>
<body>
Success <br/>
${user} - ${pwd}<br/>
<button onclick="window.location.href='MainExcise';" >進入系統</button>
<!-- <a href="insert.jsp"><input name="IAmManager" type="button" value="進入系統"/></a> -->

</body>
</html>