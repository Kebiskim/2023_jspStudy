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
	$(document).ready(function(){
		var position = 0;
		var timer;
		$("#btn").on("click", function() {
			timer = setInterval(() => {
				position += 5;
				$("img").css({"marginLeft" : position}).css("marginTop", position);
			}, 10);
		});
		$("img").on("click", function() {
			clearInterval(timer);
		});
	});
</script>
</head>
<body>
	<p><button id="btn">이동</button></p>
	<div>
		<img alt="" src="../images/1.png">
	</div>
</body>
</html>