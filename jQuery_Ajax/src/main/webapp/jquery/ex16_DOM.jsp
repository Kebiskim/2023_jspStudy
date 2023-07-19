<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 탐색 : children()</title>
<style type="text/css">
	/* *을 넣어야 그 밑에것까지 모두 적용 된다! */
	.myclass *{
		display: block;
		border: 1px solid pink;
		padding: 5px;
		margin: 10px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// ★ 아래부분 조사해 보자.
		// children : 선택한 요소의 마지막 요소까지 반환
		// find(요소)	: 선택한 요소까지 반환
		$("div").children().css({"color" : "red", "border" : "5px solid red"});
		
		
	});
</script>
</head>
<body>
	<div class="myclass" style="width: 500px;"> Mydiv
		<p>p(child)
			<span>span(grandchild)</span>
		</p>
		<p>p(child)
			<span>span(grandchild)</span>
		</p>
	</div>
</body>
</html>