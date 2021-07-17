<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="<c:url value='/kevin/css2/custom-bs.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/jquery.fancybox.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/bootstrap-select.min.css'/> ">
	
	<link rel="stylesheet" href="<c:url value='/kevin/css2/owl.carousel.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/animate.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/kevin/css2/quill.snow.css'/>">
	
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="<c:url value='/kevin/css2/style.css'/> ">

<script>
var hasError = false;
window.onload = function() {
	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	alink.onclick = function() {
	  var acctnoValue = document.getElementById("acctno").value;
	  if (!acctnoValue) {
		div.innerHTML = "<font color='blue' size='-1'>請輸入帳號...</font>";
		return;
	  }
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "<c:url value='/CheckMemberAcctno' />", true);
	  xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	  xhr.send("acctno=" + acctnoValue);
	  var message = "";
	  xhr.onreadystatechange = function() {
	    // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		   var result = JSON.parse(xhr.responseText);
		   if (result.acctno.length == 0) {
			  message = "<font color='green' size='-2'>帳號可用</font>";
		   } else if (	result.acctno.startsWith("Error") ) {
			  message = "<font color='red' size='-2'>發生錯誤: 代號" + result.acctno + "</font>";
		   } else {
			  message = "<font color='red' size='-2'>帳號重複，請重新輸入帳號</font>"; 
		   }
		   div.innerHTML = message;
	    }
     
   }
}

var sendData = document.getElementById("sendData");
sendData.onclick = function() {
		hasError = false;
		// 讀取欄位資料	  
		var acctnoValue   = document.getElementById("acctno").value;
		var pwValue       = document.getElementById("pw").value;
		var nameValue     = document.getElementById("name").value;
		var nicknameValue = document.getElementById("nickname").value;
		var emailValue    = document.getElementById("email").value;
		var celnoValue    = document.getElementById("celno").value;
		var dobValue      = document.getElementById("dob").value;
		var genderValue   = document.getElementById("gender").value;
		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');
		var div2 = document.getElementById('result2c');
		var div3 = document.getElementById('result3c');
		var div4 = document.getElementById('result4c');
		var div5 = document.getElementById('result5c');
		var div6 = document.getElementById('result6c');
		var div7 = document.getElementById('result7c');
		var divResult = document.getElementById('resultMsg');
		if (!acctnoValue){
			setErrorFor(div0, "請輸入帳號");
		} 	else {
   		    div0.innerHTML = "";
		}
		if (!pwValue){
			setErrorFor(div1, "請輸入密碼");
		} else {
			div1.innerHTML = "";
		}
		if (!nameValue){
			setErrorFor(div2, "請輸入姓名");
		} else {
			div2.innerHTML = "";
		}
		if (!nicknameValue){
			setErrorFor(div3, "請輸入別稱");
		} else {
			div3.innerHTML = "";
		}
		if (!emailValue){
			setErrorFor(div4, "請輸入信箱號");
		}else {
			div4.innerHTML = "";
		}
		if (!celnoValue){
			setErrorFor(div5, "請輸入手機號");
		} else {
			div5.innerHTML = "";
		}
		if (!dobValue){
			setErrorFor(div6, "請輸入生日");  
		} else if(!dateValidation(dobValue)) {
			setErrorFor(div6, "生日格式錯誤，正確格式為yyyy-MM-dd");
		} else {
    		div6.innerHTML = "";
		}
		if (!genderValue){
			setErrorFor(div7, "請輸入性別");
		} else {
			div7.innerHTML = "";
		}
		if (hasError){
    		return false;
		}

		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/signUpMember' />", true);
// 		var myForm = new FormData();
		
// 		myForm.append("memberPicture",$("#picture")[0].files[0])
// 		myForm.append("acctno"  ,acctnoValue)
// 		myForm.append("pw"      ,pwValue)
// 		myForm.append("name"    ,nameValue)
// 		myForm.append("nickname",nicknameValue)
// 		myForm.append("email"   ,emailValue)
// 		myForm.append("celno"   ,celnoValue)
// 		myForm.append("dob"     ,dobValue)
// 		myForm.append("gender"  ,genderValue)
		
// 		xhr1.send(myForm);
		
		
		var jsonMember = {
			"acctno"  : acctnoValue, 	
			"pw"      : pwValue,
			"name"    : nameValue,
			"nickname": nicknameValue,
			"email"   : emailValue,
			"celno"   : celnoValue,
			"dob"     : dobValue,
			"gender"  : genderValue
		}
		xhr1.setRequestHeader("Content-Type", "application/json");
		xhr1.send(JSON.stringify(jsonMember));


		xhr1.onreadystatechange = function() {
				// 伺服器請求完成
		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
   		result = JSON.parse(xhr1.responseText);
   		if (result.fail) {
		 		divResult.innerHTML = "<font color='red' >"
					+ result.fail + "</font>";
	  		} else if (result.success) {
				divResult.innerHTML = "<font color='GREEN'>"
					+ result.success + "</font>";
				div0.innerHTML = "";	
				div1.innerHTML = "";
				div2.innerHTML = "";
				div3.innerHTML = "";
				div4.innerHTML = "";
				div5.innerHTML = "";
				div6.innerHTML = "";
				div7.innerHTML = "";
	 		} else {
				if (result.acctnoError) {
       			div0.innerHTML = "<font color='green' size='-2'>"
	     				+ result.acctnoError + "</font>";
				} else {
       			div0.innerHTML = "";
				}
				if (result.pwError) {
	      			div1.innerHTML = "<font color='green' size='-2'>"
						+ result.pwError + "</font>";
				} else {
	      			div1.innerHTML = "";
	   			}
				if (result.nameError) {
       			div2.innerHTML = "<font color='green' size='-2'>"
						+ result.nameError + "</font>";
				} else {
       			div2.innerHTML = "";
 			}
				if (result.nicknameError) {
	    			div3.innerHTML = "<font color='green' size='-2'>"
						+ result.nicknameError + "</font>";
				} else {
       			div3.innerHTML = "";
				}
				if (result.emailError) {
	    			div4.innerHTML = "<font color='green' size='-2'>"
						+ result.emailError + "</font>";
				} else {
       			div4.innerHTML = "";
				}
				if (result.celnoError) {
	    			div5.innerHTML = "<font color='green' size='-2'>"
						+ result.celnoError + "</font>";
				} else {
       			div5.innerHTML = "";
				}
				if (result.dobError) {
	    			div6.innerHTML = "<font color='green' size='-2'>"
						+ result.dobError + "</font>";
				} else {
       			div6.innerHTML = "";
				}
				if (result.genderError) {
	    			div7.innerHTML = "<font color='green' size='-2'>"
						+ result.genderError + "</font>";
				} else {
       			div7.innerHTML = "";
				}
   		}
		} 
	    }
 }
		
}

var once = document.getElementById("once");
once.onclick = function() {
	var acctnoValue   = document.getElementById("acctno").value;
	var pwValue       = document.getElementById("pw").value;
	var nameValue     = document.getElementById("name").value;
	var nicknameValue = document.getElementById("nickname").value;
	var emailValue    = document.getElementById("email").value;
	var celnoValue    = document.getElementById("celno").value;
	var dobValue      = document.getElementById("dob").value;
	var genderValue   = document.getElementById("gender").value;
	
	if (acctnoValue.length == 0 ){
		setValue("Candy9632");
	}
	
}



	function setErrorFor(input, message) {
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
		hasError = true;
	}

	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
				.test(email);
	}
</script>


<style>
fieldset {
	width: 600px;
	border: 1px solid #ADADAD;
	border-radius: 20px;
	margin: 15px;
	margin: auto;
}

legend {
	color: #FF8040;
	margin-left: 50px;
	font-family: fantasy;
	font-weight: bold;
	font-size: 20px;
}

h1 {
	font-family: sans-serif;
}

.s1 {
	width: 500px;
	border-bottom: 3px dashed #ADADAD;
	margin: 20px;
	padding-bottom: 10px;
	color: black;
	font-weight: bold;
	font-size: 120%;
}

body {
	background-color: #F0F0F0
}

.logo {
	font-family: sans-serif;
	text-align: center;
	background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
	font-size: 50px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<div align="center">

   <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="logo"><a href="/ipodcast" class="logo">iPodcast</a></div>
        </div>
      </div>
    </header>
   
        <section class="section-hero overlay inner-page bg-image" style="background-image: url('/ipodcast/kevin/images/P5.jpg');" id="home-section">
      <div class="container">
      <br>
          <div class="col-md-7">
            <h2 class="text-white font-weight-bold">歡迎加入，註冊iPodcast帳號</h2>
            <br>

          </div>
      </div>
    </section>
     <br><br><br>			<div style=align:left;>
						    <input type="button" class="btn px-4 btn-primary text-white" value="一鍵輸入" onclick="once()">
						    </div>
						    <br>
<fieldset>
<hr>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
			<form style=background-color:write; action="signUpMember" method="POST" >

							<div class="s1">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								帳號:&nbsp;&nbsp;
								<input type="text" id="acctno" name="acctno" >
							    <a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a>	                 
								<div id='result0c' style="height: 15px;"></div>
							    ${failMessage}
							</div>	
							<div class="s1">	
								密碼:&nbsp;&nbsp;
								<input type="Password" id="pw" name="pw" >
								<div id='result1c' style="height: 15px;"></div>
							</div>


							<div class="s1">
							    姓名:&nbsp;&nbsp;
								<input type="text" id="name" name="name" >
								<div id='result2c' style="height: 15px;"></div>
							</div>	
							
                            <div class="s1">
								暱稱:&nbsp;&nbsp;
								<input type="text" id="nickname" name="nickname" >
								<div id='result3c' style="height: 15px;"></div>
							</div>

							<div class="s1">
								信箱:&nbsp;&nbsp;
								<input type="text" id="email" name="email" >
								<div id='result4c' style="height: 15px;"></div>
						    </div>
						    
                            <div class="s1">
								手機號:&nbsp;
								<input type="text" id="celno" name="celno" >
								<div id='result5c' style="height: 15px;"></div>
							</div>

							<div class="s1">
							    &nbsp;
								生日:&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="Date" id="dob" name="dob" >
								&nbsp;&nbsp;
								<div id='result6c' style="height: 15px;"></div>
                            </div>
                            
                            <div class="s1">
								性別:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								Mele  &nbsp;
								<input type="radio" id="gender" name="gender" value="Mele" checked >
								&nbsp;&nbsp;&nbsp;
								Femle &nbsp;
								<input type="radio" id="gender" name="gender" value="Femle" >
								<div id='result7c' style="height: 15px;"></div>
							</div>
							
<!-- 							<div style=s1;> -->
<!-- 								照片:&nbsp;&nbsp; -->
<!-- 								<input type="file" name="picture" id="picture"> -->
<!-- 							</div> -->
							
							<div style=display:none;>
								Role:&nbsp;&nbsp;
								<input type="text" name="role" value="general">
							</div>
							
                            <div>
						        <input type="submit" class="btn px-4 btn-primary text-white" id='sendData' value="註冊">
		                    </div>
		                    
		                  
		                    
		                    <script>
		                    function once(){
		                    	document.getElementById("acctno")  .value = "aaa0723"
		                    	document.getElementById("pw")      .value = "aaa07231"
		                    	document.getElementById("name")    .value = "張君雅"
		                    	document.getElementById("nickname").value = "Jane"
		                    	document.getElementById("email")   .value = "Jane@gmail.com"
		                    	document.getElementById("celno")   .value = "0921072303"
		                    	document.getElementById("dob")     .value = "1992/07/23";
		                    	
		                    }
		                    
		                    </script>
		                    
			</form>

		</fieldset>
		<br><br><br>
		<footer class="site-footer">

      <a href="#top" class="smoothscroll scroll-top">
        <span class="icon-keyboard_arrow_up"></span>
      </a>

      <div class="container">
        <div class="row mb-5">
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組長</h3>
            <ul class="list-unstyled">
              <li><a href="#">19 張大品</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>技術長</h3>
            <ul class="list-unstyled">
              <li><a href="#">33 廖帝凱</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組員</h3>
            <ul class="list-unstyled">
              <li><a href="#">37 程偉勝</a></li>
              <li><a href="#">21 許佳崴</a></li>
            </ul>
          </div>
          <div class="col-6 col-md-3 mb-4 mb-md-0">
            <h3>組員</h3>
            <ul class="list-unstyled">
              <li><a href="#">32 洪豪均</a></li>
              <li><a href="#">10 陳宣佑</a></li>
            </ul>
          </div>
        </div>

        <div class="row text-center">
          <div class="col-12">
            <p class="copyright"><small>
              <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small></p>
          </div>
        </div>
      </div>
    </footer>
</div>
<a href="<c:url value='/'/> " >回首頁</a>

    <script src="<c:url value='/kevin/js2/jquery.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/bootstrap.bundle.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/isotope.pkgd.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/stickyfill.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/jquery.fancybox.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/jquery.easing.1.3.js'/>" ></script>
    
    <script src="<c:url value='/kevin/js2/jquery.waypoints.min.js'/>" ></script>
    <script src="<c:url value='/kevin/js2/jquery.animateNumber.min.js'/> "></script>
    <script src="<c:url value='/kevin/js2/owl.carousel.min.js'/> "></script>
    
    <script src="<c:url value='/kevin/js2/bootstrap-select.min.js'/> "></script>
    
    <script src="<c:url value='/kevin/js2/custom.js'/> "></script>

</body>

</html>