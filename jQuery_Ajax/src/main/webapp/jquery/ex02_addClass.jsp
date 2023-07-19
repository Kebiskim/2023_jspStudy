<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addClass : 스타일에 지정된 클래스 추가(적용)</title>
<style type="text/css">
	.silver{background-color: silver;}
	.orange{background-color: orange;}
	.mystyle{color: white;}
	.mystyle2{color: black; font-size: 30px; font-weight: bold;}
	.mystyle3{background-color: skyblue; color: black; font-size: 30px; font-weight: bold;}
	.mystyle4{background-color: black; color: white;}
	.mystyle5{background-color: purple; color: white;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	function send_go(){
		alert("hi~~");
	}	
</script>
<script type="text/javascript">
	$(document).ready(function(){
		// 위 style에서 만든 orange 클래스를 addClass 해준다.
		// $("#k1").addClass("orange").addClass("mystyle");
		// 아래처럼 띄우고 써도 같이 적용된다.
		$("#k1").addClass("orange mystyle mystyle2");
		
		// document ready 이거 안에 전부다 들어가야 된다!! 
		$( "#k3" ).on( "click", function() {
		  alert( "Handler for `click` called." );
		} );
		
		// a요소 전체 적용 
		$("a").addClass("silver");
		
		$("a:first").addClass("mystyle2");
		$("a:last").addClass("mystyle2");
		
		// 요소[속성] : 해당 속성이 있는 요소
		$("a[href]").addClass("mystyle3");
		
		// 요소[속성 = '값' ] : 해당 속성이 값과 일치하는 요소
		$("a[href = 'https://www.daum.net']").addClass("mystyle4");
		
		// 요소[속성 ^= '값' ] : 값으로 시작하는 요소
		$("a[href ^= 'mailto:']").addClass("mystyle4");
		
		// 요소[속성 $= '값' ] : 값으로 끝나는 요소
		$("a[href $= 'net']").addClass("mystyle5");
		
		// 요소[속성 *= '값' ] : 값을 포함하는 요소
		// $("a[href *= '//']").addClass("mystyle5");
	});
/* 	// 이벤트 처리
	$("#k3").click(function() {
		alert("Hello jQuery");
	});
	*/
	
 </script>
</head>
<body>
	<div style="background-color : yellow;" onclick="send_go()">안녕하세요 jQuery-1 입니다.</div>
	<div class="silver" onclick="send_go()">안녕하세요 jQuery-2 입니다.</div>
	<div id = "k1">안녕하세요 jQuery-3 입니다.</div>
	<div id = "k2">안녕하세요 jQuery-4 입니다.</div>
	<div id = "k3">안녕하세요 jQuery-5 입니다.</div>
	<hr>
	
	<a href="https://www.naver.com">네이버</a>
	<a href="https://www.google.com">구글</a>
	<a href="https://www.daum.net">다음</a>
	<a href="mailto:rlatkddn09@naver.com">네이버 메일</a>
	<a href="mailto:nojm73@gmail.com">구글 메일</a>
	<a href="mailto:nojm73@daum.net">다음 메일</a>
</body>
</html>