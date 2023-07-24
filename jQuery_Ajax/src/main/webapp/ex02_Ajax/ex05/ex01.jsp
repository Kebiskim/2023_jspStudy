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
			// 비동기 통신
			$.ajax({
				url : "data01.xml",
				method : "get",
				dataType : "xml",
				success : function(data) {
					var table = "<table>";
					table += "<thead><tr><th>이름</th><th>가격</th></tr></thead>";
					table += "<tbody>";
					// 원하는 태그 검색 (product 태그에 접근)
					$(data).find("product").each(function() {
						// product 태그 안의 name, price 태그에 써있는 값 가지고 옴
						var name = $(this).find("name").text();
						var price = $(this).find("price").text();
						table += "<tr>";
						table += "<td>" + name + "</td><td>" + price + "</td>";
						table += "</tr>";
					});
					
					table += "</tbody></table>";
					$("#out").append(table);
				},
				error : function() {
					alert("가져오기 실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="btn">xml 파일 가져오기</div>
	<div id="out"></div>
</body>
</html>