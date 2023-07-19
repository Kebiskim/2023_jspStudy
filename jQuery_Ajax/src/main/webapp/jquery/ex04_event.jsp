<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<style type="text/css"></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
		// 마우스 이벤트 : click(.on(), .bind()), dblclick(), .hover(), mouseover(), mouseout(), toggle())
		// 키보드 이벤트 : keypress, keyup(눌렀다 뗐을 때), keydown
		// form 이벤트 : submit, change, focus
	$(document).ready(function(){
		// 클릭 이벤트
		$("#p1").on("click", function(){
			alert("on 클릭 성공");
		});
		// 나중에 동적 처리할 때는 bind를 사용해야 함.
		$("#p2").bind("click", function(){
			alert("bind 클릭 성공");
		});
		
		// 마우스 이벤트
/* 		$("#img").hover(function(){
			// 속성변경 => attr
			$(this).attr("src", "../images/2.png");
		}); */
		
/* 		$("#img").mouseover(function() {
			$(this).attr("src", "../images/2.png");
		});
		$("#img").mouseout(function() {
			$(this).attr("src", "../images/1.png");
		}); */
/* 		$("#img").toggle(function(){
			$(this).attr("src", "../images/1.png")
		}, function(){
			$(this).attr("src", "../images/2.png")
		});
		
 */		
 
		// 토글 하는법 찾아보기!
	/* 	 $("#p3").click(function(){
			$("#img").toggle("src", "../images/1.png")
		}, function(){
			$("#img").toggle("src", "../images/2.png")
		});
		 */
		// keyup : 글자를 입력하면 (한글자 지우거나 입력하고 마우스 뗄 떼마다 실행됨)
		// val() => value
		$("#name").keyup(function(){
			var name = $(this).val();
			if (name.length > 4)
			alert("이름은 4글자 이하로만 입력하세요");
		});
		
		// 체크박스 : change(), select(), radio
		$("#chk").change(function(){
			// var str = $("#addr").val();
			// $("#addr2").val(str);
			var str = $("#addr").val();
			if($(this).is(":checked")){ // 체크가 된 상태인지 확인
				$("#addr2").val(str);
			}else{
				$("#addr2").val("");	
			}
		});
		
		// 라디오
		$("input[name=gender]").change(function(){
			var res = $(this).val();
			$("#res").text(res);			
		});
		
		$("#pwd2").keyup(function(){
			if($("#pwd").val() == $("#pwd2").val()){
				$("#s1").html("<b>암호가 맞네요</b>");
			}else{
				$("#s1").html("<b>암호가 틀리네요</b>");
			}
		});
		
	});
</script>
</head>
<body>
	<p><span id="p1">이벤트 처리</span></p>
	<p><span id="p2">이벤트 처리</span></p>
	<div id="p3">이벤트 처리</div>
	<p><img id="img" src="../images/1.png"></p>
	<p><input type="text" name="name" id="name"></p>
	<hr>
	
	<p>주소 : <input type="text" name="addr" id="addr"></p>
	<p><input type="checkbox" id="chk">상동</p>
	<p>주소 : <input type="text" name="addr2" id="addr2"></p>
	<hr>
	<p>성별 : <input type="radio" name="gender" value="남자">남자
			 <input type="radio" name="gender" value="여자">여자
			 <input type="radio" name="gender" value="외국인">외국인
	</p>
	<div id="res"></div>
	
	<p>비밀번호 : <input type="password" name="pwd" id="pwd"></p>
	<p>비밀번호 확인 : <input type="password" name="pwd2" id="pwd2"></p>
	<p><span id="s1"></span></p>
</body>
</html>