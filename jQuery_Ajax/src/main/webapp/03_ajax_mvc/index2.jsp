<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 800px; margin-top: 50px; border-collapse: collapse;
	}
	table, td, th{
		border: 2px solid pink; text-align: center;
	}
	#out{
		width: 800px;
		text-align: center;
		margin: auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn1").on("click", function() {
			$("#out").empty();
			$.ajax({
				url: "/MyController6",
				dataType: "xml",
				type: "get",
				// data는 가지고 가는 파라미터!!, dataType은 가지고 오는 data의 타입 
				success: function(data) {
					// 콘솔 찍어서 xml 정보 제대로 찍히는지 먼저 확인!
					// ★ controller랑 여기서 console까지 찍어보고, 그리고 나서 파싱 하는 것이 순서!!
					console.log(data);
					var table = "<table>";
					table += "<thead><tr><th>지역</th><th>온도</th><th>상태</th><th>아이콘</th></tr></thead>";
					table += "<tbody>";
					$(data).find("local").each(function() {
						table += "<tr>";
						table += "<td>" + $(this).text() + "</td>";
						table += "<td>" + $(this).attr("ta") + "</td>";
						table += "<td>" + $(this).attr("desc") + "</td>";
						// icon 번호를 주면, 실제 아이콘 그림이 나옴.
						table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB" + $(this).attr("icon") + ".png'></td>";
						table += "</tr>";
					});
					table += "</tbody></table>";
					$("#out").append(table);
				},
				error: function() {
					alert("읽기 실패");
				}
			});
		});
		
		
		
/* 		// js를 활용한 천단위 콤마
			정규식  (예)
			const ori_val = 12345.6789;
			const changed_val = ori_val.toString().replace(/\B(?<!.\d*)(?=(\d{3})+(?!\d))/g, ",");
			toLocaleString
			toLocaleString()
			toLocaleString(locales)
			toLocaleString(locales, options) */
		
		$("#btn2").on("click", function() {
			$("#out").empty();
			$.ajax({
				url: "/MyController7",
				dataType: "json",
				type: "get",
				// data는 가지고 가는 파라미터!!, dataType은 가지고 오는 data의 타입 
				success: function(data) {
					// 콘솔 찍어서 xml 정보 제대로 찍히는지 먼저 확인!
					// ★ controller랑 여기서 console까지 찍어보고, 그리고 나서 파싱 하는 것이 순서!!
					console.log(data);
					var table = "<table>";
					table += "<thead><tr><th>시·도별(1)</th><th>총인구 (명)</th><th>1차 접종 누계</th><th>1차 접종 퍼센트</th><th>2차 접종 누계</th><th>2차 접종 퍼센트</th></tr></thead>";
					table += "<tbody>";
					$.each(data, function(k, v) {
						table += "<tr>";
						table += "<td>" + v["시·도별(1)"] + "</td>";
						table += "<td>" + v["총인구 (명)"].toLocaleString() + "</td>";
						table += "<td>" + v["1차 접종 누계"].toLocaleString() + "</td>";
						table += "<td>" + v["1차 접종 퍼센트"].toLocaleString("ko_KR"), {maximumFractionDigits(tes: 2) + "% </td>";
						table += "<td>" + v["2차 접종 누계"].toLocaleString() + "</td>";
						table += "<td>" + v["2차 접종 퍼센트"].toLocaleString() + "% </td>";
						table += "</tr>";
					});
					
					table += "</tbody></table>";
					$("#out").append(table);
				},
				error: function() {
					alert("읽기 실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<div style="width: 800px; margin: auto"> 
		<button id="btn1">xml 정보 가져오기</button>
		<button id="btn2">json 정보 가져오기</button>
	</div>
	<br><br><br>
	<div id="out"></div>
</body>
</html>