<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/style.css' />" type="text/css">
<style type="text/css">
span.error{
	color:red;
	display:inline-block;
	font-size:5pt;
}
</style>
</head>
<body>
	<div align="center">
		<fieldset style="width: 960px;">
			<legend>新增餐廳資料</legend>
			<form:form method="POST" modelAttribute="kitty" enctype="multipart/form-data">
			
				<%-- 當form表單 ex form:form 或 html的form 沒有寫action 預設會把值傳回當下所在的網址
				     所以 若 當下回傳執會先回controller那麼就會找對應path 的controller執行 --%>
				<table>
<!-- 類似switch case -->	<c:choose>
						
						<c:when test="${place.placeId == null}">
							<tr>
								<td>&nbsp;</td>
								<%-- &nbsp = 不換行空格 --%>
								<td>&nbsp;</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>編號：<br>&nbsp;
								</td>
								<td><form:hidden path='placeId' /> ${place.place}<br>&nbsp;
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td>類型：<br>&nbsp;
						</td>  <%-- path是取 Getter Setter方法的名字 不是屬性名喔 --%>
						<td width='360'><form:input path="typeId" /><br>&nbsp; <form:errors path='typeId' cssClass="error" /></td>
						<td>店名：<br>&nbsp;
						</td>
						<td width='360'><form:input path='name' /><br>&nbsp; <form:errors path='name' cssClass="error" /></td>

					</tr>
					<tr>
						<td>電話：<br>&nbsp;
						</td>
						<td width='360'><form:input path="phone" /><br>&nbsp; <form:errors
								path='phone' cssClass="error" /></td>
						<td>地址：<br>&nbsp;
						</td>
						<td><form:input path="address" /><br>&nbsp; <form:errors
								path='address' cssClass="error" /></td>
					</tr>
					<tr>
						<td>經度：<br>&nbsp;
						</td>
						<td width='360'><form:input path="longitude" /><br>&nbsp;
							<form:errors path='longitude' cssClass="error" /></td>
						<td>緯度：<br>&nbsp;
						</td>
						<td width='360'><form:input path='latitude' /><br>&nbsp;
							<form:errors path='latitude' cssClass="error" /></td>

					</tr>

					<tr>
						<td>網址：<br>&nbsp;
						</td>
						<td><form:input path="link" /><br>&nbsp; <form:errors
								path="latitude" cssClass="error" /></td>
						<td>照片：<br>&nbsp;
						</td>
						<td><form:input path="placeImage" type='file' /><br>&nbsp;
							<form:errors path="placeImage" cssClass="error" /></td>
					</tr>
					<tr>
						<td colspan='4' align='center'><br>&nbsp; <input type='submit'></td>
					</tr>

				</table>
			</form:form>
		</fieldset>
	</div>
</body>
</html>