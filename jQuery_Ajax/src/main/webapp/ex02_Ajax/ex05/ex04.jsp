<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 600px; margin-top: 50px; border-collapse: collapse;
	}
	table, th, td{
		border: 1px solid red; text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn").on("click", function() {
			$("#out").empty();
			var table = "<table>";
			table += "<thead><tr><th>이름</th><th>범위</th></th></tr><thead>";
			table += "<tbody>";
			
			$.getJSON("data04.json", function(data) {
				$.each(data, function() {
					table += "<tr>";
					table += "<td>" + this["name"] + "</td>";
					table += "<td>" + this["score"] + "</td>";
					table += "</tr>";
				});
				table += "</tbody></table>";
				$("#out").append(table);
			});
		});
			console.log("오류 없음");
	});
</script>
</head>
<body>
	<div id="btn">xml 파일 가져오기</div>
	<div id="out"></div>
</body>
</html>