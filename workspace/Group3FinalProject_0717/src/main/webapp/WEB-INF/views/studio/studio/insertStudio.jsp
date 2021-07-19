<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head>
<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 5pt;
}
</style>
<meta charset="UTF-8">
<link rel='stylesheet' href="<c:url value='/gavin/css/style.css' />" type="text/css" />
</head>
<body>  
<div align="center">
<fieldset style="width:960px;">
	<legend >新增餐廳資料</legend> 
<%-- 	    <form:form method="POST" modelAttribute="studio" > --%>
	<form:form method="POST" modelAttribute="studio" enctype='multipart/form-data'>
	<Table>
	<c:choose>
		<c:when test='${studio.id == null}'>
		    <tr>
		    	<td>&nbsp;</td>
		    	<td>
	   	  		   &nbsp;
	   	  		</td>
		    </tr>
        </c:when>	   
    	<c:otherwise>
	 	 <tr>
	       <td>編號：<br>&nbsp;</td>
	   	   <td><form:hidden path='id'/>
	   	    	${studio.id}<br>&nbsp;
	   	   </td>
	    </tr>
       </c:otherwise>   
    </c:choose>         
	   <tr>  
	     
	      <td>名稱<br>&nbsp;</td>
		  <td  width='360'><form:input path='name' /><br>&nbsp;	
		      <form:errors path='name' cssClass="error"/>
		  </td>
		  
	   </tr>
	   <tr>	     
		   <td>地址：<br>&nbsp;</td>
	   	  <td>
	      	<form:input path="location"/><br>&nbsp;	
		      <form:errors path='location' cssClass="error"/>
		  </td>
	   </tr> 
	   <tr>
	      <td>費用：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="fee"/><br>&nbsp;
	   	  	 <form:errors path="fee"  cssClass="error" />
	   	  </td>
	   	  <td>照片：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="studioImage" type='file'/><br>&nbsp;
	   	  	 <form:errors path="studioImage"  cssClass="error" />
	   	  </td>
	   </tr>
	   <tr>
	    <td colspan='4' align='center'><br>&nbsp;
	      <input type='submit'>
        </td>
	   </tr>
	</Table>
		 
	</form:form>
	
</fieldset>
<br>
<a href="<c:url value='/'/> " >回前頁</a>
</div>
</body>
</html>