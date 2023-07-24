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
	table, th, td {
	    border: 1px solid red; text-align: center;
    }
</style>
<%-- jQuery 라이브러이 CDN --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
   	$("#btn1").on("click", function() {
		$("#tbody").empty();
		$.ajax({
			url:"/MyController",
			dataType:"xml",
			method:"get",
			success: function(data) {
				// console.log(data);
				var tbody="";
				$(data).find("member").each(function() {
					tbody +="<tr>";
					tbody += "<td>"+ $(this).find("idx").text()+"</td>";
					tbody += "<td>"+ $(this).find("m_id").text()+"</td>";
					tbody += "<td>"+ $(this).find("m_pw").text()+"</td>";
					tbody += "<td>"+ $(this).find("m_addr").text()+"</td>";
					tbody += "<td>"+ $(this).find("m_reg").text()+"</td>";
					tbody +="</tr>";
				});
				$("#tbody").append(tbody);
			},
			error:function(){
				
			}
		});
	});
 	$("#btn2").on("click", function() {
		$("#tbody").empty();
		$.ajax({
			url:"/MyController2",
			dataType:"xml",
			method:"get",
			success: function(data) {
				$("#tb").css("background","orange")
				var tbody="";
				$(data).find("member").each(function() {
					tbody +="<tr>";
					tbody +="<td>" + $(this).attr("idx") +"</td>";
					tbody +="<td>" + $(this).attr("m_id") +"</td>";
					tbody +="<td>" + $(this).attr("m_pw") +"</td>";
					tbody +="<td>" + $(this).attr("m_addr") +"</td>";
					tbody +="<td>" + $(this).attr("m_reg") +"</td>";
					tbody +="</tr>";
				});
				$("#tbody").append(tbody);
			
			},
			error:function(){
				
			}
		});
	});
	$("#btn3").on("click", function() {
		$("#tbody").empty();
		$.ajax({
			url:"/MyController3",
			dataType:"xml",
			method:"get",
			success: function(data) {
				$("#tb").css("background","skyblue")
				var tbody="";
				$(data).find("member").each(function() {
					tbody +="<tr>";
					tbody +="<td>" + $(this).attr("idx") +"</td>";
					tbody +="<td>" + $(this).attr("m_id") +"</td>";
					tbody +="<td>" + $(this).attr("m_pw") +"</td>";
					tbody +="<td>" + $(this).text() +"</td>";
					tbody +="<td>" + $(this).attr("m_reg") +"</td>";
					tbody +="</tr>";
				});
				$("#tbody").append(tbody);
			
			},
			error:function(){
				
			}
		});
	});
	$("#btn4").on("click", function() {
		$("#tbody").empty();
		$.ajax({
			url:"/MyController4",
			dataType:"json",
			method:"get",
			success: function(data) {
				$("#tb").css("background","tomato")
				var tbody="";
				$.each(data, function(k,v) {
					tbody +="<tr>";
					tbody +="<td>" + v["idx"] + "</td>";
					tbody +="<td>" + v["m_id"] + "</td>";
					tbody +="<td>" + v["m_pw"] + "</td>";
					tbody +="<td>" + v["m_addr"] + "</td>";
					tbody +="<td>" + v["m_reg"] + "</td>";
					tbody +="</tr>";
				});
				$("#tbody").append(tbody);
			
			},
			error:function(){
				
			}
		});
	});
	$("#btn5").on("click", function() {
		$("#tbody").empty();
		$.ajax({
			url:"/MyController5",
			dataType:"text",
			method:"get",
			success: function(data) {
				$("#tb").css("background","green")
				var tbody="";
			    var rows = data.split("/");
			    	for ( var k in rows) {
				    	tbody +="<tr>";
						var cols = rows[k].split(",");
						for ( var k2 in cols) {
							tbody += "<td>"+cols[k2]+"</td>";
						}
				    	tbody +="</tr>";
					}
				
				$("#tbody").append(tbody);
			},
			error:function(){
				
			}
		});
	});
  });
</script>
</head>
<body>
	<div>
		<button id="btn1">xml 태그 가져오기</button>
		<button id="btn2">xml 태그 가져오기</button>
		<button id="btn3">xml 태그 가져오기</button>
		<button id="btn4">json 태그 가져오기</button>
		<button id="btn5">text 태그 가져오기</button>
	</div>
	<br><br><br>
	<hr>
	<br><br><br>
	<table id="tb">
		<thead>
			<tr>
				<th>번호</th><th>아이디</th><th>패스워드</th><th>주소</th><th>날짜</th>
			</tr>
		</thead>
		<tbody id="tbody"></tbody>
	</table>
</body>
</html>