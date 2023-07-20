<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn").on("click", function() {
			$("#box").animate(
				{width: "400px"},
				{duration: 4000, 
					step: function(x) {
						$("#txt").text(Math.round(x * 100/400) + "%");		
					}
				}
			);
		});
	});
</script>
</head>
<body>
	<div>
		<button id="btn">시작</button>
		<div style="border: 1px solid green; margin: 10px; width: 400px;">
			<div id="box" style="background-color: orange; height: 15px; width: 0px;"></div>
		</div>
		<p id="txt"></p>
	</div>
</body>
</html>