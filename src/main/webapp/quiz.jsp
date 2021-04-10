<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#console {
	width: 500px;
	height: 500px;
	background: gray;
	color: white;
}
</style>
</head>
<body>
	Quiz here http://krzysztofjelonek.net/czat-z-socket-io-i-java/
	<div id="console"></div>
	<button id="send" onclick="a()">Send message</button>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://localhost:8080/socket.io/socket.io.js"></script>
	<script type="text/javascript">
		var socket = io();
		const a = () =>{
			socket.emit("hello")			
		}
	</script>

</body>
</html>