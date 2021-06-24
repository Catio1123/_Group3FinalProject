<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
	window.onload = function() {
		var div = document.getElementById('result0c');

		var sendData = document.getElementById("sendData");
		sendData.onclick = function() {
			// 讀取欄位資料	  
			var typename = document.getElementById("typename").value;
			var comment = document.getElementById("comment").value;
			var createDate = document.getElementById("createDate").value;

			var hasError = false; // 設定判斷有無錯誤的旗標
			var div0 = document.getElementById('result0c');
			var div1 = document.getElementById('result1c');
			var div2 = document.getElementById('result2c');

			var divResult = document.getElementById('resultMsg');
			if (!typename) {
				div0.innerHTML = "<font color='red' size='-2'>請輸入名稱</font>";
				hasError = true;
			} else {
				div0.innerHTML = "";
			}
			if (!comment) {
				div1.innerHTML = "<font color='red' size='-2'>請輸入說明</font>";
				hasError = true;
			} else {
				div1.innerHTML = "";
			}
			if (!createDate) {
				div2.innerHTML = "<font color='red' size='-2'>請輸入建檔日</font>";
				hasError = true;
			} else {
				div2.innerHTML = "";
			}

			if (hasError) {
				return false;
			}
			var xhr1 = new XMLHttpRequest();
			xhr1.open("POST", "<c:url value='/saveType' />", true);
			xhr1.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr1.send("typename=" + typename + "&comment=" + comment
					+ "&createDate=" + createDate);
			
			xhr1.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr1.readyState == 4 && xhr1.status == 200) {
					result = JSON.parse(xhr1.responseText);
					if (result.fail) {		//success fail
						divResult.innerHTML = "<font color='red' >"
								+ result.fail + "</font>";
					} else if (result.success) {
						divResult.innerHTML = "<font color='GREEN'>"
								+ result.success + "</font>";
						div0.innerHTML = "";
						div1.innerHTML = "";
						div2.innerHTML = "";
					} else {
						if (result.typenameError) {
							div0.innerHTML = "<font color='green' size='-2'>"
									+ result.typenameError + "</font>";
						} else {
							div0.innerHTML = "";
						}
						if (result.commentError) {
							div1.innerHTML = "<font color='green' size='-2'>"
									+ result.commentError + "</font>";
						} else {
							div1.innerHTML = "";
						}
						if (result.createdateError) {
							div2.innerHTML = "<font color='green' size='-2'>"
									+ result.createdateError + "</font>";
						} else {
							div2.innerHTML = "";
						}
					}
				}
			}
		}

	}
</script>
<link rel='stylesheet' href="<c:url value='/css/style.css'  />" />
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
	<div align='center'>
		<h3>輸入餐廳類型基本資料</h3>
		<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
		<fieldset style='display: inline-block; width: 900px;'>
			<legend>填寫下列資料</legend>
			<table border='1'>
				<tr height='60'>
					<td width='700'>&nbsp;名稱: <input type="text" name="typename"
						id='typename'>
						<span id='result0c'></span>
					</td>
					<td width='700'>&nbsp;說明: <input type="text" name="comment"
						id='comment'>
						<span id='result1c'></span>
					</td>
				</tr>
				<tr height='60'>
					<td colspan='2' width='1390'>&nbsp;建檔日: <input type="text"
						name="createDate" id='createDate' size='12'>
						<span id='result2c'></span>
					</td>

				</tr>
				<tr height='50'>
					<td colspan='3' align='center'><button id='sendData'>送出</button></td>
				</tr>
			</table>
		</fieldset>
		<hr>
		<p>
			<a href="<c:url value='/' />">回前頁</a>
		<hr>
	</div>

</body>
</html>