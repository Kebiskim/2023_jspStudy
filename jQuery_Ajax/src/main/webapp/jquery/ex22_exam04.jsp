<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄 뉴스 - 자바스크립트</title>
<style type="text/css">
	
</style>
<script type="text/javascript">
	var news = ["[지금은 과학] 감자 칩도 집는 만능 집게…전기없이 움직인다",
		"원하는대로 맞춰드립니다 고개 드는 '갭투자'",
		"검찰, 'KT 일감 몰아주기' 구현모·남중수 압수수색SK이노, 2022년 'ESG 리포트' 발간…공시 의무화 선제 대응",
		"속도 내는 토큰증권 입법화, 업계는 '반신반의'",
		'대형마트 방사능 안전체계 구축 나섰다 "왜?"',
		'"엔데믹 실감" 여행상품 하루 33억원어치도 팔린다'];
	var index = 0;
	var timer;
	function start_news() {
		// 2초마다 showNews() 함수를 실행하자.
		timer = setInterval(showNews, 2000);
	}
	function showNews() {
		var div = document.getElementById("mydiv");
		div.innerHTML = news[index++];
		if(index == news.length){
			index = 0;
		}
	}
	function stop_news() {
		// setInterval()을 중지시키는 함수
		clearInterval(timer);
	}
</script>
</head>
<body>
	<div id="mydiv"></div>
	<button onclick="start_news">뉴스보기</button>
	<button onclick="stop_news">뉴스중지</button>	
</body>
</html>