<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="checklogin.controller" method="post">
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