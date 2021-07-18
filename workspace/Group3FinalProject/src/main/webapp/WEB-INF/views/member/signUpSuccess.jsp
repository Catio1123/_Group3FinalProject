<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="UTF-8">
<title>新增成功</title>

</head>
<body>
         <script>
            
            swal({
                title: "註冊成功",
                text: "歡迎您進入iPodcast的世界！",
                type: "success",

            }).then(function () {
                    window.location.href = "<c:url value='/loginController' />"
                });
            
          
	     </script>
</body>
</html>