<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
	}
	.jbTitle{
		text-align: center;
	}
	.jbMenu{
		text-align: center;
		background-color: yellow;
		padding: 10px; 0px;
		width: 100%;
	}
	.jpContent{
		height: 2000px;
	}
	.jbFixed{
		position: fixed;
		top: 0px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// offset() - 선택한 요소의 좌표를 가져오거나 특정 좌표로 이동시키는 메서드
	$(document).ready(function(){
		var jbOffset = $(".jbMenu").offset();
		// console.log($(document).scrollTop());
		$(window).scroll(function() {
			if($(document).scrollTop() > jbOffset.top){
				$(".jbMenu").addClass("jbFixed");
			}else{
				$(".jbMenu").removeClass("jbFixed");
			}
		});
	});
</script>
</head>
<body>
	<!-- Semantic 태그 => 상위노출 될 때 중요함(검색) -->
	<div class="jbTitle">
		<h2>상단 고정 메뉴</h2>
		
	</div>
	<div class="jbMenu">
		<p>
			First Menu
			Second Menu
			Third Menu
			Fourth Menu
		</p>
	</div>
	<div class="jbContent">&nbsp;</div>
</body>
</html>