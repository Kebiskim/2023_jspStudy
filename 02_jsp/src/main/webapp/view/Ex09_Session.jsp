<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	세션과 쿠키
	세션 : 서버와 클라이언트간의 접속을 유지시켜주기 위한 객체
		  (http는 요청을 하고 응답을 하면 접속이 끊어진다.)
		  client에서 서비스를 요청하면 서버측에서 client에게
		  서비스를 제공하면서 client를 구별할 수 있는 세션 ID를 부여
		  서버측에서 해당 ID로 이전 접속 여부를 구별한다.
	쿠키 : client에서 정보를 저장하는 저장 공간
		  오늘하루만 보기 등
		  
	-- 주요메서드
	데이터 저장 : session.setAttribute("이름", 데이터);
	데이터 호출 : session.getAttribute("이름")
	
	** 해당 속성만 삭제 : session.removeAttribute("이름");
	getID() : 세션 고유 ID 추출
	getCreateTime() : 세션이 생성된 시간을 반환
	invalidate() : 세션 전체 초기화
	setMaxInactiveInterval(시간) : 세션 시간 제한
	
	** 세션의 생명 주기 : 제한 시간을 지정하지 않으면 브라우저가 종료될 때 세션 데이터도 사라진다.
 --%>
	<% Date time = new Date(); %>
 
	<h1>세션 연습</h1>
	<h2>
		<!-- 쿠키에 찍히는 Value와 동일하다!! -->
		<p>세션 ID : <%= session.getId() %></p>
		<p>현재시간 : <%= time %>
		
		<% session.getCreationTime(); %>
		<p>생성된 시간 : <%= time %>
		
		<% time.setTime(session.getLastAccessedTime()); %>
		<p>최근 접근시간 : <%= time %>
	</h2>
	
</body>
</html>