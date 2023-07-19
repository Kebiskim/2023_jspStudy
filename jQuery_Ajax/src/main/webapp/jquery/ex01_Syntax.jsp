<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery 문법</title>
<%-- jQuery 라이브러리 다운로드 후 js 폴더 만들고 넣기 --%>
<%-- <script type="text/javascript" src="../js/jquery-3.7.0.js"></script> --%>

<%-- jQuery 라이브러리 CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script type="text/javascript">
	document.write("Hi~~~~~");
</script>
<script type="text/javascript">
	$(document).ready(function(){
		// document.write("Hello, jQuery");
		// 태그를 넣어보면 둘의 차이 알 수 있음 (text는 글자로 들어감. html은 태그를 인식해서 사용함!)
		$("#k").text("<h2>jQuery 넣기<h2>");
		$(".k2").html("<h2>jQuery 넣기<h2>");
	});
</script>
</head>
<body>
<%-- 
	// 실행 순서 : head => body => jQuery
	id 클래스 등 구조를 알아야 하기 때문에 가장 마지막에 실행됨
	
	[기본 문법]
	$(document).ready(function(){
		Basic syntax is : $(selector).action()	
	});
	
	또는
	$(function(){
		Basic syntax is : $(selector).action()
	});
	
	** selector :
		$(this).action 		: 현재 요소
		$("p").action 		: p요소(Element = 태그)
		$(".test").action 	: class가 test인 요소
		$("#test").action 	: id가 test인 요소
		등
	
--%>
	<h2>Hello</h2>
	<h2 id="k"></h2>
	<h2 class="k2"></h2>
</body>
</html>