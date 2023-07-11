<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- EL은 최상위경로 BBS (프로젝트)를 뜻함 (${pageContext.request.contextPath}) -->
	<!-- 메시지 요청된 리소스 [/BBS/view/org.apache.jasper.runtime.PageContextImpl@38b4143b/MyController]은(는) 가용하지 않습니다.
	 -->
<%-- 	<jsp:forward page="${pageContext}/MyController"> --%>
<%-- 	<jsp:forward page="${pageContext.request.contextPath}/MyController"> --%>
	<!-- 안되면 list랑 index에서 / 앞부분 싹 지워버리기! -->
	<jsp:forward page="/MyController">
		<jsp:param value="list" name="cmd"/>
	</jsp:forward>
</body>
</html>