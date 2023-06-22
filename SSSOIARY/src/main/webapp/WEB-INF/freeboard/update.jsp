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
<link href="/webjars/summernote/0.8.20/dist/summernote-lite.min.css" rel="stylesheet">
<script src="/webjars/summernote/0.8.20/dist/summernote-lite.min.js"></script>
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
	.col-md-3 {
		border-right: 1px solid lightgray;
	}	
	table.ranking td, input, table.board td {
		text-align: center;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	} /* 랭킹 표 */
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
	  	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체','GangwonEdu_OTFBoldA','MBC1961GulimM','omyu_pretty'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	  });
	});
</script>
<title>SSOIARY</title>
</head>
<body>
<a href="/"><div class="container-fluid header">
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
        <a class="nav-link" href="/freeboard/page/1/10" style="color:#FECDDE;">FREE BOARD</a>
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
<div class="container" style="margin-bottom:100px;">
	<div class="row d-flex flex-md-row">
	    <div class="col-md-12">
	    	<h1 style="margin-bottom: 40px; margin-top: 50px; margin-left: 5%; font-family: 'MBC1961GulimM';">게시글 작성</h1>
			<form action="/freeboard/update?id=${param.id}&page=${param.page}" method="post">
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
				<button type="submit" class="btn" style="background:#4375DB; color:white;">작성 완료</button>
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