<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #F0F0F0
}
</style>
<body>
	<div align='center'>
		<h2>後臺中心</h2>
		<hr>
		<a href="<c:url value='/queryMember' />">查詢所有帳號名稱</a> <a
			href="<c:url value='/signUpMember' />">新增</a> <a
			href="<c:url value='/updateMember' />">修改</a> ${successMessage} <a
			href="<c:url value='/' /> ">回首頁</a> <br>
	</div>


</body>
</html>