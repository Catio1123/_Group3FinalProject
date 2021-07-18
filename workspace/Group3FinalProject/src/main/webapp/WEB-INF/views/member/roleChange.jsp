<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>變更權限</title>
<style type="text/css">

body {
	background-color: #F0F0F0
}
Table{
   margin:auto

}
div{
   	width: 500px; 
 	border-bottom: 3px dashed #ADADAD; 
 	margin: 20px; 
	padding-bottom: 10px; 
	color: black; 
	font-weight: bold;
 	font-size: 120%; 

}

</style>

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
			                    <form:input path="picture" /><br>&nbsp;
	   	  	                    <form:errors path="picture"  cssClass="error" />
                            </div>
							
			                <div style=display:none;>				
			                    <form:input path="memberImage" /><br>&nbsp;
	   	  	                    <form:errors path="memberImage"  cssClass="error" />
                            </div>
                            <div style=display:none;>				
			                    <form:input path="pictureString"/><br>&nbsp;
	   	  	                    <form:errors path="pictureString"  cssClass="error" />
                            </div>
							
							<div>
								權限:&nbsp;&nbsp;
								<form:radiobuttons  path="role" items="${roleChoose}"/>
								<form:errors path="role" />
							</div>

							
						</td>
						<td colspan='4' align='center'><button>權限修改</button></td>
					</tr>
				</Table>
			</form:form>




</body>
</html>