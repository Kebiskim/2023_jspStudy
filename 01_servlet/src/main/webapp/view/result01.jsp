<!-- Servlet 첨 배울 때 한글처리한다고 배운 것들 (text/html;, 등등)
html 안에서 java를 보여주는 것 => JSP. 한글처리가 자동으로 되어 있음!! -->
<!-- JSP는 view 폴더 안에 만드는 것임!! 아래 코드가 JSP 사용할 수 있게 선언해주는 부분 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>result01 페이지</h1>
	<h2>
		${year}년 ${month}월 ${day}일
	</h2>
	<hr>
	<h2>
		<!-- JSP, Spring, Springboot 모두 이런 방식.
			Java에서 일처리하고 저장함.
			로그인은 request 대신 session에 저장하는데, 사용하는 법은 똑같음
			session.getAttribute 등,, 세션은 생명주기가 긴 편이다.(웹브라우저 닫히기 전까지 유지)
			은행에서 시간 지났을 때 자동로그아웃 되는 것 => 세션이 만료되는 것. 
		 -->
		<%=request.getAttribute("year") %>년 
		<%=request.getAttribute("month") %>월
		<%=request.getAttribute("day") %>일
	</h2>
</body>
</html>