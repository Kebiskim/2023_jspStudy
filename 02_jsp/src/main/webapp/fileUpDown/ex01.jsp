<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send_go(f){
		f.action="/02_jsp/FileUpController?cmd=fileup";
		f.submit();
	}
</script>
</head>
<body>
<%--
	1. http://www.servlets.com/ => library 다운로드
		COS File Upload Library => cos-22.05.zip download"C:/Users/user/Downloads/cos-22.05/lib/cos.jar"
		WEB-INF 안에 lib 폴더 안에 넣어주자.
	2. 업로드 시 반드시 <form method="post" enctype="multipart/form-data"> 반드시 설정
	3. 이클립스에서 실행해서 파일을 업로드하면 실제 파일은 가상 톰캣에 저장된다.
	   실제 톰캣에 올리면 원하는 위치에 파일을 저장할 수 있다.
	
	** 만약에 파라미터를 사용하려면 hidden을 사용할 수 없다!
 --%>
 <!-- get방식으로는 이미지 업로드 안된다!! enctype도 반드시 아래처럼 설정!! -->
 <form method="post" enctype="multipart/form-data"></form>
 	<p>올린 사람 : <input type="text" name="name"></p>
 	<p>첨부 파일 : <input type="file" name="f_name"></p>
 	<input type="button" value="업로드" onclick="send_go(this.form)">
 	<!-- <input type="hidden" name="cmd" value="fileup"> -->
</body>
</html>