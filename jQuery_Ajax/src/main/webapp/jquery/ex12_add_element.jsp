<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// append() : 요소의 끝에 내용 추가
	// prepend() : 요소의 시작 부분에 내용 추가
	// before() : 요소의 앞에 내용 삽입
	// after() : 요소의 뒤에 내용 삽입
	$(document).ready(function(){
		// append를 가장 많이 쓴다!!
		$("#btn1").on("click", function() {
			$("p").append("<b>글자 뒤에 추가하기 </b>")
		});
		$("#btn2").on("click", function() {
			$("ol").append("<li>리스트 뒤에 추가하기 </li>")
		});
		$("#btn3").on("click", function() {
			$("p").prepend("<b>글자 앞에 추가하기</b>")
		});
		$("#btn4").on("click", function() {
			$("ol").prepend("<li>리스트 앞에 추가하기 </li>")
		});
		// 별도의 텍스트가 붙음.
		$("#btn5").on("click", function() {
			$("p").before("<b>글자 앞에 추가하기 </b>")
		});
		// 별도의 ol이 붙음
		$("#btn6").on("click", function() {
			$("ol").before("<li>리스트 앞에 추가하기 </li>")
		});
		$("#btn7").on("click", function() {
			$("p").after("<b>글자 뒤에 추가하기</b>")
		});
		$("#btn8").on("click", function() {
			$("ol").after("<li>리스트 뒤에 추가하기 </li>")
		});
		
	});
</script>
</head>
<body>
	<p>한국 ICT 인재 개발원1</p>
	<p>한국 ICT 인재 개발원2</p>
	<p>한국 ICT 인재 개발원3</p>
	<ol>
		<li>HTML</li>
		<li>CSS</li>
		<li>JavaScript</li>
	</ol>
	
	<button id="btn1">Append Text</button>	
	<button id="btn2">Append list item</button>	
	<button id="btn3">prepend Text</button>	
	<button id="btn4">prepend list item</button>
	<button id="btn5">before Text</button>
	<button id="btn6">before list item</button>
	<button id="btn7">after Text</button>
	<button id="btn8">after list item</button>
</body>
</html>