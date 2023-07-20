<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		<%-- XMLHttpRequest 객체는 브라우저 버전이 낮으면 가지고 있지 않는다.
			 그러나, XMLHttpRequest 객체와 비슷한 기능을 가진 객체가 존재한다.
			 (ActiveXObject)
		 --%>
		function createRequest() {
			var req;
			try {
				req = new XMLHttpRequest();
				// 실제로 아래는 사용 안하긴 함 (구버전 브라우저 대응)
			} catch (e) {
				try {
					req = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					req = new ActiveXObject("Msxml3.XMLHTTP");
				}
			}
			return req;
		}
		
		// 1. 객체 생성
		var request = new XMLHttpRequest();
		
		// 2. open ("전송방식", "경로", "비동기 여부")
		request.open("POST", "data.html", false);
		
		// 4. 검사해서 성공하면 화면 출력(자리가 3번 밑으로 가면 오류 발생)
		request.onreadystatechange = function() {
			// request.readyState : 데이터의 배달 결과 상태 표시
			// 0 => 객체 생성, 1 => open 안함, 2 => send 안함
			// 3 => 데이터 일부만 받음, 4 => 전체 다 받음
			
			// request.status => 서버로부터의 응답상태
			// 200 => 성공, 4XX(client 오류), 5XX(server 오류)
			
			if(request.readyState == 4 && request.status == 200){
				document.body.innerHTML = request.responseText;
			}
		}
		
		// 3. send() : 실행
		request.send();
		
	</script>
</body>
</html>