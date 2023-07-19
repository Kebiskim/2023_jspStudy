<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// 콜백함수는 현재 효과가 100% 완료되었을 때만 실행.
	$(document).ready(function(){
		// 콜백함수
		$("#btn").on("click", function() {
			// 콜백함수의 증거 => 다 숨겨진 이후에 alert 실행
/* 			$("p").hide("slow", function() {
				alert("안녕하이");
			});
 */			
 			// 콜백함수가 아닌 경우 : 다 숨겨지지 않아도 alert창이 나옴
			$("p").hide("slow");
 			alert("하이하이");
		});
	});
</script>
</head>
<body>
	<button id="btn">눌러주세요</button>
	<p>눌러주시면 해당 내용은 사라집니다.</p>
</body>
</html>