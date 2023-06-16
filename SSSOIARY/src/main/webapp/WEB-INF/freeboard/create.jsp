<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<script src="/webjars/bootstrap/js/bootstrap.bundle.min.js"></script>
<link href="/webjars/summernote/0.8.20/dist/summernote-bs5.min.css" rel="stylesheet">
<script src="/webjars/summernote/0.8.20/dist/summernote-bs5.min.js"></script>
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
	th {
		text-align: center;
	}
	.col-md-2 {
		border-right: 1px solid lightgray;
	}	
	table.ranking td, input, table.board td {
		text-align: center;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	} /* 랭킹 표 */
	h1,ul {
		font-family: 'GangwonEdu_OTFBoldA';
	}
	ul {
		font-size: 30px;
	}
	.dropdown-item {
		font-size: 24px;
	}
	@media (min-width: 768px) {
	  .nav-item, .dropdown-item {
	  	text-align: center;
	  }
	}
	.col-md-10 {
		display: flex;
		flex-direction: column;
		margin-top: 50px;
	}
	.page-item {
		font-size: 18px;
		font-family: sans-serif;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	  $('.summernote').summernote({
	    tabsize: 2,
	    height: 600,
	    lang: "ko-KR",
	    toolbar: [
	  	  ['fontname', ['fontname']],
	  	  ['fontsize', ['fontsize']],
	  	  ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
	  	  ['color', ['forecolor', 'backcolor']],
	  	  ['para', ['ul', 'ol', 'paragraph']],
	  	  ['height', ['height']],
	  	  ['insert', ['picture', 'link', 'video']],
	  	  ['misc', ['undo', 'redo', 'codeview']],
	  	],
	  	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','GangwonEdu_OTFBoldA','MBC1961GulimM'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	    colors: [
	        ['#000000', '#ffffff', '#ff0000', '#00ff00', '#0000ff', '#ffff00', '#00ffff', '#ff00ff', '#000000'],
	      ],
	  });
	});
</script>
<title>SSOIARY</title>
</head>
<body>
<a href="/"><div class="container-fluid header">
	<span style="margin-top: 13px;">SSOIARY.</span>
</div></a>

<nav class="navbar navbar-expand-md navbar-dark bg-dark justify-content-center">
	<div class="container">
  <h2 class="navbar-text" style="color:white; font-weight: bold; margin-right: 50px;">CATEGORY</h2>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      <li class="nav-item" style="width:200px;">
        <a class="nav-link" href="/" style="color:white;">Home </a>
      </li>
      <li class="nav-item" style="width:200px;">
        <a class="nav-link" href="/freeboard/page/1/10" style="color:#FECDDE;">FREE BOARD</a>
      </li>
      <li class="nav-item dropdown" style="width:200px;">
        <a class="nav-link dropdown-toggle" href="#" style="color:white;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          DIARY
        </a>
        <ul class="dropdown-menu" style="background: #E3E3E3;">
          <li><a class="dropdown-item" href="#">MONTHLY</a></li>
          <li><a class="dropdown-item" href="#">WEEKLY</a></li>
          <li><a class="dropdown-item" href="#">DAILY</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="#">EVERYONE</a></li>
        </ul>
      <li class="nav-item" style="width:200px;">
        <a class="nav-link active" aria-current="page" href="/game/list" style="color: white;">GAME</a>
      </li>
      </li>
    </ul>
  </div>
  </div>
</nav>
<div class="container-fluid">
	<div class="row d-flex flex-md-row">
	    <div class="col-md-2 d-none d-md-flex flex-column align-items-center" style="padding-top: 50px;">
   			<h1 style="margin-top: 20px; margin-bottom: 50px; word-break: keep-all; text-align: center;">
   				<sec:authentication property="name"/>님, 환영합니다.
   			</h1>
			<div class="d-flex flex-row align-items-center">
			<a href="/logout"><button class="btn" style="background: #E3E3E3;">로그아웃</button></a>
			<a href="/member/list"><button class="btn" style="margin-left: 10px; background:#FCE2EF;">내 정보</button></a>
			</div>
			<div style="padding-top: 80px; display:flex; flex-direction: column; align-items: center; justify-content: center;">
		    <h1 style=" margin-bottom: 30px;">활동 랭킹</h1>
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
						<td>${g.postcount}</td>
						<td>${g.rank}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			</div>
	    </div>
	    <div class="col-md-10">
	    	<h1 style="margin-bottom: 40px; margin-left: 5%; font-family: 'MBC1961GulimM';">게시글 작성</h1>
			<form action="/freeboard/create?page=${param.page}" method="post">
				<div class="mb-3">
					<label class="form-label mb-2" for="title">제목</label>
					<c:if test="${binding.hasErrors()}">
					<c:set var="titleError" value="false" />
					<c:forEach var="f" items="${binding.fieldErrors}">
						<c:choose>
							<c:when test="${f.field == 'title'}">
							<c:if test="${!titleError}">
								<c:set var="titleError" value="true" />
								<span style="color: #DB0000; margin-left: 20px;">제목을 입력하세요. 제목은 1에서 100자 사이여야 합니다.</span>
							</c:if>
							</c:when>
						</c:choose>
					</c:forEach>
				</c:if>
					<input class="form-control" name="title" id="title" autocomplete="off" style="text-align: left;" value="${post.title}" placeholder="제목을 입력하세요." />
				</div>
				<div class="mb-3">
					<label class="form-label mb-2" for="content">내용</label>
					<textarea class="form-control summernote" name="content" id="content" autocomplete="off"  style="text-align: left; height:600px;" placeholder="내용을 입력하세요.">${post.content}</textarea>
				</div>
				<button type="submit" class="btn btn-primary">작성 완료</button>
			</form>	    	
	    </div>
	</div>
	<div class="container">
 <c:if test="${binding.hasErrors()}">
<!-- 	<h2>Error Message</h2> -->
	<c:forEach var="g" items="${binding.globalErrors}">
	<div>${g.code} ${g.defaultMessage}</div>
	</c:forEach>
	</div>
</c:if>
</div>
</body>
</html>