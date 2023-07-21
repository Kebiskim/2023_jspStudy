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
			// ajax 는 비동기형 통신방법
			// 실시간으로 바뀌는 옛날의 네이버 실시간 검색순위같은 것을 반영해주는 거임
			$.ajax({
				// 날씨
				// CORS policy 오류 나옴
				url : "https://www.kma.go.kr/XML/weather/sfc_web_map.xml",
				method : "get",
				dataType : "xml",
				success : function(data) {
					var table = "<table>";
					table += "<thead><tr><th>도시</th><th>온도</th><th>날씨</th></tr></thead>";
					table += "<tbody>";
					console.log("테스트");
					// 원하는 태그 검색
					$(data).find("local").each(function() {
						console.log("테스트");
						var city = $(this).text();
						var temp = $(this).attr("ta");
						var weather = $(this).attr("desc");
						
						table += "<tr>";
						table += "<td>" + city + "</td><td>" + temp + "</td><td>" + weather + "</td>";
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
		
		// 두번째
		$("#btn2").on("click", function() {
			$("#out").empty();
			var table = "<table>";
			table += "<thead><tr><th>시·도별(1)</th><th>총인구 (명)</th><th>1차 접종 누계</th><th>2차 접종 누계</th><th>1차 접종 퍼센트</th><th>2차 접종 퍼센트</th></tr><thead>";
			table += "<tbody>";
			// 비동기 통신
			// ajax 는 비동기형 통신방법
			// 실시간으로 바뀌는 옛날의 네이버 실시간 검색순위같은 것을 반영해주는 거임
			$.getJSON("https://raw.githubusercontent.com/paullabkorea/coronaVaccinationStatus/main/data/data.json", function(data) {
				$.each(data, function() {
					table += "<tr>";
					table += "<td>" + this["시·도별(1)"] + "</td>";
					table += "<td>" + this["총인구 (명)"] + "</td>";
					table += "<td>" + this["1차 접종 누계"] + "</td>";
					table += "<td>" + this["2차 접종 누계"] + "</td>";
					table += "<td>" + this["1차 접종 퍼센트"] + "</td>";
					table += "<td>" + this["2차 접종 퍼센트"] + "</td>";
					table += "</tr>";
				});
				table += "</tbody></table>";
				$("#out").append(table);
			});
		});
	});
</script>
</head>
<body>
	<div id="btn">xml 파일 가져오기</div>
	<div id="out"></div>
	<div id="btn2">json 파일 가져오기</div>
</body>
</html>