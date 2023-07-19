<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>$(선택자).css() : css를 바로 적용</title>
<style type="text/css">
	.red{background-color: red; color: white;}
	#box{
		background-color: skyblue;
		width: 100px;
		padding: 10px;
		text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// JS로 스타일 적용하기
		document.getElementById("java").style.background="orange";
		
		// addClass() 사용
		$("#jsp").addClass("red");
		
		// .css("속성", "값")
		// 자식
		$("body>ul>li").css("color", "orange");
		// 자손
		$("ul li").css("background", "purple");
		
		$("#box").on("click", function() {
			$("#box").css("width", "+=200").css("height", "+=200");
		});
		// 자바의 this와 다른 점 => 자기를 호출한 곳이 this가 됨.
		// on 클릭과 one 클릭의 차이점 => one 클릭은 한번 누르고 나면 작동 안됨!!
		/* 
			var words = $( "p" ).first().text().split( /\s+/ );
			var text = words.join( "</span> <span>" );
			$( "p" ).first().html( "<span>" + text + "</span>" );
			$( "span" ).on( "click", function() {
			  $( this ).css( "background-color", "yellow" );
			});
		*/
	});
</script>
</head>
<body>
	<ul>
		<li id="java">JAVA</li>
		<li>WEB</li>
		<ul>
			<li id="jsp">JSP</li>
			<ul>
				<li>EL</li>
				<li>JSTL</li>
			</ul>
			<li>SPRING</li>
		</ul>
	</ul>
	<hr>
	<div id="box">눌러주세요</div>
</body>
</html>