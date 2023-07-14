<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<script type="text/javascript">
	function delete_ok(f){
		var pwd = "${bvo.pwd}";
		if(f.pwd.value == pwd){
			var chk = confirm("정말 삭제할까요?");
			if(chk){
				// 맞음! 페이지 넘겨주기.
				f.action="/MyController?cmd=delete_ok&b_idx=${bvo.b_idx}&cPage=${cPage}";
				f.submit();
			}else{
				history.go(-1);
			}
		}else{
			alert("비밀번호가 틀립니다.");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
		<%-- 여기 두번 쓴듯??
		f.action="/MyController?cmd=delete_ok";
		f.submit();
		--%> 
	}
	
	function list_go(f){
		f.action="/MyController?cmd=list";
		f.submit();
	}
</script>
</head>
<body>
	<div id="bbs">
	<!-- encType은 첨부파일 메뉴가 있으면 꼭 넣어줘야 하는 부분!! -->
	<!-- post, multipart 하면 hidden 못씀!! -->
	<!-- form 에 감싸져 있어서 밑에 cPage는 날아가고 있음!! (multipart라 하더라도)??? -->
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 삭제하기">
			<caption>게시판 삭제</caption>
			<tbody>
				<tr>
					<th style="width: 40%" class="title">비밀번호 확인:</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<%-- bvo.b_idx 해야 오류 안남 --%>
						<%-- org.apache.ibatis.exceptions.PersistenceException: 
						### Error updating database.  Cause: org.apache.ibatis.type.TypeException: 
						Could not set parameters for mapping: ParameterMapping{property='b_idx', mode=IN, 
						javaType=class java.lang.String, jdbcType=null, numericScale=null, resultMapId='null', 
						jdbcTypeName='null', expression='null'}. Cause: org.apache.ibatis.type.TypeException: 
						Error setting null for parameter #1 with JdbcType OTHER . Try setting a different 
						JdbcType for this parameter or a different jdbcTypeForNull 
						configuration property. Cause: java.sql.SQLException: ORA-17004: 열 유형이 부적합합니다.: 1111 --%>
						<input type="hidden" name="b_idx" value="${bvo.b_idx}">
						<input type="hidden" name="cPage" value="${cPage}">
						<input type="button" value="삭제" onclick="delete_ok(this.form)"/>
						<input type="button" value="목록" onclick="list_go(this.form)"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

