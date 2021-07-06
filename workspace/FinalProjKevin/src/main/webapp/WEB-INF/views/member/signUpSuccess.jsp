<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增成功</title>
<style>
body{
    background-color:#F0F0F0	
}

fieldset {
            width: 500px;
            border: 1px solid #FF5151;
            border-radius: 20px;
            margin: 15px;
            margin: auto;
            
        }
.a1{
      margin: auto;
      text-align:center;
      font-size:30px;
}
</style>
</head>
<body>
<fieldset>
<div class="a1"><br>
${successMessage}<br>
<a href="<c:url value='/' /> " >回首頁</a>
</div>
</fieldset>
</body>
</html>