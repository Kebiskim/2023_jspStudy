<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결과보기</h2>
	<h3>
		<li>올린 사람 : ${name}</li>
		<li>파일 원본이름 : ${f_name}</li>
		<li>파일 저장이름 : ${f_name2}</li>
		<li>파일타입 : ${contentType}</li>
		<li>파일크기 : ${f_size} Byte</li>
		<li>마지막 수정날짜 : ${f_last}</li>
		<li>마지막 수정날짜 : ${f_last2}</li>
		<!-- 가상톰캣을 사용하기 때문에 아래 경로에 들어가도 이미지가 없음!! -->
		<li><img src="upload/${f_name2}"></li>
		<li>다운로드 : <a href="down.jsp?path=upload&f_name=${f_name2}">${f_name2}</a></li> 
	</h3>
</body>
</html>