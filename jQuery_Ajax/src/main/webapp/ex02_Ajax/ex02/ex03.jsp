<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var request = new XMLHttpRequest();
		// false는?
		request.open("POST", "data03.xml", false);
		
		request.onreadystatechange = function() {
			// readyState == 4 뜻??
			if(request.readyState == 4 && request.status == 200){
				var data = request.responseXML;
				
				var product = data.getElementsByTagName("product");
				
				for (var i = 0; i < product.length; i++) {
					var name = product[i].attributes[0].value
					var count = product[i].attributes[1].value
					var content = product[i].childNodes[0].nodeValue;
					
					document.body.innerHTML +=
						"<h3><li>" + name + " : " +  count + " : " + content + "</li></h3>";
				/* 	document.body.innerHTML +=
						"<h3><li>" + name + " : " +  count + " : " + "</li></h3>"; */
				}
			}
		}
		
		request.send();
	</script>
</body>
</html>