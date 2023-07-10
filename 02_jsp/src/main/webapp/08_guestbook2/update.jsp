<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function save_go(f) {
		
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 수정화면</h2>
		<hr />
		<p>[<a href="/02_jsp/GuestBook2?cmd=list">목록으로 이동</a>]</p>
		
		<!-- 파일 첨부하려면 -->
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="name" value="${vo.name}" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" name="subject" value="${vo.subject}" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="email" value="${vo.email}" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd" size ="20"/></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<c:choose>
						<c:when test="${empty vo.f_name}">
							<td><input type="file" name="f_name"><b>이전 파일 없음</b></td>
								<input type="hidden" name="old_f_name" value="">
						</c:when>
						<c:otherwise>
							<td><input type="file" name="f_name"><b>이전 파일명 (%{vo.f_name})</b></td>
								<input type="hidden" name="old_f_name" value="${vo.f_name}">
						</c:otherwise>
					</c:choose>
					<td><input type="file" name="f_name" size ="20"/></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<textarea rows="10" cols="60" name="content">${vo.content}</textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<!-- 여기 cmd 있으니까 위에서 다시 안 넣어줘도 됨!! -->
							<input type="hidden" value="update_ok" name="cmd">
							<input type="hidden" value="${vo.idx}" name="idx">
							<input type="button" value="저장" onclick="save_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="취소" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>