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
		border: 1px solid green; text-align: center;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 여기 ) 빠졌었음
		$("#btn").on("click", function() {
			// 클릭을 하면 계속 추가되는 현상을 방지 => 초기화
			// 비워주세요 란 뜻 (empty)
			$("#out").empty();
			var table = "<table>";
			table += "<thead><tr><th>이름</th><th>가격</th></tr></thead>";
			table += "<tbody>";
			
			console.log("하이");
			
			// jQuery에서 (xml, html, txt)를 가져오는 메서드 : .get()
			// jQuery에서 (json)을 가져오는 메서드 : .getJSON()
			// $가 붙으면 jQuery임.
			$.get("data01.xml", function(data) {
				// console.log(data);
				// 태그 찾는 방법 : js 	   => getElementsByTagName("태그이름");
				//				jQuery => find("태그이름")
				
				// 반복문 : js => for문, forin문
				// 		  jQuery => each()
				
				// 받아온 data에서 product 태그를 찾아라
				// 여러개이므로, 반복문을 실행하자!
				$(data).find("product").each(function() {
					// for문에서의 i 대신 JS에서는 $(this) 사용!
					// 아래처럼 .text()는 get의 의미. 그 안에 글자 넣으면 set의 의미.
					var name = $(this).find("name").text();
					var price = $(this).find("price").text();
					table += "<tr>";
					table += "<td>" + name + "</td>";
					table += "<td>" + price + "</td>";
					table += "</tr>";
				});
			// for문 끝나자마자 밑에서 붙여야 함!
			table += "</tbody></table>";
			$("#out").append(table);
			});			
		});
		console.log("오류 없다!");
	});
</script>
</head>
<body>
	<div id="btn">가져오기</div>
	<div id="out"></div>
</body>
</html>