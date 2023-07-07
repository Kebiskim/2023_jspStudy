<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	/* list로 보내기 (이동하기) 함수 */
	/* ★ 시작은 index에서!! */
	/* function list_go(){
		location.href="/jsp/GuestController?cmd=list";
	} */
</script>
</head>
<body>
	<!-- <button onclick="list_go()"></button> -->
	<!-- jsp: 에는 리다이렉트가 없고, 포워드만 있음. c:에는 있음!! -->
	<jsp:forward page="/GuestbookController">
		<jsp:param value="list" name="cmd"/>
	</jsp:forward>
</body>
</html>