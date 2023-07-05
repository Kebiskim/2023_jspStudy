<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 아래처럼 잘 나오면 library가 잘 설치된 것! c => core (핵심) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : JSP 표준 태그 라이브러리 (Taglibs)</title>
</head>
<body>
	<%-- 
		1. 라이브러리 다운받아서 해당 프로젝트에 넣기 (tomcat.apache.org)
		2. 다운받은 library를 WEB-INF 안에 lib 폴더안에 넣어주자.
		3. 지시어 중 taglib를 선언하고 정의하자.
			<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<%@ taglib prefix="fmf" uri="http://java.sun.com/jsp/jstl/fmt" %>
			
			- core(코어) 			  : <c:명령어>
			- fmt(국제화 = 숫자, 날짜) : <fmt:명령어>
	 --%>
	 
	<%-- 변수 생성 및 데이터 저장 : 기본이 pageContext에 저장된다. --%>
	<%-- 변수 생성 set : <c:set var="변수명" value="데이터"/> --%>
	<!-- JS에서 변수 생성하는 var와 같음! var에 변수명, value에 값! -->
	<c:set var="str" value="Hello JST!!" />
	
	<%-- 변수 출력(out) : <c:out value="출력할내용 또는 EL표시(변수값출력)"/> --%>
	<%-- 아래처럼 쓰면 그냥 str 값이 나옴. Hello JST를 출력하려면, (실제 value) EL 을 써야 함. --%>
	<c:out value="str"/><br>
	<c:out value="${str}"/><br>
	<!-- 걍 아래처럼 쓰면 된다!! -->
	${str} <br>
	<hr>
	변수 value 삭제 전 : ${str} <br>
	<!-- EL 사용하는 것이 아님.. -->
	<c:remove var="str"/>
	변수 value 삭제 후 : ${str} <br>
	<hr>
	
	<!-- JSTL을 쓰는 이유는, 제어문 때문임!! -->
	<%--
		if문 : else문이 없다. (조건식이 참일 때만 실행)
		<c:if test="조건식(관계연산, 비교연산 -> EL 방식으로 작성"   var="변수" >
			조건식이 참일 때 실행할 내용
		</c:if>
	 --%>
	 <c:if test="${4==3}">
	 	<h2>결과 : Hello JSTL @@</h2>
	 </c:if>

	<!-- avg가 80 이상이면 합격 -->
	<c:set var="avg" value="75"/>
	
	<!-- 아래처럼 쓰는 게 불편해서, choose문 이란 게 나옴 -->
	<c:if test="${avg >= 80}">
		<h2>합격</h2>
	</c:if>
	<c:if test="${avg < 80}">
		<h2>불합격</h2>
	</c:if>
	
</body>
</html>