<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新訊息</title>
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

</head>
<body>
<div align="center">
<fieldset>
	<legend >更新資料</legend> 

<form:form method="POST" modelAttribute="member">
				<Table>
					<tr>
						<td>
							<div class="s1">
								帳號:&nbsp;&nbsp;
								<form:input path="acctno" />
								<form:errors path='acctno' />
							</div>

							<div class="s1">
								密碼:&nbsp;&nbsp;
								<form:input path="pw" />
								<form:errors path='pw' />

							</div>

							<div class="s1">
								姓名:&nbsp;&nbsp;
								<form:input path='name' />
								<form:errors path='name' />
							</div>

							<div class="s1">
								暱稱:&nbsp;&nbsp;
								<form:input path="nickname" />
								<form:errors path='nickname' />
							</div>

							<div class="s1">
								E-mail:&nbsp;&nbsp;
								<form:input path="email" />
								<form:errors path='email' />
							</div>

							<div class="s1">
								手機號:&nbsp;&nbsp;
								<form:input path="celno" />
								<form:errors path='celno' />
							</div>

							<div class="s1">
								生日:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<form:input path="dob" type="Date"/>
								<form:errors path='dob' />
							</div>

							<div class="s1">
								性別:&nbsp;&nbsp;
								<form:input path="gender"  />
								<form:errors path="gender" />
							</div>


							
						</td>
						<td colspan='4' align='center'><button>送出</button></td>
					</tr>
				</Table>
			</form:form>

	
</fieldset>
<br>
<a href="<c:url value='/'/> " >回首頁</a>
</div>

</body>
</html>