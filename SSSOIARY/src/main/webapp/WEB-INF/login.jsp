<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/favicon.png">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<title>SSOIARY</title>
</head>
<body>

<div class="container">
	<div>
		<form action="/login" method="post">
			<span> NAME </span><br>
			<input autocomplete="off" name="username" type="text" style="width:300px; height:50px;"><br><br>
			<span> PASSWORD </span><br>
			<input name="password" type="password" style="width:300px; height:50px;"><br>
			<input type="submit" value="Log in">
		</form>
	</div>
</div>
</body>
</html>