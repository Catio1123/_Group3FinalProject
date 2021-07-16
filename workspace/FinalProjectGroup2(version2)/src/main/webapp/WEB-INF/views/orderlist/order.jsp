<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/DateFormat.js"></script>


            <script>
                var hasError = false;
                var pay = false;
                window.onload = function () {

                    var sendData = document.getElementById("sendData");
                    document.getElementById("date").value = (new Date()).format("yyyy-MM-dd hh:mm:ss");
                    sendData.onclick = function () {
                        hasError = false;
                        // 讀取欄位資料	  
                        var name = document.getElementById("name").value;
                        var time = document.getElementById("time").value.replace(/T/, " ").concat(":00");
                        var resturant = document.getElementById("resturant").value;
                        var date = document.getElementById("date").value;
                        var people = document.getElementById("people").value;

                        var div0 = document.getElementById('result0c');
                        var div1 = document.getElementById('result1c');
                        var div2 = document.getElementById('result2c');
                        var div3 = document.getElementById('result3c');
                        var div4 = document.getElementById('result4c');
                        var div5 = document.getElementById('result5c');

                        var divResult = document.getElementById('resultMsg');

                        if (!name) {
                            setErrorFor(div0, "請輸入姓名");
                        } else {
                            div0.innerHTML = "";
                        }
                        if (!time) {
                            setErrorFor(div1, "請輸入預定時間");
                        } else if (!dateValidation(time)) {
                            setErrorFor(div1, "格式錯誤，正確格式為yyyy-MM-dd HH:mm:ss");
                        } else {
                            div1.innerHTML = "";
                        }
                        if (!resturant) {
                            setErrorFor(div2, "請輸入餐廳");
                        } else {
                            div2.innerHTML = "";
                        }
                        if (!date) {
                            setErrorFor(div3, "請輸入建立時間");
                        } else if (!dateValidation(date)) {
                            setErrorFor(div3, "格式錯誤，正確格式為yyyy-MM-dd yyyy-MM-dd HH:mm:ss");
                        } else {
                            div3.innerHTML = "";
                        }

                        if (!people) {
                            setErrorFor(div4, "請輸入人數");
                        } else {
                            var objRegex = /^\d*$/;
                            if (!objRegex.test(people)) {
                                setErrorFor(div4, "人數欄必須是數值");
                            } else if (people < 1) {
                                setErrorFor(div4, "不可小於1");
                            } else if (people > 9) {
                                setErrorFor(div4, "不可大於9");
                            } else {
                                div4.innerHTML = "";
                            }
                        }

                        if (!pay) {
                            setErrorFor(div5, "請先付款");
                        }

                        if (hasError) {
                            return false;
                        }
                        var xhr1 = new XMLHttpRequest();
                        xhr1.open("POST", "<c:url value='/orderlist' />", true);
                        var jsonMember = {
                            "name": name,
                            "time": time,
                            "resturant": resturant,
                            "date": date,
                            "people": people
                        }
                        xhr1.setRequestHeader("Content-Type", "application/json");
                        xhr1.send(JSON.stringify(jsonMember));
                        xhr1.onreadystatechange = function () {
                            // 伺服器請求完成
                            if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201)) {
                                result = JSON.parse(xhr1.responseText);
                                if (result.fail) {
                                    divResult.innerHTML = "<font color='red' >"
                                        + result.fail + "</font>";
                                } else if (result.success) {
                                    divResult.innerHTML = "<font color='GREEN'>"
                                        + result.success + "</font>";
                                    div0.innerHTML = "";
                                    div1.innerHTML = "";
                                    div2.innerHTML = "";
                                    div3.innerHTML = "";
                                    div4.innerHTML = "";
                                } else {
                                    if (result.nameError) {
                                        div0.innerHTML = "<font color='green' size='-2'>"
                                            + result.nameError + "</font>";
                                    } else {
                                        div0.innerHTML = "";
                                    }
                                    if (result.timeError) {
                                        div1.innerHTML = "<font color='green' size='-2'>"
                                            + result.timeError + "</font>";
                                    } else {
                                        div1.innerHTML = "";
                                    }
                                    if (result.resturantError) {
                                        div2.innerHTML = "<font color='green' size='-2'>"
                                            + result.resturantError + "</font>";
                                    } else {
                                        div2.innerHTML = "";
                                    }
                                    if (result.dateError) {
                                        div3.innerHTML = "<font color='green' size='-2'>"
                                            + result.dateError + "</font>";
                                    } else {
                                        div3.innerHTML = "";
                                    }
                                    if (result.peopleError) {
                                        div4.innerHTML = "<font color='green' size='-2'>"
                                            + result.peopleError + "</font>";
                                    } else {
                                        div4.innerHTML = "";
                                    }
                                }
                            }

                        }
                    };
                };
                function setErrorFor(input, message) {
                    input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
                    hasError = true;
                }
                function dateValidation(str) {
                    var re = new RegExp("^([0-9]{4})[-]{1}([0-9]{1,2})[-]{1}([0-9]{1,2})[ ]{1}([0-2]{1})([0-9]{1})[:]{1}([0-6]{1})([0-9]{1})[:]{1}([0-5]{1})([0-9]{1})");
                    var days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
                    var strDataValue;
                    var valid = true;
                    if ((strDataValue = re.exec(str)) != null) {
                        var y, m, d;
                        y = parseFloat(strDataValue[1]);
                        if (y <= 0 || y > 9999) { /*年*/
                            return false;
                        }
                        m = parseFloat(strDataValue[2]);

                        if (m < 1 || m > 12) { /*月*/
                            return false;
                        }
                        d = parseFloat(strDataValue[3]);
                        if (y % 4 == 0 && y % 100 != 0 || y % 400 == 0) {
                            days[2] = 29;
                        } else {
                            days[2] = 28;
                        }
                        if (d <= 0 || d > days[m]) { /*日*/
                            valid = false;
                        }
                    } else {
                        valid = false;
                    }
                    return valid;
                }
            </script>
            <link rel='stylesheet' href="${pageContext.request.contextPath}/templatemo_507_victory/css/style2.css" type="text/css" />
            <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
                integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
                crossorigin="anonymous" />
            <meta charset="UTF-8">
            <title>訂餐趣</title>
            <meta name="description" content="">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="apple-touch-icon" href="apple-touch-icon.png">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/bootstrap-theme.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/fontAwesome.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/hero-slider.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/owl-carousel.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/templatemo_507_victory/css/templatemo-style.css">
            <link
                href="https://fonts.googleapis.com/css?family=Spectral:200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i"
                rel="stylesheet">
            <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">
            <script src="${pageContext.request.contextPath}/templatemo_507_victory/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        </head>

        <body>
            <div class="header">
                <div class="container">
                    <a href="#" class="navbar-brand scroll-top">訂餐趣</a>
                    <nav class="navbar navbar-inverse" role="navigation">
                        <div class="navbar-header">
                            <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse"
                                data-target="#main-nav">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <!--/.navbar-header-->
                        <div id="main-nav" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li><a href="<c:url value='/' />"><h3>主頁</h3></a></li>
                                <li><a href=""><h3>合作餐廳</h3></a></li>
                                <li><a href=""><h3>食記文章</h3></a></li>
                            </ul>
                        </div>
                        <!--/.navbar-collapse-->
                    </nav>
                    <!--/.navbar-->
                </div>
                <!--/.container-->
            </div>
            <!--/.header-->
            
            <section class="page-heading">
        	<div class="container">
            	<div class="row">
                	<div class="col-md-12">
                    	<h1>訂位資訊</h1>
                	</div>
            	</div>
        	</div>
    		</section>
            
            
            <div align='center'>
                <div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
                <br>
                <fieldset style='display: inline-block; width: 820px;'>
                    <legend>填寫下列資料</legend>
                    <div class="st1">
                        <label class="t1" for="name">會員ID:</label> <input type="text" id="name" name="name"
                            size="20"><br> <span id='result0c' style="height: 10px;"></span>
                    </div>
                    <div class="st1">
                        <label for="time" class="t1">預約時間:</label>
                        <input type="datetime-local" id="time" name="time" style="width: 160px"><br>
                        <span id='result1c' style="height: 10px;"></span>
                    </div>
                    <div class="st1">
                        <label class="t1" for="resturant">餐廳:</label>
                        <input type="text" id="resturant" name="resturant" size="20" disabled="true"
                            value="布娜飛比利時啤酒餐廳 Bravo Beer"><br>
                        <span id='result2c' style="height: 10px;"></span>
                    </div>

                    <div class="st1">
                        <label for="date" class="t1">發送時間:</label> <input type="text" id="date" name="date" size="20"
                            disabled="true"><br>
                        <span id='result3c' style="height: 10px;"></span>
                    </div>

                    <div class="st1">
                        <label class="t1" for="people">人數:</label> <input type="text" id="people" name="people"
                            size="20" autocomplete="off"><br>
                        <span id='result4c' style="height: 10px;"></span>
                    </div>
                </fieldset>

                <p>訂位須酌收$1服務費(請以payapl方式付款)</p><br>
                <span id='result5c' style="height: 10px;"></span>
                <!-- Set up a container element for the button -->
                <div id="paypal-button-container" style="width: 450px"></div>

                <!-- Include the PayPal JavaScript SDK -->
                <script
                    src="https://www.paypal.com/sdk/js?client-id=test&currency=USD"></script>
                <script>
                    // Render the PayPal button into #paypal-button-container
                    paypal.Buttons({

                    }).render('#paypal-button-container');
                </script>

                <div class="sub">
                    <button id="sendData">送出</button>
                    <a href="<c:url value='/home' />"><button id="back">離開</button></a>
                </div>
            </div>
            <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <p>Copyright &copy; 2020 Victory Template</p>
                        </div>
                        <div class="col-md-4">
                            <ul class="social-icons">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <p>Design: TemplateMo</p>
                        </div>
                    </div>
                </div>
            </footer>
        </body>

        </html>