<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document Object Model(HTML 탐색)</title>
<style type="text/css">
	.ancestors *{
		display: block;
		border: 2px solid black;
		color: red;
		padding: 5px;
		margin: 15px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// 문서 객체 모델(DOM, Document Object Model)은 XML이나 HTML 문서에 접근하기 위한 일종의 인터페이스입니다.
	// 부모, 자식, 자손, 형제
	// 부모 : parent() 메서드는 선택한 요소의 직속 상위 요소를 반환한다.
	// parents() 메서드는 선택한 루트요소까지 선택한 요소의 모든 상위 요소
	// parentsUntil()은 선택한 요소와 선택한 상위 요소 사이
	$(document).ready(function(){
		$("span").css("color", "blue");
		// $("span").parent().css({"color" : "skyblue", "border" : "2px solid skyblue"});
		// $("span").parents().css({"color" : "orange", "border" : "2px solid orange"});
		$("span").parentsUntil("div").css({"color" : "orange", "border" : "2px solid orange"});
	});
</script>
</head>
<body>
	<div class="ancestors">
	  <div style="width:500px;">div (great-grandparent)
	    <ul>ul (grandparent)
	      <li>li (direct parent)
	        <span>span</span>
	      </li>
	    </ul>
	  </div>
	
	  <div style="width:500px;">div (grandparent)
	    <p>p (direct parent)
	      <span>span</span>
	    </p> 
	  </div>
	</div>
</body>
</html>