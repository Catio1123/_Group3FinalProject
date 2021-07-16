<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script>

window.addEventListener("load", function(){
	
    //預覽圖片
    imgInp.onchange = evt => {
   	  const [file] = imgInp.files
   	  if (file) {
   	    blah.src = URL.createObjectURL(file)
   	  }
   	}

	
})

</script>
<meta charset="UTF-8">
<style>
.rule{
font-size:6pt;
color: darkgray;
margin-bottom:0px;
}
.inputLbox{
height:40px ;
width: 593px;

border: 1px solid ;
border-radius: 3% 3% 3% 3%;
}

.regDiv {
  height: 1000px;
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

.sendbutton{
height:40px ;
width: 593px;

border: 1px solid #7B7B7B;
border-radius: 3% 3% 3% 3%;

background-color:#BEBEBE;
margin: 15px 0px 15px 0px;


font-weight:bold;
}

.loginName{
	font-weight: bold;
	color: black;
	background-color: white;
	border: 5px solid #cccccc;
	padding: 10px 8px;

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
<title>使用者資訊更新頁面</title>
</head>
<%@include file="../Universal/navbar.jsp" %>
<body>
<br>
<center>
<h3 style="color:red;" class="testing">${updateSuccess}</h3>
</center>
<div class=regDiv>

<fieldset>


	<legend >變更會員資料</legend>
	<form:form id = "sregform" method="POST" modelAttribute="CurrentUser" enctype='multipart/form-data'> 
	 

姓名:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idname" path = "customerName"/>
<img id="snameimg"><span id="snamesp"></span>
&nbsp;&nbsp;<p class="rule">(1.不可空白，2.至少兩個字以上，3.必須全部為中文字)</p>

帳號:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idaccount" path = "account"/>
<img id="sphoneimg"><span id="sphonesp"></span>
<p class="rule">(不可空白)</p>

密碼:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idpassword" path = "password"/>
<img id="sphoneimg"><span id="sphonesp"></span>
<p class="rule">(不可空白)</p>
                
Email:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idemail" path = "email"/>
<img id="sphoneimg"><span id="sphonesp"></span>
<p class="rule">(不可空白)</p>

生日:&nbsp;&nbsp;<form:input class="inputLbox" type = "date" id="idbirthday" path = "birthday" value = "${CurrentUser.birthday}" placeholder="生日"/>
<img id="saddressimg"><span id="saddresssp"></span>
<p class="rule">(不可空白)</p>

<form:label id= "idgender" path="gender">性別:&nbsp;&nbsp;</form:label>
<form:radiobutton path="gender" value="男" label="男"/> <form:radiobutton path="gender" value="女" label="女" /><br>
<br>

電話:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idcellphone" path = "cellphone" value = "${CurrentUser.cellphone}"/>
<img id="saddressimg"><span id="saddresssp"></span>
<p class="rule">(不可空白)</p>

地址:&nbsp;&nbsp;<form:input class="inputLbox" type = "text" id="idaddress" path = "address" value = "${CurrentUser.address}"/>
<img id="saddressimg"><span id="saddresssp"></span>
<p class="rule">(不可空白)</p>
<hr>
照片:&nbsp;&nbsp;<img id="blah" width='150' height='200' src= "${CurrentUser.pictureString} "><br>
<!-- <img id="blah" src="#" alt="your image" width='150' height='200' /> -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:input id="imgInp" path="customerImage" type='file' />
<img id="saddressimg"><span id="saddresssp"></span>
<hr>


<%-- <form:input type = "hidden" id="idaccount" path = "account" value = "${CurrentUser.account}" /> --%>
<%-- <form:input type = "hidden" id="idpwd" path = "password" value = "${CurrentUser.password}"/> --%>
<%-- <form:input type = "hidden" id="idemail" path = "email" value = "${CurrentUser.email} "/> --%>

<div align="center">
<!-- <button class="inputstyle" onclick="window.location.href='updateuserinfo';" >送出</button> -->
<form:button class="inputstyle" type="submit" value="Send" id="sendData">提交</form:button>
</div>
</form:form>
</fieldset>
</div>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <p>Copyright &copy; 2020 Victory Template</p>
                </div>
                <div class="col-md-4">
                    <ul class="social-icons">
                        <li><a rel="nofollow" href="https://fb.com/templatemo"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li><a href="#"><i class="fa fa-rss"></i></a></li>
                        <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <p>Design: TemplateMo</p>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/main.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        // navigation click actions 
        $('.scroll-link').on('click', function(event){
            event.preventDefault();
            var sectionID = $(this).attr("data-id");
            scrollToID('#' + sectionID, 750);
        });
        // scroll to top action
        $('.scroll-top').on('click', function(event) {
            event.preventDefault();
            $('html, body').animate({scrollTop:0}, 'slow');         
        });
        // mobile nav toggle
        $('#nav-toggle').on('click', function (event) {
            event.preventDefault();
            $('#main-nav').toggleClass("open");
        });
    });
    // scroll function
    function scrollToID(id, speed){
        var offSet = 0;
        var targetOffset = $(id).offset().top - offSet;
        var mainNav = $('#main-nav');
        $('html,body').animate({scrollTop:targetOffset}, speed);
        if (mainNav.hasClass("open")) {
            mainNav.css("height", "1px").removeClass("in").addClass("collapse");
            mainNav.removeClass("open");
        }
    }
    if (typeof console === "undefined") {
        console = {
            log: function() { }
        };
    }
    </script>
    <script>
var currentUser = "${CurrentUser}";
var customerName = "${CurrentUser.customerName}";

window.onload = function(){

if("${loginSuccess}" == "登入成功!"){
	alert("${name}" + "," + "歡迎回來!");
// 	Swal.fire("${name}" + "," + "歡迎回來!");
}


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
			loginHref.style.visibility="hidden";
			
// 			loginHref.hidden = true;
		}
}
</script>
</body>
</html>