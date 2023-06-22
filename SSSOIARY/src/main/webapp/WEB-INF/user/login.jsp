<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	@font-face {
	    font-family: 'GangwonEdu_OTFBoldA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'MBC1961GulimM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	@font-face {
	    font-family: 'omyu_pretty';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	body {
		background: linear-gradient(137deg, #FAECC5, #FFEAF3, #ECEBFF, #E4F7BA);
		background-size: 800% 800%;
		animation: gradi 13s ease infinite;
	}
	.ssoiary {
		color: white;
		background: linear-gradient(137deg, #FFE08C, #FFD9EC, #B2CCFF, #BCE067);
	    color: transparent;
	    -webkit-background-clip: text;
	}
	@keyframes gradi {
	    0%{background-position:0% 50%}
  	 	50%{background-position:100% 50%}
    	100%{background-position:0% 50%}
	}
	.title {
		margin-top: 20px;
		height: 150px;
		background: black;
		font-family: 'MBC1961GulimM';
		font-size: 75px;
		font-weight: bolder;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.info {
		font-family: 'MBC1961GulimM';
		font-weight: lighter;
		font-size: 40px;
	}
	h1.info {
		font-family: 'GangwonEdu_OTFBoldA';
	}
	.nav-link {
		font-size: 30px;
		font-family: 'omyu_pretty';
		white-space: nowrap;
		font-weight: lighter;
	}
	.navbar-text {
		font-family: 'omyu_pretty';
		font-size: 32px;
	}
	.dropdown-item {
		font-size: 24px;
		font-family: 'omyu_pretty';
	}
	@media (min-width: 768px) {
	  .nav-item, .dropdown-item {
	  	text-align: center;
	  }
	}/* NavBar */
	@media (min-width: 768px) {
	  .nav-item, .dropdown-item {
	  	text-align: center;
	  }
	}
	a {
		text-decoration: none;
	}
</style>
<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var password2 = document.getElementById("password2").value;
        var errorDiv = document.getElementById("password-error");

        if (password !== password2) {
            errorDiv.textContent = "비밀번호가 일치하지 않습니다.";
            return false; 
        } else {
            errorDiv.textContent = ""; 
            return true; 
        }
    }
</script>
<title>SSOIARY</title>
</head>
<body>

<section>
<a href="/"><div class="container-fluid title">
	<span style="margin-top: 13px;" class="ssoiary">SSOIARY.</span>
</div></a>
<div class="container">
<h1 style="margin-bottom: 40px; margin-left: 5%; margin-top: 100px; font-family: 'MBC1961GulimM';">로그인</h1>
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
</div>
<c:if test="${exception != null}">
<h2>${exception.message}</h2>
</section>
</c:if>
</body>
</html>

