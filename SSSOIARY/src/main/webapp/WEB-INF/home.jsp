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
	.header {
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
	a {
		text-decoration: none;
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
	table.ranking th {
		text-align: center;
	}
	table.ranking td {
		text-align: center;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	} /* 랭킹 표 */
</style>
<title>SSOIARY</title>
</head>
<body>

<a href="/"><div class="container-fluid header">
	<span style="margin-top: 13px;">SSOIARY.</span>
</div></a>

<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-center">
	<div class="container">
  <h2 class="navbar-text" style="color:white; font-weight: bold; margin-right: 50px; margin-top: 10px;">CATEGORY</h2>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item" style="width:250px;">
        <a class="nav-link" href="/" style="color:#FECDDE;">HOME </a>
      </li>
      <li class="nav-item" style="width:250px;">
        <a class="nav-link" href="/freeboard/page/1/10" style="color:white;">FREE BOARD</a>
      </li>
      <li class="nav-item dropdown" style="width:250px;">
        <a class="nav-link dropdown-toggle" href="#" style="color:white;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          DIARY
        </a>
        <ul class="dropdown-menu" style="background: #E3E3E3;">
          <li><a class="dropdown-item" href="/diary/monthly/list">MONTHLY</a></li>
          <li><a class="dropdown-item" href="#">WEEKLY</a></li>
          <li><a class="dropdown-item" href="#">DAILY</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#">EVERYONE</a></li>
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
	<div class="row d-flex flex-md-row">
	    <div class="col-md-2" style="display: flex; flex-direction: column; align-items: center; justify-content: center; padding-top: 50px;">
   			<h1 class="info" style="margin-top: 20px; margin-bottom: 50px; word-break: keep-all; text-align: center;">
   				${name}님, 환영합니다.
   			</h1>
			<div style="display: flex; flex-direction: row;">
			<a href="/logout"><button class="btn" style="background: #E3E3E3;">로그아웃</button></a>
			<a href="/member/list"><button class="btn" style="margin-left: 10px; background:#FCE2EF;">내 정보</button></a>
			</div>
			<div style="padding-top: 80px; display:flex; flex-direction: column; align-items: center; justify-content: center;">
		    <h1 class="info" style=" margin-bottom: 30px;">활동 랭킹</h1>
		    <table class="table table-hover ranking" style="width:100%; table-layout: fixed;">
    		<thead>
				<tr>
					<th>순위</th>
					<th>이름</th>
					<th>포인트</th>
					<th>게시글 수</th>
					<th>랭크</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="g" items="${gradeList}" varStatus="status">
					<tr>
						<td>${status.index + 1}</td>
						<td>${g.name}</td>
						<td>${g.point}</td>
						<td>${g.postCount}</td>
						<td>${g.rank}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			</div>
	    </div>
	    <div class="col-md-10">
	    <h1 style="background:lavender;">하이 아직 홈화면 안꾸밈</h1>
	    </div>
	</div>
</div>

</body>
</html>