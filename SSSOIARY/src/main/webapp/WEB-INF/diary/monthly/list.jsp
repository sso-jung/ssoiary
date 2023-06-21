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
	  background-color: #FAF8FF	!important;
	  opacity: 1;
	}
	.fc-event {
	  background-color: #FAF8FF;
	  color: black;
	  opacity: 1;
	  height: 38px;
	  border: none;
	  font-size: 1.6rem;
	  font-family: 'omyu_pretty';
	}
	   /*요일*/
	  .fc-col-header-cell-cushion {
		font-family: 'omyu_pretty';
		font-size: 1.6rem;
	  }
	  .fc-col-header-cell-cushion:hover {
		text-decoration: none;
		font-family: 'omyu_pretty';
		font-size: 1.6rem;
	  }	
	.fc-day-sun a {
	  color: #CD3B3B;
	  text-decoration: none;
	}
	.fc-day-sat a {
	  color: #4374D9;
	  text-decoration: none;
	}
	  .fc-daygrid-day-number{
		color: #000;
		font-family: 'omyu_pretty';
		font-size: 1.4rem;
	  }
	.fc-list{
		font-family: 'omyu_pretty';
		font-size: 1.4rem;
		font-weight: 100;
		background: #FBF9FF;
	}
	  /*month/week/day*/
	  .fc-button{
		  font-family: 'omyu_pretty'	!important;
		  font-size: 1.3rem				!important;
	  }
	  .fc-toolbar-title {
	  	font-family: 'omyu_pretty';
	  	font-size: 50px !important;
	  }
</style>
   <script>
    	document.addEventListener('DOMContentLoaded', function() {
        	var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'prevYear,prev,next,nextYear today',
                    center: 'title',
                    right: 'dayGridMonth,dayGridWeek,dayGridDay,list'
                },
                views: {
                    list: {
                        type: 'list',
                        duration: { days: 30 },
                        buttonText: 'to-do list',
                        allDayText: ''
                    }
                },
                selectable: true,
                selectMirror: true,
                navLinks: true,
                editable: true,
                buttonText: {
                	month: 'monthly',
                	week: 'weekly',
                	day : 'daily'
                },
                
                firstDay: 1,
                titleFormat: function (date) {
                	return date.date.year + "년 " + (date.date.month + 1) + "월";
                },
                listFormat: function (date) {
                	return date.date.year + "년 " + (date.date.month + 1) + "월";
                },
                // Create new event
                select: function (arg) {
                	var selectedStartDate = arg.startStr;
                	var selectedEndDate = arg.endStr;
                	var endDate = new Date(selectedEndDate);
                	endDate.setDate(endDate.getDate() - 1);
                	var formattedEndDate = endDate.toISOString().split('T')[0];
                    Swal.fire({
                        html: "<div class='mb-7'>일정을 추가하시겠습니까?</div><div class='fw-bold mb-5'></div>\
                        	   <label for='title'>일정</label><input type='text' class='form-control' name='title' placeholder='일정을 입력하세요.' />\
                        	   <label for='starttime'>시작일</label><input type='date' class='form-control' name='starttime' value='"+selectedStartDate+"' />\
                       		   <label for='endtime'>종료일</label><input type='date' class='form-control' name='endtime' value='"+formattedEndDate+"' />",
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
                        }
                    });
                },

                eventClick: function (arg) {
                	console.log(arg.event.backgroundColor);
                	
                	if (arg.event.backgroundColor === ${color}) {
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
                            var eventData = {
                                    title: arg.event.title,
                                    starttime: arg.event.start,
                                    endtime: arg.event.end,
                                    allDay: true
                                };
                        	fetch('/diary/monthly/delete-event', {
                        		method: 'POST',
                        		headers: {
                        			'Content-Type': 'application/json'
                        		},
                        		body: JSON.stringify(eventData)
                        	})
                        	.then(function (response) {
                        		if (response.ok) {
                                    arg.event.remove();
                                    Swal.fire({
                                       text: "일정이 삭제되었습니다.",
                                       icon: "success",
                                       buttonsStyling: false,
                                       confirmButtonText: "확인",
                                       customClass: {
                                         confirmButton: "btn btn-primary",
                      		 	      }
                        			});
                        		}
                  		  });
                        }
                    })
                    }
               		 },
                dayMaxEvents: true,
                events: function (fetchInfo, successCallback, failureCallback) {
                	let url = '/diary/monthly/list-data';
                    document.getElementById('selectButton').addEventListener('click', function(event) {
                        event.preventDefault();

                        url = '/diary/monthly/selected-list-data';

                        const formData = new FormData(document.getElementById('checkForm'));
                        const checked = [];
                        for (let key of formData.keys()) {
                            const value = formData.get(key);
                            checked.push(value);
                        }
                        fetch(url, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(checked)
                        })
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
                                    allDay: true,
                                    color: event.color,
                                };
                            });

                            successCallback(events);
                            calendar.setOption('events', events);
                            calendar.refetchEvents();
                            calendar.render();
                        })
                        .catch(function (error) {
                        	failureCallback(error);
                        });
                    });
                    
                       fetch(url)
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
                                       allDay: true,
                                       color: event.color,
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
	    <div style="padding-top: 40px; width: 75%;">
	    	<div style="margin-left: 20%; margin-bottom: 20px; font-family: 'omyu_pretty'; font-size: 1.8rem; display: flex; ">
	    		<form action="/diary/monthly/selected-list-data" method="post" id="checkForm">
	    			<c:forEach var="c" items="${colors}">
   				           <c:set var="checked" value="${c.name eq name ? 'checked' : ''}"/>
         				   <label><input type="checkbox" name="${c.name}" value="${c.name}" ${checked}>
         				   		  <span style="color:${c.color};"> ${c.name}</span></label>
	    			</c:forEach>
	    				<input class="btn" id="selectButton" style="background: #E3E3E3; font-size: 1.8rem; padding: 0px; margin-left: 10px;" type="submit" value="검색">
				</form>
	    				<a href="/member/color/update?id=${id}">
	    					<button class="btn" style="background: lavender; font-size: 1.8rem; padding: 0px; margin-left: 15px;">색상 변경</button>
	    				</a>
	    	</div>
		    <div style="width:90%; margin-left: 20%;">
				<div id='calendar'>
				</div>
		    </div>
	    </div>
	</div>
</div>

</body>
</html>