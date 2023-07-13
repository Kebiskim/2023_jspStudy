<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 주석 처리할 때 <-- 쓰면 안된다!! --%>
	<%-- EL은 최상위경로 BBS (프로젝트)를 뜻함 (${pageContext.request.contextPath}) --%>
	<%-- 메시지 요청된 리소스 [/BBS/view/org.apache.jasper.runtime.PageContextImpl@38b4143b/MyController]은(는) 가용하지 않습니다. --%>
<%-- 	<jsp:forward page="${pageContext}/MyController"> --%>
<%-- 	<jsp:forward page="${pageContext.request.contextPath}/MyController"> --%>

	<%-- 안되면 list랑 index에서 / 앞부분 싹 지워버리기! --%>	
	<%-- 이런 식으로 cPage에 1을 바로 줄 수도 있음 (command에서 조건문 안 하고), 이 내용 주석을 밑으로 내리면 오류!! --%>
	<%-- <jsp:param value="1" name="cPage"/> --%>
	
	<jsp:forward page="/MyController">
		<jsp:param value="list" name="cmd"/>
	</jsp:forward>
</body>
</html>