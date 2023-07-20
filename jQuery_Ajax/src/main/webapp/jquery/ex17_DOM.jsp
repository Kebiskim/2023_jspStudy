<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 탐색 : siblings(), next(), prev()</title>
<style type="text/css">
	.s1 *{
		display: block;
		border: 2px solid gray;
		color: gray;
		padding: 5px;
		margin: 15px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// siblings() : 부모태그가 같은 형제요소
	// prev() : 이전 형제 요소
	// next() : 다음 형제 요소
	$(document).ready(function(){
		// 자기자신을 제외한, 부모를 공유하는 다른 형제들에게만 적용됨 (★ 같은 태그가 두개인 경우는 자신을 포함함)
		// $("span").siblings().css({"color" : "red", "border" : "2px solid red"});
		// h2 요소의 형제 요소 중 p태그만 추출해서 적용 
		// $("h2").siblings("p").css({"color" : "red", "border" : "2px solid red"});
		$("h2").siblings("p").css({"color" : "red", "border" : "2px solid red"});
		
		$("h2").prev().css({"color" : "blue", "border" : "2px solid red"});
		$("h2").next().css({"color" : "orange", "border" : "2px solid orange"});
		
	});
</script>
</head>
<body class="s1">
	<div>
		<span>span</span>
		<span>span</span>
		<h2>h2</h2>
		<h3>h3</h3>
		<p>p</p>
	</div>
</body>
</html>