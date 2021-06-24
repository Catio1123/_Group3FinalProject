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
<link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />
</head>
<body>  
<div align="center">
<fieldset style="width:960px;">
	<legend >新增餐廳資料</legend> 
<%-- 	    <form:form method="POST" modelAttribute="place" > --%>
	<form:form method="POST" modelAttribute="place" enctype='multipart/form-data'>
	<Table>
	<c:choose>
		<c:when test='${place.placeId == null}'>
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
	   	   <td><form:hidden path='placeId'/>
	   	    	${place.placeId}<br>&nbsp;
	   	   </td>
	    </tr>
       </c:otherwise>   
    </c:choose>         
	   <tr>  
	      <td><spring:message code='place.form.caption.typeid'  /><br>&nbsp;</td>
	        <td  width='360'>
	      	   <form:select  path="typeId" >
	      	      <form:option label="請挑選" value="-1" />
	      	     
	      	      <form:options items="${typeList}"
	      	   	   itemLabel="typeName"  itemValue="typeId"   />
	      	   	</form:select>   
	      	   	   <br>&nbsp;	 
		       <form:errors path='typeId' cssClass="error"/>

							<%-- 	      	   <form:input path="typeId"/><br>&nbsp;	   <!-- // property name   -->  --%>
							<%-- 		       <form:errors path='typeId' cssClass="error"/> --%>

							<!--     <form:select path="typeId" >
                   <form:option label="請挑選" value="-1" />
                   <form:options  items="${jobList}"
                         />
               </form:select><br>&nbsp;
               <form:errors path="typeId"  cssClass="error"/>--> <%-- <form:radiobuttons path="typeId" items="${genderList}" />
                     <form:option label="請挑選" value="-1" /> 
                   
                         
               <form:errors path="typeId"  cssClass="error"/></td>--%>
		  </td>
	      <td><spring:message code='place.form.caption.restaurant.name'  /><br>&nbsp;</td>
		  <td  width='360'><form:input path='name' /><br>&nbsp;	
		      <form:errors path='name' cssClass="error"/>
		  </td>
		  
	   </tr>
	   <tr>
	      <td>電話：<br>&nbsp;</td>
	      <td  width='360'>
	      	<form:input path="phone"/><br>&nbsp;	
		      <form:errors path='phone' cssClass="error"/>
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
	      <td>網址：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="link"/><br>&nbsp;
	   	  	 <form:errors path="link"  cssClass="error" />
	   	  </td>
	   	  <td>照片：<br>&nbsp;</td>
	   	  <td>
	   	  	 <form:input path="placeImage" type='file'/><br>&nbsp;
	   	  	 <form:errors path="placeImage"  cssClass="error" />
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