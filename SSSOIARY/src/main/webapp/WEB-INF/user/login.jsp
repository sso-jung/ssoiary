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

<section class="container">
    <form action="/user/login" method="post">
        <div class="mb-3">
            <label class="form-lable mb-2" for="username">이름<span>*</span></label>
            <input class="form-control"    id="username" name="username"  placeholder="username" autocomplete="off" value="${param.username}"/>
        </div>
        <div class="mb-3">
            <label class="form-lable mb-2" for="password">비밀번호<span>*</span></label>
            <input class="form-control"    id="password"  name="password"  placeholder="password" autocomplete="off" value="${param.password}" type="password"/>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="remember-me"> 
            <label class="form-check-label">자동 로그인</label>
        </div>
            <button type="submit" class="btn btn-primary">로그인하기</button>
        <a href="/user/create" class="btn btn-secondary">회원가입</a>
    </form> 
</section>
<hr>
<c:if test="${exception != null}">
<h2>${exception.message}</h2>
</c:if>
</body>
</html>