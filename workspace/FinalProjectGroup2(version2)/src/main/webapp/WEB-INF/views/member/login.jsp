<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>使用者登入</title>
<style>

.logindiv{
width: 500px; 
height: 350px;
border:1px solid #D0D0D0; 
border-radius: 8px; 
/* border-style:dashed;  */
border-width:3px;
}

.buttomstyle{

width: 100px; 
height: 35px;
border:1px solid #7B7B7B; 
border-radius: 3%; 
/* border-style:dashed;  */
border-width:3px;


}

.inputstyle{

width: 300px; 
height: 30px;
border:0.5px solid #7B7B7B; 
border-radius: 3%; 
/* border-style:dashed;  */
border-width:1px;


}

</style>
</head>
<%@include file="../Universal/navbar.jsp" %>
<body>


<center>
<form action="<c:url value='/member/login'/>" method="post">

<br>

<H1 ALIGN="CENTER">會員登入 或 創建帳戶</H1>

<br>

<h4>請輸入您的帳號、密碼</h4>

<br>

<div class="logindiv">
<br>
<br>
${Failed}<br>
<br>
 帳號  :  <INPUT class="inputstyle" TYPE="TEXT" NAME="userName" required><BR>
  ${errors.username}
  <br>
  <br>
  密碼 :  <INPUT class="inputstyle"  TYPE="password" NAME="userPwd" required><BR>
  ${errors.userpwd}
  <BR>
  <a href="<c:url value='/member/registration'/>">忘記密碼</a><br><br>
<tr><td><input class="buttomstyle" name="login" type="submit" value="登入"/>
<!-- <td><input type="reset" value="重置"/><br> -->
<br>

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

</body>
</center>

<%@include file="../Universal/footer.jsp" %>

</html>