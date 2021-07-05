<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Righteous&display=swap" rel="stylesheet">
<style type="text/css">
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}

/* 上面的是將所有css預設都歸零 */


body{
    text-align: center;
    background: #305dbe;
    
}

header{
    display:flex;
    background: #3169E3;
    width: 100%;
    height: 70px;
    align-items: center;
    
    box-shadow: 0px 5px 35px 10px #254faa;
    
}

header h1{
    margin-left: 40px;
    color:white;
    font-size: 30px;
    font-family: Righteous;
}

header h1{
    margin-left: 40px;
    
    color:white;
    font-size: 30px;
    font-family: Righteous;
}

header .search1{
    display: flex;
    align-items: center;
    background-color: #88aaf1;
    border-radius: 10px;
    width: 60%;
    height: 40px;
    font-size: 20px;
    text-align: left;
    text-indent: 15px; 
    margin-left: 15px;
    color:white;
    font-family: Microsoft JhengHei;
}

.search2{
    margin-left:5px ;
    border: white;
    border-top-left-radius: 20px;
    border-bottom-left-radius: 20px;
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
    width: 89%;
    color:rgb(80, 67, 67);
    height:37px;
    outline: none;
    text-indent: 15px;
}

.topic-div{
    margin:0 auto;
    margin-top: 5px;
    background-color: white;
    width:775px;
    height:2000px;
    border-radius: 10px;
}

.topics{
    font-size: 16px;
    background: #FFFAFA;
    border: #FFFAFA 1px solid;
    border-bottom: rgb(240, 233, 233) 1.5px solid;
    width: 750px;
    height: 80px;
    font-size: Microsoft JhengHei;
    text-align: left;
    padding-left:30px ;
}
</style>
<script type="text/javascript">
	window.onload = function(){
		let alltopic = document.getElementById("alltopic");
		let xhr1 = new XMLHttpRequest();
		xhr1.open("Post","<c:url value='/getallcontent'/>", true);
		xhr1.send();
		xhr1.onreadystatechange = function(){
			if(xhr1.readyState == 4 && xhr1.status == 200){
				
				alltopic.innerHTML =  showTopic(xhr1.responseText);
			}
		}
		
		function showTopic(text){
			let forums = JSON.parse(text);
			let result = "<div>";
			for(let i =0; i<forums.length; i++){
				let forum = forums[i];
				console.log(forum.topic);
				result += "<form action='toContent' method='POST'>";
				result += "<button class='topics'>" + forum.topic + "</button>";
				result += "</form>";
			} 
			result += "</div>";
			
			return result;
		}
		
	}
</script>
</head>
<body>

<header>
    	<h1>iPodcast Forum</h1>
    	<label class="search1">Search <input class="search2" type="text"></label>        
	<form action="textinput.html">
	<button class="InsertArticle_btn">新增文章</button>
	</form>
    </header>
    
<a href="<c:url value='/AddPage' />"><input type="button" value="新增文章"></a> <!-- 記住只有controller是getmapping能夠這樣用 -->
<div id="alltopic">
	

</div>
 
</body>
</html>