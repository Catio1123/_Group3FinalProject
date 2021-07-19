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
        <title>修改活動</title>
        <link href="<c:url value='/bill/css/styles.css' />" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main style="background-color: black">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Edit Event</h3></div>
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
                                                        <form:input path="topic"  class="form-control" type="text"/>
                                                        <label>主題</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="type" class="form-control" type="text"/>
                                                        <label>類型</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <form:input path="address" class="form-control"/>
                                                <label>地點</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <form:input path="longitude"  class="form-control" type="text" required="required"/>
                                                        <label>經度</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <form:input path="latitude" class="form-control" type="text"  required="required"/>
                                                        <label>緯度</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <form:input path="link" class="form-control" type="text"/>
                                                <label>相關連結</label>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <form:input path="date" class="form-control" type="date"/>
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
                                                <form:textarea path="intro" class="form-control" required="required"/>
                                                <label>介紹</label>
                                            </div>
                                            <div class="mt-4 mb-0">                                            
                                                <div class="d-grid"><input id="submit" type='submit' value="提交" class="btn btn-primary btn-block"></div>
                                            </div>
                                        </form:form>
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="<c:url value='/eventIndex'/>">回前頁</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>            
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/bill/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
    </body>
</html>
