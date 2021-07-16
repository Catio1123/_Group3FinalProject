
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CustomerInfoPage</title>
<style>

.loginName{
	font-weight: bold;
	color: black;
	background-color: white;
	border: 5px solid #cccccc;
	padding: 10px 8px;

}

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

.regDiv {
  height: 800px;
  width: 800px;

  margin-right: auto;
  margin-left: auto;
  margin-top: 8%;
  margin-bottom: 55px;
  padding: 35px 50px 20px 50px; 
  background-color: white;
  border: 1px solid #D0D0D0;
  border-radius: 3% 3% 3% 3%;
  
  text-align: left;
}

.cusTable{

  height: 600px;
  width: 700px;


}

</style>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

        <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<%@include file="../Universal/navbar.jsp" %>
<body>

                
<script type="text/javascript">
	function reconfirm(){
		ProceedDelete = confirm("確定要刪除嗎?");
		if (ProceedDelete) {
			window.location.href='./deleteAccount.do'; 
		}
// 		return false;
	}
</script>
<div class=regDiv>

<fieldset>


	<legend align="center">查看會員資料</legend>
<%-- <jsp:useBean id="customerBean" class="login.model.CustomerBean" scope="session" /> --%>
<center>
<%-- <%@include file="../Universal/navbar.jsp" %> --%>

<%-- Hello! ${CurrentUser.customerName} --%>

</center>
<!-- <form action="/selectCustomerInfo.controller" method="post"> -->
<center>
<form enctype='multipart/form-data'>
<table  class="cusTable" cellspacing="2" cellpadding="1" border="1" width="40%">
<!-- <tr bgcolor="#FFFFE1"> -->
<!--     <td>Customer ID:</td> -->
<%--     <td>${CurrentUser.customerID} --%>
<!--     = request.getParameter("bean").getCustomerID -->
<!--     </td> -->
<!-- </tr> -->
<tr>
    <td>姓名:</td>
    <td>${CurrentUser.customerName}
    </td>
</tr>
<tr>
    <td>帳號:</td>
    <td>${CurrentUser.account}
    </td>
</tr>
<tr>
    <td>密碼:</td>
    <td>${CurrentUser.password}
    </td>
</tr>
<tr>
    <td width="150">E-mail:</td>
    <td>${CurrentUser.email}
   </td>
</tr>
<tr>
    <td width="150">生日:</td>
    <td>${CurrentUser.birthday}
   </td>
</tr>
<tr>
    <td>性別</td>
    <td>${CurrentUser.gender}
    </td>
</tr>
<tr>
    <td>連絡電話:</td>
    <td>${CurrentUser.cellphone}
    </td>
</tr>
<tr>
    <td>連絡地址:</td>
    <td>${CurrentUser.address}
    </td>
</tr>
<tr>
    <td>個人照片:</td>
    <td><img width='150' height='200' src= "${CurrentUser.pictureString} ">
    </td>
</tr>
</table>
</form>
</center>
<center>
<br>


<button class="inputstyle" onclick="window.location.href='updateuserinfo';" >修改個人資料</button>
<button class="inputstyle" onclick="reconfirm();" >刪除個人帳號</button>
<br>
<br>
<button class="inputstyle" onclick="window.location.href='./logout';" >登出</button>
</center>
</div>
    <script>
var currentUser = "${CurrentUser}";
var customerName = "${CurrentUser.customerName}";

window.onload = function(){
// 有登入:隱藏登入標籤 & 沒登入:隱藏登出標籤，秀登入標籤
var logoutHref = document.getElementById("logoutHref");
var loginHref = document.getElementById("loginHref");
var myAccount = document.getElementById("myAccount");
var loginName = document.getElementById("loginName");

	if (!customerName) {
			logoutHref.hidden = true;
			myAccount.hidden = true;
			loginName.hidden = true;
			loginHref.style.visibility = "visible";
		}
		if (customerName) {
			logoutHref.style.visibility = "visible";
			myAccount.style.visibility = "visible";
			loginName.style.visibility = "visible";
// 			loginHref.style.visibility="hidden";
			
			loginHref.hidden = true;
		}
}
</script>
</body>
<%@include file="../Universal/footer.jsp" %>
</html>