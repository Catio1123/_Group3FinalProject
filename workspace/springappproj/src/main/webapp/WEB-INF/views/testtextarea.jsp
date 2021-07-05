<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#textarea {
    -moz-appearance: textfield-multiline;
    -webkit-appearance: textarea;
    border: 1px solid gray;
    font: medium -moz-fixed;
    font: -webkit-small-control;
    height: 28px;
    overflow: auto;
    padding: 2px;
    resize: both;
    width: 400px;
}
</style>
<script type="text/javascript">
	window.onload = function(){
		let imgSel = document.getElementById("imgSel");
		imgSel.onchange = function(){
			readURL(this);
		};
		
		function readURL(input){
			if(input.files &&input.files[0]){
				let reader = new FileReader();
				
				reader.onload = function(e){
					let myimg = document.getElementById("myimg");
					myimg.setAttribute("src", e.target.result);
				}
				reader.readAsDataURL(input.file[0]);
			}
		}
		
	}
</script>
</head>
<body>
<input class="file" type="file" id="imgSel">
<div id="textarea" contenteditable>
	<img contenteditable="false" style="width:45px" id="myimg">
	I look like a textarea
</div>

</body>
</html>