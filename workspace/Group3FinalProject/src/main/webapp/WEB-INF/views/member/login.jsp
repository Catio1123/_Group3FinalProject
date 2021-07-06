<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>歡迎來到iPodcast</title>
</head>
<link rel='stylesheet' href="<c:url value='/kevin/css/login.css' />" type="text/css" />

<body bgcolor="#D2E9FF">


		<header>
			<h1>iPodcast</h1>
		</header>
  <form:form action="checklogin" method="Post" modelAttribute="member">
		<fieldset>
			<table>
				<tr>
					<td><form:label path="acctno">帳號:</form:label></td>
					<td><form:input path="acctno" placeholder="請輸入您的使用者帳號"/><td>
					<td>${errors.acctno}</td>
				</tr>
				<tr>
					<td><form:label path="pw">密碼:</form:label></td>
					<td><form:input path="pw" type="Password" placeholder="請輸入您的使用者密碼"/><td>
					<td>${errors.pw}</td>
				</tr>
				<tr>
					<td><input name="登入" type="submit"></td>
					<td>${errors.msg}</td>
				</tr>
			</table>

			<a href="<c:url value='/signUpMember'  />" style="font-size: 5px">還沒註冊嗎?</a>


			<!-- 		<CENTER> -->
			<!--             <INPUT name="Search" TYPE="SUBMIT" style="width:200px ;border-radius:10px;border-style:dotted;font-family:sans-serif;font-size:15PX;background-color: #ECECFF	" VALUE="登入"> -->

		</fieldset>
	</form:form>
</body>
</html>