<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<script src="<c:url value='/assets/js/jquery.min.js' />"></script>
<script src="<c:url value='/assets/js/jquery.dropotron.min.js' />"></script>
<script>

window.onload=function(){
	<c:forEach var="clicktime" items="${clicktime}">
		
	var button = document.getElementById("clickme${clicktime.ad.id }");
	var count${clicktime.ad.id } = 0;
	var click_timeout;
    button.addEventListener("click", function() {
	 if( click_timeout ) {
	       clearTimeout( click_timeout );
	   }
		count${clicktime.ad.id } ++;
		click_timeout = setTimeout( function() {
		$.ajax({
			method: "POST",
			url: "<c:url value='/clicktimeadd'/>",
			data: { 'aid' : ${clicktime.ad.id }, 'uid' : ${clicktime.user.id } ,'clickTime':count${clicktime.ad.id }}
			
		}),$.ajax({
			method: "POST",
			url: "<c:url value='/recordClickTimeAdd'/>",
			data: { 'aid' : ${clicktime.ad.id }, 'uid' : ${clicktime.user.id },'clickTimes':count${clicktime.ad.id } }
			
		}),$.ajax({
			method: "POST",
			url: "<c:url value='/addTotalClick'/>",
			data: { 'aid' : ${clicktime.ad.id } }
			
		}),
		
		count${clicktime.ad.id }=0;},500);
		
		document.getElementById("clicks${clicktime.ad.id }").innerHTML = count${clicktime.ad.id };
		console.log("count${clicktime.ad.id }=",count${clicktime.ad.id })
	});
</c:forEach>
}

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>廣告</h3>
	<table>


		<c:forEach var="clicktime" items="${clicktime}">
			<tr>

				<button id="clickme${clicktime.ad.id }"
					onclick="window.open('${clicktime.ad.url}', '_blank');">${clicktime.ad.company }</button>
				<br>
			

			</tr>
		</c:forEach>

	</table>
</body>
</html>