<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<title>資料修改成功</title>
</head>
<body>
         <script>
            
            swal({
                title: "修改成功",
                text: "即將回到首頁",
                type: "success",

            }).then(function () {
                    window.location.href = "<c:url value='/backstageMember' />"
                });
            
          
	     </script>




</body>
</html>