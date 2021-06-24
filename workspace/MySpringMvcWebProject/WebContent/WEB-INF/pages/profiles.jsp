<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profiles</title>
</head>
<body>
<h2>Profiles</h2>
<form action="profiles.controller2" method="POST">
   <p>
   Name:<input type="text" name="userName"/><br/>
   Address:<input type="text" name="userAddress"/><br/>
   </p>
   <input type="submit" value="Send">
</form>
</body>
</html>