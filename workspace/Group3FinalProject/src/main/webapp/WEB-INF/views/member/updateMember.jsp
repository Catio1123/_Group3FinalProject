<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>	

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="<c:url value='/kevin/css2/custom-bs.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/jquery.fancybox.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/bootstrap-select.min.css'/> ">
	
	<link rel="stylesheet" href="<c:url value='/kevin/css2/owl.carousel.min.css'/> ">
	<link rel="stylesheet" href="<c:url value='/kevin/css2/animate.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/kevin/css2/quill.snow.css'/>">
	
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="<c:url value='/kevin/css2/style.css'/> ">

<title>更新會員資料</title>
<style>
fieldset {
	width: 600px;
	border: 1px solid #ADADAD;
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
	width: 500px;
	border-bottom: 3px dashed #ADADAD;
	margin: 20px;
	padding-bottom: 10px;
	color: black;
	font-weight: bold;
	font-size: 120%;
}

body {
	background-color: #F0F0F0
}

.logo {
	font-family: sans-serif;
	text-align: center;
	background: linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background: -webkit-linear-gradient(to top, #3a1c71, #d76d77, #ffaf7b);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
	font-size: 50px;
}

</style>

</head>
<body>
<div align="center">

   <header class="site-navbar mt-3">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="logo"><a href="/ipodcast" class="logo">iPodcast</a></div>
        </div>
      </div>
    </header>
   
        <section class="section-hero overlay inner-page bg-image" style="background-image: url('/ipodcast/kevin/images/blogUpdate4.png');" id="home-section">
      <div class="container">
      <br>
          <div class="col-md-7">
            <h2 class="text-white font-weight-bold">個人資料修改</h2>
            <br>

          </div>
      </div>
    </section>
     <br><br><br>

<fieldset>

<form:form action="/ipodcast/updateMember/toUpdate" method="POST" modelAttribute="member" enctype='multipart/form-data'>
				<Table>
					<tr>
						<td>
							<div style=display:none;>
								id:&nbsp;&nbsp;
								<form:input  path="id" />
							</div>
							
							<div class="s1">
							   帳號:&nbsp;&nbsp;
							   <form:label path = 'acctno'>${member.acctno}</form:label>
							</div>
	
							<div style=display:none; >
								<form:input path = 'acctno' />
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
							
			                <div class="s1">				
			                    <form:input path="memberImage" type='file'/><br>&nbsp;
	   	  	                    <form:errors path="memberImage"  cssClass="error" />
                            </div>
							
							<div style=display:none;>
								Role:&nbsp;&nbsp;
								<form:input  path="role" />
								<form:errors path="role" />
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