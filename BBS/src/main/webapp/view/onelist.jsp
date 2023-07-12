<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- write.jsp를 복사해서 만든 onelist.jsp -->
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	
	fieldset{
		width: 580px;
	}
	input{
		padding: 10px;
	}
</style>
<script type="text/javascript">
	function list_go(f){
		f.action="/MyController?cmd=list";
		f.submit();
	}
	function update_go(f){
		f.action="/MyController?cmd=update";
		f.submit();
	}
	function delete_go(f){
		f.action="/MyController?cmd=delete";
		f.submit();
	}
</script>
</head>
<body>
	<div id="bbs">
	<!-- form에서 enctype 안 지우면 안됨!! -->
	<form method="post">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${bvo.subject}</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${bvo.writer}</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>${bvo.content}</td>
				</tr>
				<tr>
					<!-- 첨부파일은 있을 수도, 없을 수도 => if문으로 나눈다!! -->
					<th>첨부파일:</th>
					<c:choose>
						<c:when test="${empty bvo.f_name}">
							<td><b>첨부 파일 없음</b></td>
						</c:when>
						<c:otherwise>
							<!-- MyController 같이 못씀! 별도로 해주자 -->
							<td><a href="/DownController?path=upload&f_name=${bvo.f_name}" target="_blank"><img src="upload/${bvo.f_name}" style="80px"></a></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" value="${bvo.b_idx}" name="b_idx">
						<input type="button" value="수정" onclick="update_go(this.form)"/>
						<input type="reset" value="삭제"  onclick="delete_go(this.form)"/>
						<input type="button" value="목록" onclick="list_go(this.form)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<%-- 댓글 처리 --%>
	<div style="padding:50px; width: 580px; margin: auto;">
		<form method="post">
			<fieldset>
				<p>이름 : <input type="text" name=""></p>
				<p>내용 : <br>
					<textarea rows="4" cols="40" name=""></textarea>
				</p>
				<input type="button" value="댓글저장" onclick="comment_go(this.form)">
				<input type="hidden" name="b_idx" value="${bvo.b_idx}">
			</fieldset>
		</form>
	</div>
	<br><br><br>
	<div style="display: table;">
		<!-- 상세보기 가면 나에 딸린 댓글도 나와야 함. 원글에 해당하는 댓글들을 끌고 와야한다 -->
		<c:forEach var="k" items="${c_list}">	
			<!-- 서버에 들어가는 것들은 기본적으로 form 태그임. (submit 등) -->
			<div style="border: 1px solid #cc00cc; width: 400px; margin: 20px; padding: 20px;">
				<form method="post">
					<p>이름 : ${k.writer}</p>
					<p>내용 : ${k.content}</p>
					<p>날짜 : ${k.write_date.substring(0,10)}</p>
					<%-- 로그인 성공해야만 삭제버튼이 보이도록 처리해야 한다. --%>
					<input type="button" value="댓글삭제" onclick="comment_del(this.form)">
				</form>
		</c:forEach>
	</div>
</body>
</html>