<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		margin: 20px auto;
		width: 500px;
		border: 1px solid gray;
		padding: 20px;	
	}
	input{
		padding: 10px;	
		margin: 10px;
	}
</style>
<script type="text/javascript">
	function login_go(f) {
		// 유효성 검사
		f.action="/MyController?cmd=loginok";
		f.submit();
	}
	
	// 일반 함수는 호출되었을 때, 호출한 대상에 바인딩된다.

	//아래 코드를 통해 this 가 각각 어디를 바라보고 있는지 알 수 있다.

	// 앞에 f. 를 붙여서 호출하면 this 가 func() 함수를 가리키고 있다.

	// 하지만 다른 변수에 할당한 다음에 아무것도 붙이지 않고 호출하면 this 는 전역객체를 참조한다. (브라우저에서는 window)
	
	function join_go(f) {
		f.action="/MyController?cmd=join";
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="top.jsp" />
	<div id="mydiv">
		<form method="post">
			<table>
				<thead>
					<th colspan="2"><h2>Login</h2></th>
				</thead>
				<tbody>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="m_id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="m_pw"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr style="text-align: center;">
						<td colspan="2">
							<input type="button" value="로그인" onclick="login_go(this.form)">
							<input type="button" value="회원가입" onclick="join_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>