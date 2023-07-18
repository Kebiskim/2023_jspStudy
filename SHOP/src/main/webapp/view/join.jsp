<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	th{
		text-align: left;
		background-color: lightblue;
	}
</style>
<script type="text/javascript">
	function joinok_go(f) {
		var result = false;
	    if (signUpForm.idx.value.length == 0) {
	    	alert("번호를 입력하세요.");
	    	signUpForm.idx.focus();
	        result = false;
	    } else if (signUpForm.m_id.value.length == 0) {
	    	alert("id를 입력하세요.");
	    	signUpForm.m_id.focus();
	        result = false;
	    } else if (signUpForm.m_pw.value.length == 0) {
	    	alert("비밀번호를 입력하세요.");
	    	signUpForm.m_pw.focus();
	    	result = false;
	    } else if (signUpForm.m_name.value.length == 0) {
	    	alert("이름을 입력하세요.");
	    	signUpForm.m_name.focus();
	    	result = false;
	    } else if (signUpForm.m_age.value.length == 0) {
	    	alert("나이를 입력하세요.");
	    	signUpForm.m_age.focus();
	    	result = false;
	    } else if (signUpForm.m_addr.value.length == 0) {
	    	alert("주소를 입력하세요.");
	    	signUpForm.m_addr.focus();
	    	result = false;
	    } else{
	    	result = true;
			// ★ 아래 부분 오류 났었음!! 지우고 다시 쓰니까 작동함!!
			f.action="/MyController?cmd=joinok";
	    	f.submit();
	    	alert("회원가입 성공!");
	    } 	
	}

	function login_go(f) {
		f.action="/MyController?cmd=login";
		f.submit();
		
		if (a == b){
			
		}
	}
</script>
</head>
<body>
	<fieldset style="border-color: lightblue">
		<legend>회원가입</legend>
		<form method="post" name="signUpForm">
			<table>
				<tbody>
					<tr>
						<th>번호</th>
						<td><input type="text" name="idx"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="m_id"></td>
					</tr>
					
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="m_pw"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="m_name"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="text" name="m_age"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="m_addr"></td>
					</tr>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
					<input type="button" value="회원가입" onclick="joinok_go(this.form)">
					<input type="button" value="로그인" onclick="login_ok(this.form)">
					<input type="reset" value="취소">				
		</form>
	</fieldset>
	
</body>
</html>