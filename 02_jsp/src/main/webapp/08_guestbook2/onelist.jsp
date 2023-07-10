<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 600px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px}
	div{width: 600px; margin:auto; text-align: center;}
</style>
<script type="text/javascript">
	function edit_go(f){
		f.action = "/02_jsp/GuestBook2?cmd=update";
		f.submit();
	}
	function delete_go(f){
		f.action = "/02_jsp/GuestBook2?cmd=delete";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 작성화면</h2>
		<hr />
		<p>[<a href="/02_jsp/GuestBook2?cmd=list">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${vo.name}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td>${vo.subject}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td>${vo.email}</td>
				</tr>
				<!-- EL에는 제어문 처리할 수 있는 게 없고, JSTL에만 있음!!4 -->
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<c:choose>
						<c:when test="${empty vo.f_name}">
							<td><b>첨부 파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<td>
							<%-- 다운로드 --%>
								<a href="/02_jsp/DownController?path=upload?f_name=${vo.f_name}">
									<img src="upload/${vo.f_name}" style="width: 80px;">
								</a>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<!-- 비밀번호 보여줄 일 없으니 이런식으로 지우자 -->
<!-- 				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td></td>
				</tr> -->
				<tr align="center">
				<!-- pre태그 : 있는그대로 출력하기. -->
					<td colspan="2">
						<pre style="padding-left: 15px">${vo.content}</pre>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="idx" value="${vo.idx}">
							<input type="button" value="수정" onclick="edit_go(this.form)"/>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="delete_go(this.form)"/>								
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>