<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/navi.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/mypage.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script	src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />

<script type="text/javascript">
var calendar;
$(document).ready(function(){
	$("#schedule").addClass('active');


	calendar = new tui.Calendar(document.getElementById('calendar'), {
		defaultView: 'month', 
		taskView: false, 
		// can be also ['milestone', 'task'] 
		scheduleView: true, 
		// can be also ['allday', 'time'] 
		eventFilter: function(schedule){ console.log("click!!"); },
		template: { 
			allday: function(schedule) { return schedule.title + ' <i class="fa fa-refresh"></i>'; }, 
			alldayTitle: function() { return 'All Day'; }, 
			time: function(schedule) { return schedule.title + ' <i class="fa fa-refresh"></i>' + schedule.start; } 
		}, 
		month: { daynames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], startDayOfWeek: 0, narrowWeekend: false }, 
		week: { daynames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], startDayOfWeek: 0, narrowWeekend: false } 
	}); 
	
	var date = calendar.getDate();
	var year = date.getFullYear();	// 연도
	var month = date.getMonth()+1;	// 월
	var ym = year + '-' + (month < 10 ? ('0' + month) : month);
	$("#yearMonth").html(ym);
	
	calendar.on('clickDayName', (event) => {	// 주간,일간만 된다는데.. 말이 되나..ㅠㅠ
		console.log("click!!");
	  if (calendar.getViewName() === 'week') {
	    const dateToMove = new Date(event.date);

	    calendar.setDate(dateToMove);
	    calendar.changeView('day');
	  }else{
	    const dateToMove = new Date(event.date);
		console.log(dateToMove());
		  
	  }
	});
});

function today(){
	calendar.today();
	checkYm();
}

function prev(){
	calendar.prev();
	checkYm();
}

function next(){
	calendar.next();
	checkYm();
}

function checkYm(){
	var date = calendar.getDate();
	var year = date.getFullYear();	// 연도
	var month = date.getMonth()+1;	// 월
	var ym = year + '-' + (month < 10 ? ('0' + month) : month);
	$("#yearMonth").html(ym);
}

function createSchedule(){

	 const schedule = {
		    calendarId: scheduleData.calendarId,
		    id: String(Math.random() * 100000000000000000),
		    title: scheduleData.title,
		    isAllDay: scheduleData.isAllDay,
		    start: scheduleData.start,
		    end: scheduleData.end,
		    category: scheduleData.isAllDay ? 'allday' : 'time'
		  };
	  calendar.createSchedules([schedule]);

	  alert('일정 생성 완료');
}
</script>
<main>
	<h1 id="subHeader">일정 수정</h1>
    <nav class="c-navbar">
      <button class="is-rounded prev" onclick="prev();">&lsaquo;</button>
      <span class="navbar-range" id="yearMonth"></span>
      <button class="is-rounded next" onclick="next();">&rsaquo;</button>
      <button class="today" onclick="today();">Today</button>
    </nav>
	<div id="c-div">
      <main id="calendar"></main>
    </div>
    <div id="t-div">
    	시간 선택
    </div>
</main>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>