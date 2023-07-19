<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.p1{color: red;}
	#p2{background-color: pink;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// 클래스 속성 추가 : addClass
	// 클래스 속성 제거 : removeClass
	// 요소 제거 : remove
	$(document).ready(function(){
		$("#btn1").on("click", function() {
			$(".p1").removeClass();
			// Id는 불가하고, Class 만 있음.
			// $("#p2").removeClass();
		});
		$("#btn2").on("click", function() {
			$(".p1").remove(".p1");
		});
		$("#btn3").on("click", function() {
			$("p").remove("#p2");
		});
		
	});
</script>
</head>
<body>
	<p class="p1">여기는 P태그-1 내용 입니다.</p>
	<p>여기는 P태그-2 내용 입니다.</p>
	<p class="p1">여기는 P태그-3 내용 입니다.</p>
	<p id="p2">여기는 P태그-4 내용 입니다.</p>
	<p class="p1">여기는 P태그-5 내용 입니다.</p>
	<hr>
	
	<button id="btn1">클래스속성 제거</button>	
	<button id="btn2">클래스 제거</button>	
	<button id="btn3">아이디 제거</button>	
</body>
</html>