<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<h2>新增一筆食記條目</h2>
		<form:form action="addArticle" method="post"
			modelAttribute="articleList">
			<table border="0" cellpadding="5">
				<tr>
					<td>食記條目 ID:</td>
					<td><form:input path="id" /></td>
				</tr>
				<tr>
					<td>食記條目 評分:</td>
					<td><form:input path="rate" /></td>
				</tr>
				<tr>
					<td>食物類型:</td>
					<td><form:input path="foodtype" /></td>
				</tr>
				<tr>
					<td>食記連結:</td>
					<td><form:input path="url" /></td>
				</tr>
				<tr>
					<td>菜系:</td>
					<td><form:input path="genre" /></td>
				</tr>
				<tr>
					<td>餐廳所在城市:</td>
					<td><form:input path="city" /></td>
				</tr>
				<tr>
					<td>餐廳店名:</td>
					<td><form:input path="name" /></td>
				</tr>
				<td colspan="2"><input type="submit" value="新增"></td>

			</table>
		</form:form>
	</div>
</body>
</html>