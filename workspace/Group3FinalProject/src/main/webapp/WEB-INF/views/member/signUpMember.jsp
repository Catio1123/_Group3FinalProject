<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>

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
		} else {
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
		
// 		if (!balanceValue){
// 			setErrorFor(div2, "請輸入餘額");
// 		} else {
// 	   		var objRegex = /^\d+$|(^-?\d\d*\.\d\d*$)|(^-?\.\d\d*$)/;  
// 			if(!objRegex.test(balanceValue))    {  
// 				setErrorFor(div2, "餘額欄必須是數值");
//     		} else { 
//         		div2.innerHTML = "";
//     		}
// 		}
		var xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/signUpMember' />", true);
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
//   以下敘述錯誤  		
//		xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
// 		xhr1.send("id=" + idValue + "&name=" + nameValue + "&balance=" 
// 				+ balanceValue + "&birthday=" + birthdayValue );

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

function setErrorFor(input, message){
	input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
 hasError = true;
}

// function dateValidation(str) {
// 	  var re = new RegExp("^([0-9]{4})[.-]{1}([0-9]{1,2})[.-]{1}([0-9]{1,2})$");
// 	  var days = [0, 31, 28, 31, 30,  31, 30, 31, 31, 30, 31, 30, 31];
// 	  var strDataValue;
// 	  var valid = true;
// 	  if ((strDataValue = re.exec(str)) != null) {
// 	    var y, m, d;
// 	    y = parseFloat(strDataValue[1]);
// 	    if (y <= 0 || y > 9999) { /*年*/
// 	      return false;
// 	    } 
// 	    m = parseFloat(strDataValue[2]);
	    
// 	    if (m < 1 || m > 12) { /*月*/
// 	        return false;
// 	    }
// 	    d = parseFloat(strDataValue[3]);
// 	    if ( y % 4 == 0 && y % 100 != 0 || y % 400 == 0 ){
// 	       days[2] = 29;
// 	    }  else {
// 	       days[2] = 28;
// 	    }
// 	    if (d <= 0 || d > days[m]) { /*日*/
// 	      valid = false;
// 	    }
// 	  } else {
// 	    valid = false;
// 	  }  
// 	  return valid;
// 	}

// 	function isEmail(email) {
// 		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
// 	}

</script>

<style>
fieldset {
            width: 960px;
            border: 1px solid #FF5151;
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
            width: 450px;
            border-bottom: 3px dashed #FF5151;
            margin: 20px;
            padding-bottom: 10px;
        }

</style>
<meta charset="UTF-8">
<%-- <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" /> --%>
</head>
<body>
<div align="center">
<fieldset>
	<legend>註冊會員資料</legend> 
<hr>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
			<form action="signUpMember" method="POST" >
				
							<div class="s1">
								帳號:&nbsp;&nbsp;
								<input type="text" id="acctno" name="acctno" >
								<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a>
								<div id='result0c' style="height: 10px;"></div>
								${failMessage}
							</div>

							<div class="s1">
								密碼:&nbsp;&nbsp;
								<input type="Password" id="pw" name="pw" >
								<div id='result1c' style="height: 10px;"></div>

							</div>

							<div class="s1">
								姓名:&nbsp;&nbsp;
								<input type="text" id="name" name="name" >
								<div id='result2c' style="height: 10px;"></div>
							</div>

							<div class="s1">
								暱稱:&nbsp;&nbsp;
								<input type="text" id="nickname" name="nickname" >
								<div id='result3c' style="height: 10px;"></div>
							</div>

							<div class="s1">
								E-mail:&nbsp;&nbsp;
								<input type="text" id="email" name="email" >
								<div id='result4c' style="height: 10px;"></div>
							</div>

							<div class="s1">
								手機號:&nbsp;&nbsp;
								<input type="text" id="celno" name="celno" >
								<div id='result5c' style="height: 10px;"></div>
							</div>

							<div class="s1">
								生日:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="Date" id="dob" name="dob" >
								&nbsp;&nbsp;
								<div id='result6c' style="height: 10px;"></div>
							</div>

							<div class="s1">
								性別:&nbsp;&nbsp;
								<input type="text" id="gender" name="gender" >
								<div id='result7c' style="height: 10px;"></div>
							</div>
							
							<div style=display:none;>
								性別:&nbsp;&nbsp;
								<input type="text" name="role" value="general">
							</div>
							

						<button id='sendData'>送出</button>
		
			</form>

		</fieldset>
</div>
<br>
<a href="<c:url value='/'/> " >回首頁</a>
<hr>

</body>

</html>