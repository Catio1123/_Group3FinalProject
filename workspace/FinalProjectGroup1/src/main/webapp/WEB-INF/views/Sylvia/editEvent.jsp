<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<div align="center">
<h1>Read Event</h1>
<a href="<c:url value='/queryEvent'/>">Click here to read all Event</a> 

<fieldset style="width:960px;">
	<legend> editEvent </legend> 
<%-- 	    <form:form method="POST" modelAttribute="place" >  --%>

	<form:form method="POST" modelAttribute="event" enctype='multipart/form-data'>
	<Table>
	<!-- <c:choose>
		<c:when test='${event.id == null}'>
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
	   	    	${event.id}<br>&nbsp;
	   	   </td>
	    </tr>
       </c:otherwise>   
       
    </c:choose>    

	  -->
	   <tr>
	      <td>編號：<br>&nbsp;</td>
	      <td  width='360'>
	      	<form:input path="Id"/><br>&nbsp;	
		      <form:errors path='Id' cssClass="error"/>
		  </td>
	   <tr>
	      <td>名稱：<br>&nbsp;</td>
	      <td  width='360'>
	      	<form:input path="name"/><br>&nbsp;	
		      <form:errors path='name' cssClass="error"/>
		  </td>
		   <td>地址：<br>&nbsp;</td>
	   	  <td>
	      	<form:input path="address"/><br>&nbsp;	
		      <form:errors path='address' cssClass="error"/>
		  </td>
	   </tr>	   
	   <tr>
	      <td>經度：<br>&nbsp;</td>
	        <td  width='360'>
	      	<form:input path="longitude"/><br>&nbsp;	
		      <form:errors path='longitude' cssClass="error"/>
		  </td>
	      <td>緯度：<br>&nbsp;</td>
		  <td  width='360'><form:input path='latitude' /><br>&nbsp;	
		      <form:errors path='latitude' cssClass="error"/>
		  </td>
		  
	   </tr>
	 
	   <tr>
	      <td>價格：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="price"/><br>&nbsp;
	   	  	 <form:errors path='price'  cssClass="error" />
	   	  </td>
	  	  
	   	  <tr>
	      <td>內容：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="content"/><br>&nbsp;
	   	  	 <form:errors path='content'  cssClass="error" />
	   	  </td>
	   	  
	   	  <td>照片：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="eventImage" type='file'/><br>&nbsp;
	   	  	 <form:errors path="eventImage"  cssClass="error" />
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
<!-- <a href="<c:url value='/'/> " >回前頁</a> -->
</div>
</body>
</html>