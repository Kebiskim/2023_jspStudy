<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>★ JSON 데이터 처리</title>
</head>
<body>
	<script type="text/javascript">
		var request = new XMLHttpRequest();
		// false는?
		request.open("POST", "data04.js", false);
		
		request.onreadystatechange = function() {
			// readyState == 4 뜻??
			if(request.readyState == 4 && request.status == 200){
				// json 읽기
				// eval(내용) => 내용을 JS 형태로 변경
				//				내용을 JS 코드로 인식하게 하는 함수
				var data = eval("(" + request.responseText + ")");
				console.log(data);
				var output = "";
				for (var i = 0; i < data.length; i++) {
					for (var k in data[i]) {
						document.body.innerHTML += data[i][k] + "&nbsp;&nbsp";
					}
					document.body.innerHTML += "<br>";
				}
			}
		}
		
		request.send();
	</script>
</body>
</html>