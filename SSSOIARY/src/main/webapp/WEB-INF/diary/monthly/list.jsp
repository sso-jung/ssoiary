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
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<link href="/js/main.min.css" rel="stylesheet">
<script src="/js/main.min.js" type="text/javascript"></script>
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
	.fc-day-today {
	  background-color: #FCE2EF;
	  opacity: 0.7;
	}
	.fc-event {
	  background-color: #8C8C8C;
	  color: white;
	  opacity: 1;
	  height: 30px;
	  border: none;
	  font-size: 20px;
	  font-family: inherit;
	}
</style>
   <script>
    	document.addEventListener('DOMContentLoaded', function() {
        	var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay'
                },
                selectable: true,
                selectMirror: true,
                navLinks: true,
                editable: true,
                
                // Create new event
                select: function (arg) {
                	var selectedDate = arg.startStr;
                    Swal.fire({
                        html: "<div class='mb-7'>일정을 추가하시겠습니까?</div><div class='fw-bold mb-5'></div>\
                        	   <label for='title'>일정</label><input type='text' class='form-control' name='title' placeholder='일정 이름을 입력하세요.' />\
                        	   <label for='starttime'>시작일</label><input type='date' class='form-control' name='starttime' value='"+selectedDate+"' />\
                       		   <label for='endtime'>종료일</label><input type='date' class='form-control' name='endtime' value='"+selectedDate+"' />",
                        icon: "info",
                        showCancelButton: true,
                        buttonsStyling: false,
                        confirmButtonText: "추가",
                        cancelButtonText: "취소",
                        customClass: {
                            confirmButton: "btn btn-primary",
                            cancelButton: "btn btn-danger"
                        }
                    }).then(function (result) {
                        if (result.value) {
                            var title = document.querySelector("input[name='title']").value;
                            var starttime = document.querySelector("input[name='starttime']").value;
                            var endtime = document.querySelector("input[name='endtime']").value;
                            if (title) {
                            	var eventData = {
                                        title: title,
                                        starttime: starttime,
                                        endtime: endtime,
                                        allDay: true
                                    };
                            	fetch('/diary/monthly/add-event', {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json'
                                    },
                                    body: JSON.stringify(eventData)
                                })
                                .then(function (response) {
                                    // 응답 처리
                                    if (response.ok) {
                                        calendar.addEvent(eventData);
                                        Swal.fire({
                                            text: "일정이 추가되었습니다.",
                                            icon: "success",
                                            buttonsStyling: false,
                                            confirmButtonText: "확인",
                                            customClass: {
                                                confirmButton: "btn btn-primary",
                                            }
                                        }).then(function() {
                                        	window.location.href = "/diary/monthly/list";
                                        });
                                    } else {
                                        Swal.fire({
                                            text: "일정 추가에 실패했습니다.",
                                            icon: "error",
                                            buttonsStyling: false,
                                            confirmButtonText: "확인",
                                            customClass: {
                                                confirmButton: "btn btn-primary",
                                            }
                                        });
                                    }
                                })
                                .catch(function (error) {
                                    console.error('Error:', error);
                                });
                            }
                            calendar.unselect()
                        } else if (result.dismiss === "cancel") {
                            Swal.fire({
                                text: "일정을 추가하지 않습니다.",
                                icon: "error",
                                buttonsStyling: false,
                                confirmButtonText: "확인",
                                customClass: {
                                    confirmButton: "btn btn-primary",
                                }
                            });
                        }
                    });
                },

                eventClick: function (arg) {
                    Swal.fire({
                        text: "일정을 삭제하시겠습니까?",
                        icon: "warning",
                        showCancelButton: true,
                        buttonsStyling: false,
                        confirmButtonText: "삭제",
                        cancelButtonText: "취소",
                        customClass: {
                            confirmButton: "btn btn-primary",
                            cancelButton: "btn btn-danger"
                        }
                    }).then(function (result) {
                        if (result.value) {
                            arg.event.remove()
                        } else if (result.dismiss === "cancel") {
                            Swal.fire({
                                text: "일정을 삭제하지 않습니다.",
                                icon: "error",
                                buttonsStyling: false,
                                confirmButtonText: "확인",
                                customClass: {
                                    confirmButton: "btn btn-primary",
                                }
                            });
                        }
                    });
                },
                dayMaxEvents: true,
                events: function (fetchInfo, successCallback, failureCallback) {
                    fetch('/diary/monthly/list-data')
                        .then(function (response) {
                            return response.json();
                        })
                        .then(function (data) {
                            var events = data.map(function (event) {
                                var startTime = new Date(event.starttime);
                                return {
                                    title: event.title,
                                    start: event.starttime,
                                    end: event.endtime,
                                    allDay: true
                                };
                            });

                            successCallback(events);
                        })
                        .catch(function (error) {
                            failureCallback(error);
                        });
                },
            });

            calendar.render();
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
        <a class="nav-link" href="/freeboard/page/1/10" style="color:white;">FREE BOARD</a>
      </li>
      <li class="nav-item dropdown" style="width:250px;">
        <a class="nav-link dropdown-toggle" href="#" style="color:#FECDDE;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          DIARY
        </a>
        <ul class="dropdown-menu" style="background: #E3E3E3;">
          <li><a class="dropdown-item" href="/diary/monthly/list" style="background:#FFE8F3;">MONTHLY</a></li>
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
	    <div class="col-md-2 d-none d-md-flex flex-column align-items-center" style="padding-top: 50px;">
   			<h1 class="info" style="margin-top: 20px; margin-bottom: 50px; word-break: keep-all; text-align: center;">
   				<sec:authentication property="name"/>님, 환영합니다.
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
	    <div class="col-md-10">
	    	<h1 style="margin-bottom: 40px; margin-left: 5%; font-family: 'MBC1961GulimM';">MONTHLY<span class="badge">${freeboardPostCount}</span></h1>
		    <div style="width:90%; margin-left: 5%;">
				<div id='calendar'>
				</div>
		    </div>
	    </div>
	</div>
</div>

</body>
</html>