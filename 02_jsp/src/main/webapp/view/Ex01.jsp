<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<%@ include %>
<%@ page %>
<%@ taglib %>
JSP의 지시어는 위 세개뿐!!
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 설명</title>
</head>
<body>
<!-- html 주석 : 소스 보기에서 보인다. -->
<%-- jsp 주석 : 소스보기에서 보이지 않는다. --%>
<%-- 
	JSP : Java Server Page
		  HTML 안에서 자바코드를 사용할 수 있도록 만든 스크립트 언어(행 단위 번역실행)
		  전체 페이지를 한번에 읽는 것이 아님!!
		  JS 기반의 스크립트 언어가 5~10년 전부터 대세가 되기 시작 (NodeJS는 서버 기반, 웹서버 만들때 사용하기도 함)	
	JSP : 구성
		  1. 지시어 (디렉티브) : <%@ 지시어 %>
		  2. 스크립트요소 : HTML안에서 실제 자바 코드를 사용할 수 있도록 만드는 요소
		     1) 선언부(<%! 내용 %>) 	 : 변수선언이나 메서드 선언할 때 사용
		     2) 스크립트릿(<% 자바코드 %>) : 자바코드를 코딩할 때 사용 
		     3) 표현식(<% %>)			 : 변수값이나 메서드의 결과 등 저장되어 있는 결과값 출력
		       ** 현재는 표현식 대신 표현언어(EL과 JSTL을 사용한다.)
		     
		  ** 주의사항 : 선언부, 스크립트릿, 표현식을 겹쳐서(포함해서) 사용할 수 없다 => 가독성이 떨어짐!!
		  
		  1. 지시어
		 	1) page 지시어 : 보통 해당 문서의 맨 앞에 나온다.
		     				현재 페이지에 대한 정보를 제공
		     				톰캣이 해당 page 지시어를 보고, 해당 페이지를 어떻게 해석하고 실행하는지를 판단(보통은 그대로 사용한다.)
		       page 지시어의 속성들
		       - language : 스크립트 코드에서 사용하는 언어 지정 (java)
		       - ** contentType : 해당 문서의 타입과 문자셋(UTF8 문자표 등등) 지정 (캐릭터 인코딩)
		       	 -- 인코딩(부호화, 암호화) : 정보의 형태를 변환
		       	 -- 디코딩(복호화)		 : 변환된 정보를 원래 형태로 되돌리는 것
		       - pageEncoding : 해당 페이지를 utf-8 형태로 변환해서 처리하겠다는 뜻
		       - session : 세션(저장공간)을 사용하는지 여부 (기본 : true) => 로그인할 때는 세션 공간에 저장. (로그인 성공 or 실패여부 or 닉네임을 저장함)
		       				request, response도 마찬가지로 저장공간을 뜻함!!
		       - buffer(버퍼, 임시기억) : 출력에 사용되는 임시 저장 공간 버퍼(기본 : 8Kb가 기본적으로 지정되어 있음)
		       - autoFlush : 출력버퍼가 다 차지 않아도 바로 출력 시켜줌 (기본 : true)
		       - errorPage : 해당 페이지가 에러를 발생시켰을 때 처리하는 오류 페이지 지정
		       - isErrorPage : 해당 페이지가 오류를 처리할 수 있는 페이지이면 true, 아니면 false (기본적으로는 안 쓴다. 기본값 : false)
		        
		    2) taglib 지시어 : 해당 페이지에서 사용할 태그 library 지정
		    				 나중에 JSTL (JavaServer Pages Standard Tag Library?) 사용할 때 필요
		    3) include 지시어 : HTML의 iframe과 비슷하다.
		    				  현재 페이지에서 특정 영역에 다른 페이지를 포함시킬 때 사용
		    	** include는 지시어를 사용하는 방법과 include Action Tag를 사용하는 방법 두가지다. 
 --%>
</body>
</html>