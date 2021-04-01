<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	Quiz here
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script
		src="https://apis.google.com/js/client:platform.js?onload=start" async
		defer></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.socket.io/3.1.3/socket.io.min.js"
		integrity="sha384-cPwlPLvBTa3sKAgddT6krw0cJat7egBga3DJepJyrLl4Q9/5WLra3rrnMcyTyOnh"
		crossorigin="anonymous"></script>
	<script>
		const socket = io("http://localhost:8080/");
	</script>
</body>
</html>