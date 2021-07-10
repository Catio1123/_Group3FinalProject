<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>使用者登入</title>
<style>

div{
width: 500px; 
height: 250px;
border:3px solid; 
border-radius: 8px; 
border-style:dashed; 
border-width:3px;


}

</style>
</head>
<body>
<center>
<form action="<c:url value='/member/login'/>" method="post">

<H1 ALIGN="CENTER">Login or Create Account</H1>

<h4>Please enter your account and password</h4>

<div>
<br>
 Account  :  <INPUT TYPE="TEXT" NAME="userName" required><BR>
  ${errors.username}
  <br>
  <br>
  Password :  <INPUT TYPE="password" NAME="userPwd" required><BR>
  ${errors.userpwd}
  <BR>
  <BR>
<tr><td><input name="login" type="submit" value="登入"/>
<td><input type="reset" value="重置"/><br>
<br>
${Failed}
<BR>
<br>
還沒有帳號嗎?<a href="<c:url value='/member/registration'/>">請點我註冊</a><br>
<br>
</div>
<!--  <input name="register" type="submit" value="註冊"/><br> -->
<br>

<br>
<br>


</form>
<br>

</body>
</center>
</html>