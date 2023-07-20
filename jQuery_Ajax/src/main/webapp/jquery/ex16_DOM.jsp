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
		// children(selector) : 어떤 요소의 자식 요소를 선택 (자신을 포함한 하위 요소들)
		// find(selector) : 어떤 요소의 하위 요소 중 특정 요소를 찾을 때 사용 
		
		// ★ 아래부분 조사해 보자.
		// children : 선택한 요소의 마지막 요소까지 반환
		// find(요소)	: 선택한 요소까지 반환
		
		// div 자식 요소 중 p 요소 선택 (여러개일 때는 복수 가능)
		// $("div").children(".p").css({"color" : "red", "border" : "5px solid red"});
		
		$("div").children(".p1").css({"background" : "lightblue", "border" : "5px solid red"});
		$("div").find(".p2").css({"color" : "blue", "border" : "5px solid red"});
	});
</script>
</head>
<body>
	<div class="myclass" style="width: 500px; border: 2px solid gray"> Mydiv
		<p class="p1">p(child)
			<span>span(grandchild)</span>
		</p>
		<p class="p2">p(child)
			<h2>h2</h2>
			<span>span(grandchild)</span>
		</p>
	</div>
</body>
</html>