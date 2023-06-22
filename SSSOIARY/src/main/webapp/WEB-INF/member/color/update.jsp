<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-store">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
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
	.ssoiary {
		color: white;
		background: linear-gradient(137deg, #FFE08C, #FFD9EC, #B2CCFF, #BCE067);
	    color: transparent;
	    -webkit-background-clip: text;
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
	a {
		text-decoration: none;
	}
    @media (max-width: 768px) {
        form[style*="width: 600px;"] {
            width: 100% !important;
            max-width: 100%;
        }
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
</style>
<title>SSOIARY</title>
</head>
<body>

<section style="margin-bottom:100px;">
<a href="/"><div class="container-fluid title">
	<span style="margin-top: 13px;" class="ssoiary">SSOIARY.</span>
</div></a>

<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-center">
	<div class="container">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item" style="width:250px;">
        <a class="nav-link" href="/" style="color:white;">HOME </a>
      </li>
      <li class="nav-item" style="width:250px;">
        <a class="nav-link" href="/freeboard/page/1/10" style="color:white;">FREE BOARD</a>
      </li>
      <li class="nav-item dropdown" style="width:250px;">
        <a class="nav-link dropdown-toggle" href="#" style="color:white;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          DIARY
        </a>
        <ul class="dropdown-menu" style="background: #E3E3E3;">
          <li><a class="dropdown-item" href="/diary/monthly/list">SCHEDULER</a></li>
        </ul>
      <li class="nav-item" style="width:250px;">
        <a class="nav-link active" aria-current="page" href="/game/list" style="color: white;">GAME</a>
      </li>
      </li>
    </ul>
  </div>
  </div>
</nav>

<div class="container-fluid">
    <div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
	    <h2 class="info" style="margin-bottom: 50px; margin-top: 50px;">Scheduler 색상 변경</h2>
		<form action="/member/color/update" method="post" style="width: 600px;">
			<div class="mb-4 form-group">
				<label class="form-lable mb-3" for="id">ID</label>
				<input class="form-control"    id="id" name="id" value="${id}" disabled="disabled"/>
				<input class="form-control"    id="id" name="id" value="${id}" type="hidden"/>
			</div>
			<div class="mb-4 form-group">
				<label class="form-lable mb-3" for="color">Scheduler 색상</label>
				<input class="form-control"    id="color"  name="color" type="color" value="${color.color}" style="height: 100px;" />
			</div>
			<div class="mb-4 form-group" style="display: none;">
				<label class="form-lable mb-3" for="name">이름</label>
				<input class="form-control"    id="name"  name="name"  value="${name}" disabled="disabled"/>
				<input class="form-control"    id="name"  name="name"  value="${name}" type="hidden"/>
			</div>
			<button type="submit" class="btn btn-primary">변경하기</button>
		</form>	
	</div>
</div>
</section>
<hr>
<c:if test="${binding.hasErrors()}">
<h2>Error Massage</h2>
<hr>
<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
</c:forEach>
<hr>
<c:forEach var="f" items="${binding.fieldErrors}">
	<div>${f.field} ${f.defaultMessage}</div>
</c:forEach>

</c:if>
</body>
</html>