<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>新增活動</title>
        <link href="<c:url value='/bill/css/styles.css' />" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <style type="text/css">
   			span.error {
				color: red;
				display: inline-block;
				font-size: 10pt;
			}
		</style>
        
    </head>
    
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main style="background-color: black">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Event</h3></div>
                                    <div class="card-body">
                                        <form:form method="POST" modelAttribute="event" enctype='multipart/form-data'>
	                                       <c:choose>
												<c:when test='${event.eventId == null}'>
													<tr>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td>編號 : </td>
														<td><form:hidden path='eventId' /> ${event.eventId}<br>&nbsp;</td>
													</tr>
												</c:otherwise>
											</c:choose>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <form:input path="topic" id="topic" class="form-control" type="text" required="required"/>
                                                        <label>主題</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="type" id="type" class="form-control" type="text"  required="required"/>
                                                        <label>類型</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <form:input path="address" id="address" class="form-control"  required="required"/>
                                                <label>地點</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <form:input path="longitude" id="longitude" class="form-control" type="text" required="required"/>
                                                        <label>經度</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="latitude" id="latitude" class="form-control" type="text"  required="required"/>
                                                        <label>緯度</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <form:input path="link" id="link" class="form-control" type="text"  required="required"/>
                                                <label>相關連結</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <form:input path="date" class="form-control" type="date"  required="required"/>
                                                        <label>日期</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                    	活動圖：<br>
                                                        <form:input path="eventImage"  type="file"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <form:textarea path="intro" id="intro" class="form-control" required="required"/>
                                                <label>介紹</label>
                                            </div>
                                            <div class="mt-4 mb-0">                                            
                                                <div class="d-grid"><input type='submit' value="提交" class="btn btn-primary btn-block"></div>
                                            </div>
                                        </form:form>
                                     
                                    </div>
                                    
                                    <div class="card-footer text-center py-3">
                                        <div class="small">
                                            <a href="<c:url value='/'/>">回前頁</a>&nbsp;&nbsp;
                                            <input type="button" value="一鍵輸入" onclick="one_button_insert()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script>
            function one_button_insert(){
                document.getElementById("topic").value = "法客面對面｜我們的初體驗";
                document.getElementById("type").value = "線下活動";
                document.getElementById("address").value = "濕地 venue B1（台北市中山區林森北路 107 巷 10 號／近捷運善導寺、中山站）";
                document.getElementById("link").value = "https://plainlaw.me/";
                document.getElementById("longitude").value = "121.5231881";
                document.getElementById("latitude").value = "25.0501444";
            }
        </script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/bill/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/luxon/2.0.1/luxon.min.js"></script>
        
    </body>
</html>
