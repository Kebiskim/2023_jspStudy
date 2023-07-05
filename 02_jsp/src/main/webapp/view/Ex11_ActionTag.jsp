<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그</title>
<style type="text/css">
	body{
		background-color: pink;
	}
	h2{
		background-color: red;
	}
</style>
</head>
<body>
<%--
	액션태그 : JSP 페이지간의 흐름 제어, 자바빈즈 컴포넌트 지원, ...
	사용법 : <jsp : 액션태그>
	예)
		<jsp:include page="include할 파일"></jsp:include>
		<jsp:forward page="forward할 파일"></jsp:forward>
		
	  1. include : 현재 페이지에서 다른 페이지를 호출 또는
	  				다른 페이지의 결과를 현재 페이지에서 보여주는 것
	  	- 1. include 지시어 : <%@ include file="가지고올 페이지" %>
	  	  다른 페이지 소스 전체를 가져와서 현재 페이지에서 한번에 처리
	  	  파라미터값을 전달할 수 없다.
	  	  잘 변경되지 않는 **정적인** 페이지에 많이 사용된다.
	  	  
	  	  - include 액션태그 : <jsp:include page="가져올 페이지"></jsp:include>
	  	    제어권을 해당 페이지에 넘겨서 일처리를 한 후 결과만 가져온다.
	  	    파라미터값을 전달할 수 있다. (param 액션 태그를 사용)
	  	    자주 변경되는 **동적인** 페이지에 많이 사용된다.
	  	      
		 	파라미터가 있을 때는 아래처럼 쓴다!
		 	<jsp:include page="">
		 		<jsp:param value="" name=""/>
		 	</jsp:include>
		 	
		 	액션태그는 소스를 가져오는 것이 아니라, 일처리한 결과만 가지고 옴 (a.jsp에서 하다가 b.jsp 넘어가서 일처리 하다가 다시 a로 넘어옴)
		 	디렉티브는 소스를 가져와서 하나의 페이지로 처리한다. (b.jsp 코드를 a.jsp 안에 포함시켜 버림) * 이미지 참고!!
 --%>
	<h2>include 액션 사용하기</h2>
	<%-- <%@ include file="Ex04_Request.jsp" %> --%>
	<!-- 닫는 태그 아래처럼 사용해도 된다. -->
	<jsp:include page="Ex04_Request.jsp"/>
</body>
</html>