<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h2{text-align: center;}
	div{
		margin:auto;
		width:500px;
		height:2000px;
		border: 1px solid #bcbcbc;
	}
	/* a 태그 중에서 class가 top인 컴포넌트들만 선택 */
	a.top{
		position: fixed;
		left: 50%;
		bottom: 50px;
		display: none;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// scrollTop() : 맨 위로 스르륵 부드럽게 올라가는 효과를 만들 수 있음 (스크롤바의 수직위치를 가져옴) 
	$(document).ready(function(){
		$(window).scroll(function() {
			// 200 픽셀 이상 수직으로 내려가면
			if($(this).scrollTop() > 200){
				$(".top").fadeIn();
			}else{
				$(".top").fadeOut();
			}
		});
		// 부드럽게 올라가는 애니메이션 효과
		$(".top").on("click", function() {
			// html, body 두개다 사용해줘야 함!!
			$("html, body").animate({scrollTop:0}, 2000);
		});
	});
</script>
</head>
<body>
	<div><h1>맨위로 부드럽게 이동하는 링크 만들기</h1></div>
	<a href="#" class="top">TOP</a>
</body>
</html>