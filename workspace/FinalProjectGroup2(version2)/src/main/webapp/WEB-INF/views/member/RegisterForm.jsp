<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/javascript/j_frontfiltercu2.js"></script>
<style>

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

.inputdiv{

	font-weight: bold;
	color: black;
	background-color: white;
	
	padding: 10px 8px;
	width: 1000px; 
	height: 800px;
	border:1px solid #D0D0D0; 
	border-radius: 8px; 
/* border-style:dashed;  */
	border-width:3px;

}

legend {
	font-weight: bold;
	color: black;
	background-color: white;
	border: 5px solid #cccccc;
	padding: 10px 8px;
}

fieldset legend {
	
	font-weight: 500px;
	text-align: center;
	white-space: nowrap;
}


.inputLbox{
height:40px ;
width: 200px;

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

.tableclass{

  height: 700px;
  width: 700px;

  border: 5px solid #cccccc;
/*   margin-right: auto; */
/*   margin-left: auto; */
  margin-top: 1%;
  margin-bottom: 55px;
  padding: 35px 50px 20px 50px; 
  background-color: white;
  border: 1px solid #D0D0D0;
  border-radius: 3% 3% 3% 3%;
  
  text-align: left;

}
</style>


<meta charset="UTF-8">
<title>Register Form</title>
</head>
<%@include file="../Universal/navbar.jsp" %>
<body>
<br>
<div align="center">
<div class=regDiv>
		<fieldset>
		<div align="center">
		<h3>會員註冊</h3>
		</div>
<!-- 			<legend align="center">會員註冊</legend> -->

			<form:form id="submitform" method="post" modelAttribute="customer"
				enctype='multipart/form-data'>


				<table class="tableclass" cellspacing="2" cellpadding="2" border="1" width="120%">
					
					<tr>
						<!-- label會自己幫我生出for -->
						<td><form:label path="customerName">姓名:</form:label></td>
						<td><form:input id= "idName" path="customerName" type="text" size="10"
								maxlength="100" placeholder="請輸入姓名" />
								<span id='NameResult'></span>
								</td>
					</tr>
					<tr>

						<td><form:label path="account">帳號:</form:label><br></td>
						<td><form:input id="idAccount" path="account" type="text" size="10"
								maxlength="20" placeholder="請輸入帳號" />
							<button class="inputbutton" type="button" id="accountbutton">查看帳號是否已被註冊</button>
							<span id='AccountResult'></span>
							<br>
							<p class="rule">
								(1.不可空白，2.至少6個字且字首為英文字母，其餘英數字混合，3.不可包含特殊字元[!@#$%^&*]與中文字)</p></td>
					</tr>
					<tr>
						<td><form:label path="password">密碼:</form:label></td>
						<td><form:input id="idPassword" path="password" type="password" size="10"
								maxlength="10" placeholder="請輸入密碼" />
								<span id='PasswordResult'></span>
							<p class="rule">(1.不可空白，2.至少6個字且必須 包含英文字母、數字、特殊字元[!@#$%^&*])</p>
						</td>
					</tr>
					<tr class="inputstyle" >
						<td><form:label path="email">E-mail:</form:label></td>
						<td><form:input id="idEmail" path="email" type="text" size="30"
								maxlength="20" placeholder="請輸入信箱" />
							<button class="inputbutton" type="button" id="emailbutton">查看信箱是否已被註冊</button>
							<span id='EmailResult'></span>
							<br/>
							<p class="rule">(不可空白)</p></td>
					</tr>
					<tr class="inputstyle" >
						<td><form:label path="birthday">生日:</form:label></td>
						<td><form:input id="idBday" path="birthday" type="date" size="20"
								maxlength="20" />
								<span id='BdayResult'></span>
							<p class="rule">(不可空白)</p></td>
					</tr>
					<td><form:label id= "gender" path="gender">性別:</form:label></td>
					<td><form:radiobutton path="gender" value="男" label="男"
							checked="true" /> <form:radiobutton path="gender" value="女"
							label="女" /></td>
					<tr class="inputstyle" >
						<td><form:label path="cellphone">聯絡電話:</form:label></td>
						<td><form:input id="idPhone" path="cellphone" type="text" size="20"
								maxlength="20" placeholder="請輸入手機" />
							<button class="inputbutton" type="button" id="cellphonebutton">查看電話是否已被註冊</button>
							<span id='PhoneResult'></span>
							<br />
							<p class="rule">(不可空白)</p>
							</td>
					</tr>
					<tr class="inputstyle" >
						<td><form:label path="address" width="150">聯絡地址:</form:label></td>
						<td><form:input id="idAddress" path="address" type="text" size="60"
								maxlength="50" placeholder="請輸入地址" />
								<span id='AddressResult'></span>
								<br />
								<p class="rule">(不可空白)</p>
								</td>
							
					</tr>

					<tr class="inputstyle" >
						<td><form:label path="customerImage">上傳個人圖片:</form:label></td>
						<td>
						<img id="blah" src="#" alt="your image" width='150' height='200' />
						<form:input id="imgInp" path="customerImage"
								type='file' />
						<br />
						<p class="rule">(不可空白)</p>
						</td>
						<br>
					</tr>

				</table>

				<br>

				<!-- <button onclick="window.location.href='./register.controller';" >送出</button> -->
				<div align="center">
				<form:button  class="buttomstyle" value="Send" id="sendData">送出</form:button>
		
			</div>
			</form:form>
			<br>
			<div align="center">
			<button  class="buttomstyle" onclick="window.location.href='<c:url value='/home'/>'">返回登入頁面</button>
			</div>
		</fieldset>
<br>
		<%-- <a href="<c:url value='/loginMainPage.controller'/>">返回登入頁面</a><br> --%>
		<%-- <button onclick="window.location.href='<c:url value='/loginMainPage.controller'/>'; return false;" >返回登入頁面</button> --%>

<!-- 		<input type="reset" value="重置" /> -->
	</div>
</div>
	<script>
	
	window.addEventListener("load", function(){
		
		var dupflag1 = false;
		var dupflag2 = false;
		var dupflag3 = false;

		//檢查帳號信箱電話重複的controller mapping
		const targetlink1 = '<c:url value="/Ajax/member/checkduplicateaccount"/>';
		const targetlink2 = '<c:url value="/Ajax/member/checkduplicatecellphone"/>';
		const targetlink3 = '<c:url value="/Ajax/member/checkduplicateemail"/>';
		
		//檢查帳號信箱電話重複的按鈕
// 		let accountbutton = document.getElementById("accountbutton");
// 		let emailbutton = document.getElementById("emailbutton");
// 		let cellphonebutton = document.getElementById("cellphonebutton");
		
// 		//讀取使用者輸入的值
// 		var name = document.getElementById("idName").value;
// 		var account = document.getElementById("idAccount").value;
// 		var password = document.getElementById("idPassword").value;
// 		var email = document.getElementById("idEmail").value;
// 		var bday = document.getElementById("idBday").value;
// 		var gender = document.querySelector('input[name="gender"]:checked').value;
// 		var cellphone = document.getElementById("idPhone").value;
// 		var address = document.getElementById("idAddress").value;
		
// 		var hasError = false; // 設定判斷有無錯誤的旗標
// 		var div0 = document.getElementById('NameResult');
// 		var div1 = document.getElementById('AccountResult');
// 		var div2 = document.getElementById('PasswordResult');
// 		var div3 = document.getElementById('EmailResult');
// 		var div4 = document.getElementById('BdayResult');
// 		var div5 = document.getElementById('PhoneResult');
// 		var div6 = document.getElementById('AddressResult');
		
// 		var sendData = document.getElementById("sendData");
		
		//下方:若使用者沒輸入值的話
// 		sendData.onclick = function() {
			
// 			hasError = false;
// 			if (!name) {
// 				div0.innerHTML = "<font color='red' size='-2'>請輸入名字</font>";
// 				hasError = true;
// 			} else {
// 				div0.innerHTML = "";
// 			}
// 			if (!account) {
// 				div1.innerHTML = "<font color='red' size='-2'>請輸入帳號</font>";
// 				hasError = true;
// 			} else {
// 				div1.innerHTML = "";
// 			}
// 			if (!password) {
// 				div2.innerHTML = "<font color='red' size='-2'>請輸入密碼</font>";
// 				hasError = true;
// 			} else {
// 				div2.innerHTML = "";
// 			}
// 			if (!email) {
// 				div3.innerHTML = "<font color='red' size='-2'>請輸入Email</font>";
// 				hasError = true;
// 			} else {
// 				div3.innerHTML = "";
// 			}
// 			if (!bday) {
// 				div4.innerHTML = "<font color='red' size='-2'>請輸入生日</font>";
// 				hasError = true;
// 			} else {
// 				div4.innerHTML = "";
// 			}
// 			if (!cellphone) {
// 				div5.innerHTML = "<font color='red' size='-2'>請輸入手機</font>";
// 				hasError = true;
// 			} else {
// 				div5.innerHTML = "";
// 			}
// 			if (!address) {
// 				div6.innerHTML = "<font color='red' size='-2'>請輸入地址</font>";
// 				hasError = true;
// 			} else {
// 				div6.innerHTML = "";
// 			}
//  			if (hasError) {
//  				return false;
//  			}
// 		}
		
// 		var xhr1 = new XMLHttpRequest();
// 		xhr1.open("POST", "<c:url value='/registration' />", true);
// 		xhr1.setRequestHeader("Content-Type",
// 				"application/x-www-form-urlencoded");
// 		xhr1.send("typename=" + typename + "&comment=" + comment
// 				+ "&createDate=" + createDate);
		
		
		
// 		accountbutton.onclick = function(){
// 			let xhr = new XMLHttpRequest();
// 			xhr.open("POST", targetlink1, true);
// 		   	xhr.setRequestHeader("Content-Type",
// 					"application/x-www-form-urlencoded");
// // 		   	let accountData = {"account":account};
// 		   xhr.send('{account:' + account +' }')
		   	
// 		   	if (xhr.readyState == 4 && xhr.status == 200){
// 		   		if(xhr.responseText == 0){
// 		   			div1.innerHTML = "此帳號已被註冊，請使用其他帳號";
// 		   			dupflag1 = false;
// 		   		}else{
// 		   			dupflag1 = true;
// 		   			div1.innerHTML = "此帳號可以使用";
// 		   		}
// 		   	}

// 		}
		
// 		$("#accountbutton").click(function () {

//             $.ajax({
//                 url: targetlink1,    //url位置
//                 type: 'POST', //請求方式
//                 data: { account: $("#idAccount").val() },
//                 success: function (res) {
//                     if (res == 0) {
//                         alert("此帳號已被註冊，請使用其他帳號")
//                         dupflag1 = false;
//                     } else {
//                         dupflag1 = true;
//                         alert("此帳號可以使用")

//                     }
//                 }
//             })
//         });
		
		
// 		 $("#cellphonebutton").click(function () {

//              $.ajax({
//                  url: targetlink2,    //url位置
//                  type: 'POST', //請求方式
//                  data: { cellphone: $("#idPhone").val() },
//                  success: function (res) {
//                      if (res == 0) {
//                          alert("此電話已被註冊，請使用其他帳號")
//                          dupflag2 = false;
//                      } else {
//                          alert("此電話可以使用")
//                          dupflag2 = true;
//                      }
//                  }
//              })
//          });

//          $("#emailbutton").click(function () {

//              $.ajax({
//                  url: targetlink3,    //url位置
//                  type: 'POST', //請求方式
//                  data: { email: $("#idEmail").val() },
//                  success: function (res) {
//                      if (res == 0) {
//                          alert("此信箱已被註冊，請使用其他帳號")
//                          dupflag3 = false;
//                      } else {
//                          alert("此信箱可以使用")
//                          dupflag3 = true;
//                      }
//                  }
//              })
//          });
         
         
//          $("#sendData").submit(function (event) {

//              if (!(dupflag1 && dupflag2 && dupflag3)) {
//                  window.alert("請檢查相關資料是否重複");
//                  event.preventDefault();
//              }

//          });
         
//          //預覽圖片
//          imgInp.onchange = evt => {
//         	  const [file] = imgInp.files
//         	  if (file) {
//         	    blah.src = URL.createObjectURL(file)
//         	  }
//         	}

	
// 	})

<!-- 	</script> -->

<%@include file="../Universal/footer.jsp" %>
</body>
</html>