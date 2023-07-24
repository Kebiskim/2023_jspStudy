<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    span { width: 150px; color: red;}
    input{border:1px solid red;}
    table{width: 80%; margin: 0 auto;}
    table,th,td {border: 1px solid gray; text-align: center;}
    h2{text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 실행하자마자 DB 정보 가져오기
		function getList(){
			// emtpy 부분 때문에 insert 한 후에 깜빡이는것!!
			// $("#tbody").empty();
			$.ajax({
				url: "/MyController8",
				dataType: "xml",
				type: "get",
				success: function(data) {
					console.log(data);
					
					var tbody ="";
					$(data).find("member").each(function() {
						tbody += "<tr>";
						tbody += "<td>" + $(this).find("idx").text() + "</td>";
						tbody += "<td>" + $(this).find("id").text() + "</td>";
						tbody += "<td>" + $(this).find("pw").text() + "</td>";
						tbody += "<td>" + $(this).find("name").text() + "</td>";
						tbody += "<td>" + $(this).find("age").text() + "</td>";
						tbody += "<td>" + $(this).find("reg").text() + "</td>";
						tbody += "<td><input type='button' value='삭제' class='del' name='" + $(this).find("idx").text() + "'></td>";
						tbody += "</tr>";
					});
					$("#tbody").append(tbody);
				},
				error: function() {
					alert("읽기 실패");
				}
			});
		}
		
		// 삭제 (del을 눌렀을 때)
		$("table").on("click", ".del", function() {
			// alert($(this).attr("name"));
			// 파라미터를 보내야 한다. (data) dataType과 다름!!
			$.ajax({
				// Controller 여러개 만들지 않고, cmd값을 줘서 하나만 만들어도 할 수 있음!!
				url: "/MyController9",
				// dataType : text
				dataType: "text",
				type: "get",
				// 같이 딸려갈 parameter 값
				data: "m_idx=" + $(this).attr("name"),
				success: function(data) {
					if(data==0){
						alert("삭제 실패");
					}else{
						alert("삭제 성공");
						$("#tbody").empty();
						getList();
					}
				},
				error: function() {
					alert("읽기 실패");
				}
			});
		});
		
		$("#m_id").keyup(function() {
			$.ajax({
				url: "/MyController10",
				dataType: "text",
				method: "get",
				// 비동기는 우선순위가 없음 (보낸 순서대로 오지 않을 수도 있음)
				data: "m_id=" + $("#m_id").val(),
				// async : false 하면 비동기 안하고, 순서대로 하겠다는 뜻!
				async: false,
				// data가 매개변수로 안 들어가서 data not defined 에러!
				success: function(data) {
					if(data == 1){
						console.log("사용 불가");
						$("span").text("사용 불가");
						$("#btn").atrr("disabled", "disabled");
					}else{
						console.log("사용 가능");
						$("span").text("사용 가능");
						$("#btn").removeAttr("disabled");
					}
				},
				error: function() {
					alert("입력된 id 읽기 실패");
				}
			});
		});
		
		// 회원가입
		// form을 이용해서 데이터를 전달할 때는 직렬화(serialize())를 해야 한다.
		// form 요소만 가능
		$("#btn").on("click", function() {
			var param = $("#myform").serialize();
			$.ajax({
				url: "/MyController11",
				dataType: "text",
				method: "get",
				data: param,
				// data가 매개변수로 안 들어가서 data not defined 에러!
				success: function(data) {
					if(data == 0){
						alert("가입 실패");
					}else{
						alert("가입 성공");
						$("#tbody").empty();
						getList();
					}
				},
				error: function() {
					alert("회원가입 실패");
				}
			});
			
		});
		
		// 새로고침 및 처음 띄울 때 refresh
		getList();
	});
</script>
</head>
<body>
<h2> 회원 정보 입력하기 </h2>
    <form name="myform" method="post" id="myform" >
        <table>
            <thead>
                <tr>
                    <th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="text" size="14" name="m_id" id="m_id" /><br><span>중복여부</span>
                    </td>
                    <td> <input type="password" size="8" name="m_pw" /></td>
                    <td> <input type="text" size="14" name="m_name" /></td>
                    <td> <input type="number" size="25" name="m_age" /></td>
                </tr>
            </tbody>
            <tfoot>
                <tr><td colspan="7" align="center"><button id="btn" disabled>가입하기</button></td></tr>
            </tfoot>
        </table>
    </form>
    <br /> <br /> <br />
    <h2> 회원 정보 보기 </h2>
    <div>
        <table id="list">
            <thead>
                <tr>
                    <th>번호</th><th>아이디</th><th>패스워드</th><th>이름</th><th>나이</th><th>날짜</th><th>삭제</th>
                </tr>
            </thead>
            <tbody id="tbody"></tbody>
        </table>
    </div>
</body>
</html>