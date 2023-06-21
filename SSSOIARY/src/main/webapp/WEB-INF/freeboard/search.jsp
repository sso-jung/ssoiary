<%@page import="java.util.Date"%>
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
		color: black;
	}
	.col-md-2 {
		border-right: 1px solid lightgray;
	}
	th {
		text-align: center;
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
	@media (max-width: 767px) {
	  div[style*="width: 60%;"] {
	    width: 100% !important;
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
	.badge {
		background:#FECDDE;
		margin-left: 10px;
	}
	.btn-sm {
		line-height: 1;
		font-size: 13px;
	}
	.page-item.active .page-link {
 		background-color: #4375DB;
	}
</style>
<script type="text/javascript">
	$(document).on('click', '#deletePost', function(e) {	// 삭제 버튼
	  e.preventDefault();
  	  var pageNum = ${paging.pageNum};
  	  var postId = $(this).data('post-id');
	  var deleteUrl = "/freeboard/page/" + pageNum+ "/10?deleteId=" + postId;
	  var result = confirm("정말 삭제하시겠습니까?");
	  if (result) {
		  window.location.href = deleteUrl;  
	  } else {
	  }
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
  <h2 class="navbar-text" style="color:white; font-weight: bold; margin-right: 50px; margin-top: 10px;">CATEGORY</h2>
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

<div class="container-fluid" style="margin-bottom:100px;">
	<div class="row d-flex flex-md-row">
	    <div class="col-md-3 d-none d-md-flex flex-column align-items-center" style="padding-top: 50px;">
   			<h1 class="info" style="margin-top: 20px; margin-bottom: 50px; word-break: keep-all; text-align: center;">
   				${name}님, 환영합니다.
   			</h1>
			<div class="d-flex flex-row align-items-center">
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
	    <div class="col-md-9">
	    	<h1 style="margin-bottom: 40px; margin-top: 50px; margin-left: 5%; font-family: 'MBC1961GulimM';">'${keyword}' 에 대한 검색 결과입니다.<span class="badge">${postCount}</span></h1>
	    	
	    		<table class="table table-hover board" style="margin-bottom: 0px; width:100%; table-layout: fixed;">
				<thead>
					<tr>
						<th style="width: 10%;">글번호</th>
						<th style="width: 40%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 15%;">작성일</th>
						<th style="width: 10%;">댓글</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${list.size() == 0}">
					<tr>
						<td colspan="5" style="height: 100px; vertical-align: middle;">검색 결과가 존재하지 않습니다.</td>
					<tr>
				</c:if>
				<c:forEach var="p" items="${list}">
					<tr>
						<td>${p.id}</td>
						<td><a href="/freeboard/detail/${p.id}?page=${paging.pageNum}">${p.title}</a></td>
						<td>${p.writer}</td>
						<td><fmt:formatDate pattern="yy-MM-dd" value="${p.day}"/></td>
						<td>${p.reply}</td>
						<td><c:if test="${p.writer eq name}">
							<button class="btn btn-danger btn-sm" id="deletePost" data-post-id="${p.id}">X</button>
						</c:if></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="d-flex flex-row align-items-center justify-content-between board" style="width: 90%;">
				<ul class="pagination mx-auto" style="margin-top:20px;">
				<c:if test="${paging.hasPreviousPage}">
					<li class="page-item"><a class="page-link" href="/freeboard/page/1/${paging.pageSize}"> << </a>
				</c:if>
				<c:choose>
					<c:when test="${paging.hasPreviousPage}">
						<li class="page-item"><a class="page-link" href="/freeboard/page/${paging.navigateFirstPage-1}/${paging.pageSize}">Prev</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="n" items="${paging.navigatepageNums}">
					<c:choose>
						<c:when test="${n eq paging.pageNum}">
							<li class="page-item active"><a class="page-link" href="/freeboard/page/${n}/${paging.pageSize}">${n}</a></li>
						</c:when>
						<c:when test="${n ne paging.pageNum}">
							<li class="page-item"><a class="page-link" href="/freeboard/page/${n}/${paging.pageSize}">${n}</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${paging.hasNextPage}">
						<li class="page-item"><a class="page-link" href="/freeboard/page/${paging.navigateLastPage+1}/${paging.pageSize}">Next</a>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link" href="#">Next</a>
					</c:otherwise>
				</c:choose>
				<c:if test="${paging.hasNextPage}">
					<li class="page-item"><a class="page-link" href="/freeboard/page/${paging.pages}/${paging.pageSize}"> >> </a>
				</c:if>
				</ul>
				<a href="/freeboard/page/${paging.pageNum}/10"><button class="btn ml-auto" style="background:#4375DB; color:white; white-space: nowrap;">돌아가기</button></a>
			</div>
			<form action="/freeboard/search/1/10">
				<div class="form-group d-flex justify-content-center">
			    <div class="col-sm-12 d-flex flex-row align-items-center" style="width: 60%;">
			      <input type="text" autocomplete="off" class="form-control" id="keyword" name="keyword" placeholder="제목, 혹은 작성자로 글을 검색하세요." style="text-align: left;">
			      <button type="submit" class="btn" value="검색하기" style="background:#4375DB; color: white; margin-left: 10px; white-space: nowrap;">검색</button>
			    </div>
				</div>
			</form>
	    </div>
	</div>
</div>

</body>
</html>