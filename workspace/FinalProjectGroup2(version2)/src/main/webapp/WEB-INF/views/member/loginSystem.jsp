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
<h2>管理者登入系統</h2>


<form action="<c:url value='/exciseLogin.controler'/>" method="post">
   <table>
      <tr>
         <td>UserName:</td>
         <td><input type="text" name="userName"/></td>
         <td>${errors.username}</td>
      </tr>
      <tr>
         <td>Password:</td>
         <td><input type="password" name="userPwd"/></td>
         <td>${errors.userpwd}</td>
      </tr>
      <tr>
         <td><input type="submit" value="Login"></td>
         <td>${errors.msg}</td>
      </tr>   
   </table>

</form>

</body>
</html>