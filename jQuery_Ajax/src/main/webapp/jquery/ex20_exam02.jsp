<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	// prop() : 지정한 선택자를 가진 첫번째 요소의 속성 값을 가져오거나 추가한다.
	$(document).ready(function(){
		$(".check-all").on("click", function() {
			$(".ab").prop('checked', this.checked);
		});
	});	
</script>
</head>
<body>
	<h2>체크박스 전체 선택/전체해제</h2>
	<form>
		<!-- label은 보통 체크박스의 뒤에 붙는다. -->
		<p><input type="checkbox" name="all" class="check-all" id="all">
			<label for="all">Check All</label></p>
		<hr>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 1</label></p>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 2</label></p>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 3</label></p>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 4</label></p>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 5</label></p>
		<p><input type="checkbox" name="cb1" class="ab"><label>Check 6</label></p>
	</form>
</body>
</html>