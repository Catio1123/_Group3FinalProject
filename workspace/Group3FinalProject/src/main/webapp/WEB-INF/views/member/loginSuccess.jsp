<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
body{
    background-color:#F0F0F0	
}

</style>

	     
<meta charset="UTF-8">
<title>Login Success</title>
</head>
<body>

         <script>  
            swal({
                title: "登入成功",
                text: "歡迎您回來！${Member.name}",
                type: "success",

            }).then(function () {
                    window.location.href = "<c:url value='/' />"
                });

	     </script>

</body>
</html>