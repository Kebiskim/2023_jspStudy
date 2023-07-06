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
	function edit_go(f) {
		f.action="/jsp/GuestController?cmd=update";
		f.submit();
	}
	/* cmd는 밑에 못 넣음 (어떤 버튼을 누를지 알 수 없으므로, 독립적으로) */
	function delete_go(f) {
		f.action="/jsp/GuestController?cmd=delete";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h2>방명록 : 내용화면</h2>
		<hr />
		<p>[<a href="/03_guestbook/MyController?cmd=list">목록으로 이동</a>]</p>
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
				<!-- 비밀번호 보여줄 일 없으니 이런식으로 지우자 -->
<!-- 				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td></td>
				</tr> -->
				<tr align="center">
				<!-- pre태그 : 있는그대로 출력하기. -->
					<td colspan="2" style="text-align: left; padding-left: 10px;"><pre>${vo.content}</pre></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<!-- 수정/삭제를 위해서 idx를 넘기자. -->
							<input type="hidden" name="idx" value="">
							<!-- 여기 cmd 있으니까 위에서 다시 안 넣어줘도 됨!! -->
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