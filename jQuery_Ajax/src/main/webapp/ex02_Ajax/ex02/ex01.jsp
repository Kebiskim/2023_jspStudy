<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xml 데이터 처리</title>
</head>
<body>
	<script type="text/javascript">
		var request = new XMLHttpRequest();
		request.open("POST", "data01.xml", false);
		
		request.onreadystatechange = function() {
			if(request.readyState == 4 && request.status == 200){
				// xml 태그 열기
				// 텍스트 가져오기
				var data = request.responseXML;
					
				// data에 있는 정보중 태그 요소만 가져오기
				var names = data.getElementsByTagName("name");
				var prices = data.getElementsByTagName("price");
				
				for (var i = 0; i < names.length; i++) {
					// 텍스트만 추출 : childNodes[0].nodeValue
					var name = names[i].childNodes[0].nodeValue;
					var price = prices[i].childNodes[0].nodeValue;
					// += 대신 = 쓰면 누적 안되고, 마지막거만 나옴.
					document.body.innerHTML +=
						"<h3><li>" + name + " : " + price + "</li></h2>"
				}
			}
		}
		
		request.send();
	</script>
</body>
</html>