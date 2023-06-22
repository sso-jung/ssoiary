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
<script src="/js/sweetalert2.all.min.js"></script>
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
		color: black;
	}
	.col-md-3 {
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
	table.reply tbody tr td {
		border: none;
	}
</style>
<script type="text/javascript">
	$(document).on('click', '#deletePost', function(e) {	// 게시글 삭제 버튼
	  e.preventDefault();
  	  var postId = ${post.id};
	  var deleteUrl = "/freeboard/page/1/10?deleteId=" + postId;
	  var result = confirm("게시글을 삭제하시겠습니까?");
	  if (result) {
		  window.location.href = deleteUrl;  
	  }
	});
	$(document).on('click', '#deleteReply', function(e) {	// 댓글 삭제 버튼
		  e.preventDefault();
	  	  var page = $(this).data('page');
	  	  var postId = ${post.id};
	  	  var replyId = $(this).data('reply-id');
		  var deleteUrl = "/freeboard/detail/" + postId + "?page=" + page + "&deleteReplyId=" + replyId;
		  var result = confirm("댓글을 삭제하시겠습니까?");
		  if (result) {
			  window.location.href = deleteUrl;  
		  } 
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
	    	<h1 style="margin-bottom: 40px; margin-top: 50px; margin-left: 5%; font-family: 'MBC1961GulimM';">자유게시판<span class="badge">${postCount}</span></h1>
	    	
	    		<table class="table board" style="margin-bottom: 0px; width:100%; table-layout: fixed;">
				<thead>
					<tr style="background: #EAEAEA;">
						<th style="width: 10%;">글번호</th>
						<th style="width: 40%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 15%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${post.id}</td>
						<td>${post.title}</td>
						<td>${post.writer}</td>
						<td><fmt:formatDate pattern="yy-MM-dd hh:mm:ss" value="${post.day}"/></td>
					</tr>
					<tr><td colspan="4" height="400px;" style="text-align: left; padding-left:5%; padding-top:2%;">${post.content}</td><tr>
				</tbody>
			</table>
			<div>
				<div style="padding-top:10px; background: #EAEAEA;">
				<span style="font-family: 'MBC1961GulimM'; font-size: 20px; margin-left: 5%;">COMMENTS</span>
				<hr style="color: #EAEAEA; margin-top: 5px; margin-bottom: 0px;">
				</div>
			<table class ="table reply">
				<tbody>
				<c:if test="${reply.size() == 0}">
					<tr style="border-bottom: 1px solid #EAEAEA;">
						<td width=5%;></td><td style="vertical-align: middle; height:100px;">작성된 댓글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="r" items="${reply}">
					<tr>
						<td width=10%; style="white-space: nowrap; text-align: center; vertical-align: middle;" rowspan="2">${r.writer}</td>
						<td><fmt:formatDate pattern="yy-MM-dd hh:mm:ss" value="${r.day}"/></td>
						<c:if test="${r.writer eq name}">
							<td><button class="btn btn-danger btn-sm" id="deleteReply" data-reply-id="${r.replyId}" data-page="${param.page}">X</button></td>
						</c:if>
					</tr>
					<tr style="border-bottom: 1px solid #EAEAEA;">
						<td>${r.content}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<form action="/freeboard/detail/${post.id}/${param.page}/createReply">
				<div class="form-group d-flex justify-content-center">
			    <div class="col-sm-12 d-flex flex-row">
			      <textarea class="form-control" name="content" id="content" autocomplete="off"  style="text-align: left; height:70px;" placeholder="댓글을 입력하세요."></textarea>
			      <button type="submit" class="btn" value="검색하기" style="background:#4375DB; color:white; margin-left: 10px; white-space: nowrap;">등록</button>
			    </div>
				</div>
			</form>
			</div>
			<div class="d-flex flex-row justify-content-between" style="width: 90%; margin-top: 10px;">
				<a href="/freeboard/page/${param.page}/10"><button class="btn " style="background:#4375DB; color:white; white-space: nowrap;">목록으로</button></a>
				<div>
					<c:if test="${post.writer eq name}">
					<a href="/freeboard/update?id=${post.id}&page=${param.page}"><button class="btn " style="background:#EAEAEA; white-space: nowrap;">수정</button></a>
					<button class="btn" id="deletePost" style="background:#FCE2EF; white-space: nowrap;">삭제</button>
					</c:if>
				</div>
			</div>
	    </div>
	</div>
</div>
<c:if test="${content.isEmpty()}">
    <script>
        const swalInstance = Swal.mixin({
            toast: true,
            position: 'middle',
            showConfirmButton: false,
            timer: 2000
        });
        
        swalInstance.fire({
            title: "댓글의 내용을 입력하세요.",
            icon: "warning",
            showClass: {
                popup: 'swal2-noanimation',
                backdrop: 'swal2-noanimation'
            },
            hideClass: {
                popup: '',
                backdrop: ''
            }
        });
    </script>
</c:if>
</body>
</html>