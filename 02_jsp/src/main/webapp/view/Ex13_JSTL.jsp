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
	<hr>
	
	<%--
		if문은 else가 없어서 불편할 때가 있다.
		이것을 대신하는 것이 choose문이다.
		switch문과 비슷하다.
	 --%>
	 
	<%--
	<c:choose>
		<c:when test="조건식(관계연산,비교연산) => EL 방식으로 작성">참일때 실행</c:when>
		<c:when test="조건식(관계연산,비교연산) => EL 방식으로 작성">참일때 실행</c:when>
		<c:when test="조건식(관계연산,비교연산) => EL 방식으로 작성">참일때 실행</c:when>
		<c:when test="조건식(관계연산,비교연산) => EL 방식으로 작성">참일때 실행</c:when>
		<c:otherwise>
			나머지 (위 조건이 아닐때) 실행
		</c:otherwise>
	</c:choose>
	 --%>
	 
	 <%--
	 	avg2의 점수가 90점 이상이면 A학점, 80 이상이면 B학점, 70 이상이면 C학점
	 	나머지 F학점
	  --%>	 
	  <c:set var="avg2" value="85"/>
	  <h3>
	  <c:choose>
	  	<c:when test="${avg2 >= 90}">A학점</c:when>
	  	<c:when test="${avg2 >= 80}">B학점</c:when>
	  	<c:when test="${avg2 >= 70}">C학점</c:when>
	  	<c:otherwise>
	  		F학점
	  	</c:otherwise>
	  </c:choose>
	  </h3>
	  <hr>
	  <%--
	  		for문
	  		1. 일반적인 for문
	  			<c:forEach begin="시작값" end="끝값" step="증가/감소단계" 
					var="변수이름" varStatus="변수상태값(index값)">
						반복 내용 ${변수이름}
				</c:forEach>
				
			2. 개선된 for문
			<c:forEach var="변수이름" items="${배열 또는 컬렉션}" varStatus="변수상태값(index값)">
				반복 내용 ${변수이름}
			</c:forEach>
	   --%>
	   <!-- forTokens는 split처럼 단락을 쪼개는 역할 -->
<%-- 	   <c:forEach begin="" end="" step="" var="" varStatus="">
	   
	   </c:forEach>
	   <c:forEach var="" items="" varStatus="">
	   
	   </c:forEach> --%>
	   
	   <h2>0-10까지 출력</h2>
	   <c:forEach begin="0" end="20" step="1" var="k" varStatus="vs">
	   		${k} &nbsp;&nbsp;&nbsp; ${vs.index} &nbsp;&nbsp;&nbsp; ${vs.count} &nbsp;&nbsp;&nbsp;
	   		${vs.first} &nbsp;&nbsp;&nbsp; ${vs.last}  &nbsp;&nbsp;&nbsp; <br>
	   		<hr>
	   </c:forEach>
	   
	   <h2>0-10까지 짝수만 출력</h2>
	   <c:forEach begin="0" end="20" step="2" var="k" varStatus="vs">
	   		${k} &nbsp;&nbsp;&nbsp; ${vs.index} &nbsp;&nbsp;&nbsp;
	   		<hr>
	   </c:forEach>
	   
	   <h2>0-10까지 짝수만 출력</h2>
	   <c:forEach begin="0" end="20" step="1" var="k">
			<c:if test="${k%2 == 0}">
				${k} &nbsp;&nbsp;&nbsp;
			</c:if>
	   </c:forEach>
	   
	   <%-- 개선된 for문을 위해서 배열 생성 --%>
	   <!-- comma가 들어가면 자동으로 배열이 됨 (아래처럼) -->
	   <c:set var="arr_1" value="홍길동, 장길산, 임꺽정, 일지매"/>
	   <c:forEach var="k" items="${arr_1}">
	   		<h3>${k}님</h3>
	   </c:forEach>
	   ${arr_1}
	   <hr>
	   
	   <%-- 
			반복해서 나누기   
		   <c:forTokens items="${배열 | 컬렉션}" delims="구분자" var="변수명"></c:forTokens>
	    --%>
	   
	   <c:set var="arr_2" value="홍길동, 장길산/임꺽정, 일지매/, 둘리, 희동이, 고길동"/>
	   <!-- ,/ 으로 쓰면 or 개념	 -->
	   <c:forTokens items="${arr_2}" delims=",/" var="k">
	   		<h3>${k}님</h3>
	   </c:forTokens>
	   <hr>

	   
</body>
</html>