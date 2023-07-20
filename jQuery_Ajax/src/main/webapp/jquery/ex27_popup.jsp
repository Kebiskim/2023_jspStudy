<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		background-color: lightyellow;
	}
	#movie{
		position: absolute;
	}
	#movie2{
		position: absolute;
		left: 400px;
	}
	#close{
		padding: 30px;
		text-align: right;
	}
	#close2{
		padding: 30px;
		text-align: right;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 1. 팝업창 만들기 (name은 popup1)
		// 2. 저장된 쿠키 있는지 확인 (getCookie)
		// 3. 없을 경우 팝업 출력
		// 4. 
		
          // 변수가 없을경우 팝업 출력         
		  var popup1 = getCookie('popup1');

          if (!popup1) {
              popUpAction('popup1');
              console.log("쿠키 있음");
          }
          
		$("#close").on("click", function() {
			$("#movie").css("display", "none");
		});
		$("#close2").on("click", function() {
			setCookie00("#movie2", "done", 1);
			/* $("#movie2").css("display", "none"); */
		});
		
	});
		// 별도의 function 선언은 아래에서 하기.
		
		
		// 쿠키 가져오기 함수 (작동함)
	  function getCookie(name) {
            var nameOfCookie = name + "=";
            var x = 0; 
            while (x <= document.cookie.length) {
                var y = (x + nameOfCookie.length);
                
                if (document.cookie.substring(x, y) == nameOfCookie) {
                    if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                        endOfCookie = document.cookie.length;
                    return unescape(document.cookie.substring(y, endOfCookie));
                }
                x = document.cookie.indexOf(" ", x) + 1; 
                if (x == 0) break;
            }
            return "";
        }
	  
	  // 24시간 기준 쿠키 설정하기 
      // expiredays 후의 클릭한 시간까지 쿠키 설정 
    /*   function setCookie24(name, value, expiredays) {
          var todayDate = new Date(); todayDate.setDate(todayDate.getDate() + expiredays);
          document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
      } */
	  
      // 00:00 시 기준 쿠키 설정하기 
      // expiredays 의 새벽 00:00:00 까지 쿠키 설정 
      function setCookie00(name, value, expiredays) {
          var todayDate = new Date();
          todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);
          if (todayDate > new Date()) {
              expiredays = expiredays - 1;
          }
          todayDate.setDate(todayDate.getDate() + expiredays);
          document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
      }
	  
		// 팝업 출력
		function popUpAction(name){
			$("div[name=" + name + "]").fadeIn();
		}
	  	
		// 닫기버튼 클릭 이벤트
		$(".btn_close").click(function() {
			$(this).parent(".main_notice_pop").fadeOut();
			
			// 오늘하루 보지 않기 체크
			if ($("input:checkbox[name=today_close1]").is(":checked") == true){
				console.log("닫히기 전!");
				setCookie00("popup1", "done", 1);
				console.log("닫혔다!");
			}
			
			// name으로 해당 팝업창 닫기
			$(this).parent("div[name=" + name + "]").fadeOut();
		});
		

</script>
</head>
<body>
	<div id="movie">
		<pre><h3>공지사항 - One</h3></pre>
		<img alt="" src="../images/1.png">
		<div id=close style="background-color: skyblue">닫기</div>
	</div>
	<div class="main_notice_pop" name="popup1">
		<pre><h3>공지사항 - Two</h3></pre>
		<img alt="" src="../images/2.png">
		<a href="#" class="btn_close"></a><br>
		<input type="checkbox" name="today_close1"/>오늘은 그만보기
		<!-- <div id=close2 style="background-color: skyblue">닫기</div> -->
	</div>
	<div>
		<h2>ICT 사진관</h2>
		<div>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
			<p>사진관 오시는 길</p>
			<p>2호선 신촌역</p>
		</div>
	</div>
</body>
</html>