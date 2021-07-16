<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form  method="POST" modelAttribute="member" >
				<Table>
					<tr>
						<td>
							<div style=display:none;>
								id:&nbsp;&nbsp;
								<form:input  path="id" />
							</div>
							
							<div>
							   帳號:&nbsp;&nbsp;
							   <form:label path = 'acctno'>${member.acctno}</form:label>
							</div>
	
							<div style=display:none; >
								<form:input path = 'acctno' />
								<form:errors path='acctno' />
							</div>

							<div style=display:none;>
								密碼:&nbsp;&nbsp;
								<form:input path="pw" />
								<form:errors path='pw' />

							</div>

							<div style=display:none;>
								姓名:&nbsp;&nbsp;
								<form:input path='name' />
								<form:errors path='name' />
							</div>

							<div style=display:none;>
								暱稱:&nbsp;&nbsp;
								<form:input path="nickname" />
								<form:errors path='nickname' />
							</div>

							<div style=display:none;>
								E-mail:&nbsp;&nbsp;
								<form:input path="email" />
								<form:errors path='email' />
							</div>

							<div style=display:none;>
								手機號:&nbsp;&nbsp;
								<form:input path="celno" />
								<form:errors path='celno' />
							</div>

							<div style=display:none;>
								生日:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<form:input path="dob" type="Date"/>
								<form:errors path='dob' />
							</div>

							<div style=display:none;>
								性別:&nbsp;&nbsp;
								<form:input path="gender"  />
								<form:errors path="gender" />
							</div>
							
			                <div style=display:none;>				
			                    <form:input path="memberImage"/><br>&nbsp;
	   	  	                    <form:errors path="memberImage"  cssClass="error" />
                            </div>
							
							<div>
								Role:&nbsp;&nbsp;
								<form:input  path="role" />
<%-- 								company<form:input  path="role" type="radio" value="company"/> --%>
<%-- 								停權    <form:input  path="role" type="radio" value="suspension"/> --%>
								<form:errors path="role" />
							</div>

							
						</td>
						<td colspan='4' align='center'><button>權限修改</button></td>
					</tr>
				</Table>
			</form:form>




</body>
</html>