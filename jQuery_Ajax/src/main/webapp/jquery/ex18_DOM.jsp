<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML 탐색(필터링) : first, last, eq, filter, not</title>
<style type="text/css">
	div{
		border: 1px solid black;
		width: 150px;
		padding: 5px;
		margin: 15px; 
	}	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// first : 지정한 요소의 첫번째 요소
	// last  : 지정한 요소의 마지막 요소
	// eq(index번호) : 해당 index에 해당하는 요소
	// filter : 선택된 요소들의 일부분을 추출
	// not : filter의 반대
	$(document).ready(function(){
		$("div").first().css("background", "yellow");
		$("div").last().css("background", "orange");
		$("div").eq(2).css({"background" : "pink", "color" : "red"});
		// 해당 값에 해당하는 것만 변경됨
// 		$("div").filter(":odd").css({"background" : "skyblue", "color" : "red"});
		// ★ 인덱스를 기준으로 하는 것임!!!
		$("div").not(":odd").css({"background" : "skyblue", "color" : "red"});		
	});
</script>
</head>
<body>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
	<div>
		<p>여기는 문서 태그</p>
		<p>여기는 문서 태그</p>
	</div>
</body>
</html>