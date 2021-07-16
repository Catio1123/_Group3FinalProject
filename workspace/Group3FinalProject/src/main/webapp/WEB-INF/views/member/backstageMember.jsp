<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>會員管理後台</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<c:url value='/kevin/css/styles.css' />" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="/ipodcast">iPodcast</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">會員</div>
                        <a class="nav-link" href="index.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            會員管理
                        </a>
                        <div class="sb-sidenav-menu-heading">iPodcast</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Podcaster
                        </a>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages"
                            aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                            廣告
                        </a>
                        <a class="nav-link" href="charts.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                            論壇
                        </a>
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            播客工廠
                        </a>
                        <a class="nav-link" href="tables.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            活動
                        </a>
                    </div>
                 </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">iPodcast 會員管理</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">註冊會員量成長</li>
                    </ol>
                    <div class="row">
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        註冊會員 年齡分布
                                    </div>
                                    <div class="card-body"> <canvas id="example" width="100" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        本季度 註冊會員量成長
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div>
                                <script>
                                    var ctx = document.getElementById("example"),
                                        example = new Chart(ctx, {
                                            // 參數設定[註1]
                                            type: "pie", // 圖表類型
                                            data: {
                                                // 資料設定[註2]
                                                labels: [" 18歲-25歲 ", " 25歲-30歲 ", " 30歲-35歲 ", " 35歲-40歲 ", " 40歲以上 "], // 標題
                                                datasets: [{
                                                    // 資料參數設定[註3]
                                                    label: "# of Votes", // 標籤
                                                    data: [695, 1879, 1665, 1234, 690], // 資料
                                                    backgroundColor: [ // 背景色
                                                        "#FF2D2D",
                                                        "#FF8040",
                                                        "#FFD306",
                                                        "#00BB00",
                                                        "#9393FF",
                                                    ],
                                                    borderWidth: 1 // 外框寬度
                                                }]
                                            }
                                        });
                                </script>


                            </div>

                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                會員名冊
                            </div>
                            <div class="card-body">
                            
                            
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Acctno</th>
                                            <!--<th>Password</th>-->
                                            <th>Name</th>
                                            <!--<th>Nickname</th>-->
                                            <th>Email</th>
                                            <th>Celphone.No</th>
                                            <th>Birthday</th>
                                            <th>Gender</th>
                                            <th>Role</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Acctno</th>
                                            <!--<th>Password</th>-->
                                            <th>Name</th>
                                            <!--<th>Nickname</th>-->
                                            <th>Email</th>
                                            <th>Celphone.No</th>
                                            <th>Birthday</th>
                                            <th>Gender</th>
                                            <th>Role</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="member" items="${member}">
                                    <tr>
                                    
                                       <td hidden>${member.id}  </td>
                                       <td>${member.acctno}  </td>
                                       <td hidden>${member.pw}      </td>
                                       <td>${member.name}    </td>
                                       <td hidden>${member.nickname}</td>
                                       <td>${member.email}   </td>
                                       <td>${member.celno}   </td>
                                       <td>${member.dob}     </td>
                                       <td>${member.gender}  </td>
                                       <td>${member.role}    </td>
                                       <td>
                                       <select>
                                       <option>${member.role}</option>
                                       <option>admin</option>
                                       <option>company</option>
                                       <option>general</option>
                                       </select>
                                       </td>
<%--                                        <td><a href=<c:url value='/updateMember/${member.id}/${member.acctno}/${member.pw}/${member.name}/${member.nickname}/${member.celno}/${member.email}/${member.dob}/${member.gender}/${member.role}' />>權限變更</a></td> --%>
                                       <td><a href=<c:url value='/roleUpdate/${member.id}' />>權限變更</a></td>
                                                                  
                                       <td><a href=<c:url value='/member/${member.id}' />>刪除</a></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </main>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="<c:url value='/kevin/js/scripts.js' />"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="<c:url value='/kevin/assets/demo/chart-area-demo.js' />"></script>
    <script src="<c:url value='/kevin/assets/demo/chart-bar-demo.js' />"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="<c:url value='/kevin/js/datatables-simple-demo.js' />"></script>
    
    <script type="text/javascript">
    	window.onload = function(){
			let role = document.getElementById("{role}");
			let updateuser = document.getElementById("updateuser");
			console.log(123);

			updateuser.onclick = function(){
			console.log(role.value);
			}
		}
    </script>


</body>

</html>