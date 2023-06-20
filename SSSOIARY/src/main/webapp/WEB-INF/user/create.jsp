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
	.title {
		margin-top: 20px;
		height: 150px;
		background: black;
		color: white;
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
	<span style="margin-top: 13px;">SSOIARY.</span>
</div></a>
<div class="container">
<h1 style="margin-bottom: 40px; margin-left: 5%; margin-top: 100px; font-family: 'MBC1961GulimM';">회원가입</h1>
	<form action="/user/create" method="post" onsubmit="return validateForm()">
		<div class="mb-3">
			<label class="form-lable mb-2" for="id">ID*</label>
			<input class="form-control" name="id" id="id" placeholder="id를 입력하세요. (필수입력)" autocomplete="off" value="${member.id}"/>
					<c:if test="${binding.hasErrors()}">
					<c:set var="idError" value="false" />
					<c:forEach var="f" items="${binding.fieldErrors}">
						<c:choose>
							<c:when test="${f.field == 'id'}">
							<c:if test="${!idError}">
								<c:set var="idError" value="true" />
								<div style="color: red;">ID는 4글자 이상이어야 합니다.</span>
							</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="password">PASSWORD*</label>
			<input class="form-control" name="password" id="password" type="password" placeholder="비밀번호를 입력하세요. (필수입력)" autocomplete="off" value="${member.password}"/>
				<c:if test="${binding.hasErrors()}">
					<c:set var="passwordError" value="false" />
					<c:forEach var="f" items="${binding.fieldErrors}">
						<c:choose>
							<c:when test="${f.field == 'password'}">
							<c:if test="${!passwordError}">
								<c:set var="passwordError" value="true" />
								<span style="color: red;">비밀번호는 4글자 이상이어야 합니다.</span>
							</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="password2">CONFIRM PASSWORD* </label>
			<input class="form-control" name="password2" id="password2" type="password" placeholder="비밀번호를 한 번 더 확인하세요. (필수입력)" autocomplete="off" value=""/>
			<div id="password-error" style="color: red;"></div>
		</div>
		<div class="mb-3">
			<label class="form-lable mb-2" for="name">name*</label>
			<input class="form-control" name="name" id="name" placeholder="이름을 입력하세요. (필수입력)" autocomplete="off" value="${member.name}" />
				<c:if test="${binding.hasErrors()}">
					<c:set var="nameError" value="false" />
					<c:forEach var="f" items="${binding.fieldErrors}">
						<c:choose>
							<c:when test="${f.field == 'name'}">
							<c:if test="${!nameError}">
								<c:set var="nameError" value="true" />
								<div style="color: red;">이름을 입력하세요.</div>
							</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:forEach var="g" items="${binding.globalErrors}">
						<c:choose>
							<c:when test="${g.code == 'duplicate key'}">
								<div style="color: red;">이름 혹은 ID가 중복됩니다.</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>	
</div>
</section>

</body>
</html>