<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/navi.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/schedule.css">
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script	src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />

<script type="text/javascript" src="../resources/js/common-schedule.js"></script>

<script type="text/javascript">
   $(document).ready(function () {
	// 2023-08-03 추가할 내용
	// 시간 td에 스크롤 넣기
	// 회원이 신청한 시간은 삭제할 수 없음..

	   // 일정 수정 네비 선택
		$("#schedule").addClass('active');
		
	   // 달력 그리기
	    $("#my-calendar").zabuto_calendar({
	      ajax: {
	        url: "show_data.php?grade=1"
	      }
	    });
	   
	   // 달력에 선택한 시간 표시하기
	   calendarTimeColor();

	   // 월 변경 선택 시 시간 표시 재조회
	   $(".calendar-month-navigation").click(function(){
	 	   // 달력에 선택한 시간 표시하기
	 	   calendarTimeColor();
	    });
	   
	   // 날짜 선택 시 개별 설정에 추가
	   $(".calendar-dow>td").click(function(){
	    	var date = $(this).data('date');
	    	$(".calendar-dow>td").attr("style","background:white;");
	    	$(this).attr("style","background:#ffc10794;");
	    	$("#selectDate").html(date);

			var cnt = 0;
			for(var d = 0 ; d < monthTime.length ; d++){
				if(monthTime[d].rtnTrnrDate == date){
					var timeStr = monthTime[d].trnrTime;
					var monthTimeList = timeStr.split(',');	// 하루 트레이너 선택한 시간

					var timeDiv = $('.preTime');
					for(var t = 0 ; t < timeDiv.length ; t++){
						timeDiv[t].style.backgroundColor = 'gray';
						for(var s = 0 ; s < monthTimeList.length ; s++){
							if(timeDiv[t].id == monthTimeList[s]){
								timeDiv[t].style.backgroundColor = 'orange';
								cnt++;
							}
						}
					}
				}
			}

			if(cnt == 0){
				var timeDiv = $('.preTime');
				for(var t = 0 ; t < timeDiv.length ; t++){
					timeDiv[t].style.backgroundColor = 'gray';
				}
			}
	    });

	   // 시간 드래그
	    for (const button of document.querySelectorAll('.btn')) {
	 	    mouseMove(button, function (event) {
	 	        // 드래그했을 때 해당 부분이 버튼이 아닐 경우에는 return
	 	        if (!(event.target instanceof HTMLButtonElement)) return;
	 	        // 드래그한 커서가 버튼 위에 갈 경우 빨간색으로 표시
	 	        event.target.style.backgroundColor = 'orange';
	 	     });

	 	     // 버튼 클릭했을 때 이벤트
	 	    button.addEventListener('click', (event) => {
	 	        clickEvent(event);
	 	    })
	 	}
	   
	   // 전체 기간 : 오늘일자~말일로 기본 설정
	    $("#startDate").val(today());
		$("#endDate").val(lastDay());
	});
   var monthTime;
   function calendarTimeColor(){

		var trainer = JSON.parse(getSession("local","trainerInfo")); // 세션 정보 조회
		var id = trainer.trnrId;

    	var to = $(".calendar-month-header").data("to");
    	var yearMonth = monthFormat(to.year + "-"+ to.month);
    	
		$.ajax({
		    url: "/app/trainer/selectMonthTime", //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post)
		    data: {
		    		trnrId:id,
		    		selectMonth:yearMonth
				  },
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
				if(data.result == "200"){
					monthTime = JSON.parse(data.trainer);

					$('.littleBtn').attr("style","background-color: gray;");
					for(var d = 0 ; d < monthTime.length ; d++){
						var dDay = monthTime[d].rtnTrnrDate;
						var dayDiv = $("td[id*='"+dDay+"']");	// 달력 하루 버튼
						
						var timeStr = monthTime[d].trnrTime;
						var monthTimeList = timeStr.split(',');	// 하루 트레이너 선택한 시간
						
						var timeDiv = dayDiv.find('.littleBtn');
						
						for(var t = 0 ; t < timeDiv.length ; t++){
							for(var s = 0 ; s < monthTimeList.length ; s++){
								if(timeDiv[t].id == monthTimeList[s]){
									timeDiv[t].style.backgroundColor = 'orange';
								}
							}
						}
						
						
					}
					//common.alert("저장되었습니다.");
				}else{
					//common.alert("저장에 실패했습니다. 재시도 바랍니다.");
				}
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
   }
   
   // 시간 드래그
	function mouseMove(target, whileMove) {
	    let endMove = function () {
	        // 마우스를 뗄 때 이벤트 리스너 제거
	        window.removeEventListener('mousemove', whileMove);
	        window.removeEventListener('mouseup', endMove);        
	    };

	    // 마우스를 클릭한 채 움직이면 이벤트리스너 생성
	    target.addEventListener('mousedown', function (event) {
	        event.stopPropagation(); 
	        window.addEventListener('mousemove', whileMove);
	        window.addEventListener('mouseup', endMove);   
	    });
	}

	// 클릭했을 때 빨간색이면 회색으로, 회색이면 빨간색으로 전환
	function clickEvent(event) {
	    const button = event.target;

	    if (button.style.backgroundColor == 'orange') {
	        button.style.backgroundColor = 'gray';
	    }
	    else {
	        button.style.backgroundColor = 'orange';
	    }
	}
	
	function insertAllTime(){
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		if(isEmpty(startDate)) { common.alert("기간을 입력해주세요."); return false; }
		if(isEmpty(endDate)) { common.alert("기간을 입력해주세요."); return false; }
		if(startDate>endDate){ common.alert("시작일자가 종료일자보다 클 수 없습니다."); return false; };
		
		var chkWeekend = $('input:checkbox[name="chkWeekend"]:checked');

		// startDate - endDate : for
		var startEndDate = getDatesStartToLast(startDate, endDate);
		var selectDay = [];
		for(var d = 0 ; d < startEndDate.length ; d++){
			// 선택한 기간 중 체크한 요일만 뽑기
			var day = new Date(startEndDate[d]).getDay();
			for(var w = 0 ; w < chkWeekend.length ; w++){	// 선택한 요일
				if(chkWeekend[w].value == day){	// 선택한 요일과 기간 요일이 동일할 경우
					selectDay.push(startEndDate[d]);
				}
			}
		}
		var chkTime = $(".allTime");
		var selectTime = [];
		for(var t = 0 ; t < chkTime.length ; t++){
			if(chkTime[t].style.backgroundColor == 'orange'){	// 선택한 시간 가져오기
				selectTime.push(chkTime[t].id);
			}
		}
		
		// 실제 저장 로직
		insertOneDayTime(selectDay,selectTime);
	}
	

	function insertPreTime(){
		var day = $("#selectDate").html();
		if(day == "달력에서 날짜를 클릭해주세요.") { common.alert("날짜를 선택해주세요."); return false; }
		var chkTime = $(".preTime");

		var selectDay = [];
		selectDay.push(day);
		
		var selectTime = [];
		for(var t = 0 ; t < chkTime.length ; t++){
			if(chkTime[t].style.backgroundColor == 'orange'){	// 선택한 시간 가져오기
				selectTime.push(chkTime[t].id);
			}
		}
		// 실제 저장 로직
		insertOneDayTime(selectDay,selectTime);
	}
	
	function insertOneDayTime(day,time){
		var trainer = JSON.parse(getSession("local","trainerInfo")); // 세션 정보 조회
		var id = trainer.trnrId;
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
		    url: "/app/trainer/insertOneDay", //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post)
		    data: {
		    		trnrId:id,
					trnrDateList:day,
					trnrTimeList:time
				  },
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
				if(data.result == "200"){
					common.alert("저장되었습니다.");
					calendarTimeColor();
				}else{
					common.alert("저장에 실패했습니다. 재시도 바랍니다.");
				}
		    },
		    error: function(err) {
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    }
		});
	}
</script>
<main>
	<h1 id="subHeader">일정 수정</h1>
	<div class="container">
		<div class="row" id="my-cal">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div id="my-calendar"></div>
			</div>
		</div>

	    <div id="t-div">
		    <table id="timeTable" style="width:100%; margin-top:20px;">
		        <tbody>
			        <tr class="trLine">
			            <td rowspan="3" style="background-color:#ffc10766;" align="center">
			            	전체 설정<br/>
			        		<input type="button" class="btn120" onclick="insertAllTime()" value="저장"> 
			            </td>
			            <td class="tdHeader2">기간 : </td>
			            <td class="tdBody">
			            	<input size="15" type="date" class="text200" id="startDate" name="startDate">~
			             	<input size="15" type="date" class="text200" id="endDate" name="endDate">
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader2">요일 : </td>
			            <td class="tdBody">
			                <input type="checkbox" name="chkWeekend" value="1">월
			                <input type="checkbox" name="chkWeekend" value="2">화
			                <input type="checkbox" name="chkWeekend" value="3">수
			                <input type="checkbox" name="chkWeekend" value="4">목
			                <input type="checkbox" name="chkWeekend" value="5">금
			                <input type="checkbox" name="chkWeekend" value="6">토
			                <input type="checkbox" name="chkWeekend" value="0">일
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader2">시간 : </td>
			            <td class="tdBody">
				             <div>
				            	<div id="timeSpanDiv">
					            	<span class="timeSpan">01:00</span>
					            	<span class="timeSpan">02:00</span>
					            	<span class="timeSpan">03:00</span>
					            	<span class="timeSpan">04:00</span>
					            	<span class="timeSpan">05:00</span>
					            	<span class="timeSpan">06:00</span>
					            	<span class="timeSpan">07:00</span>
					            	<span class="timeSpan">08:00</span>
					            	<span class="timeSpan">09:00</span>
					            	<span class="timeSpan">10:00</span>
					            	<span class="timeSpan">11:00</span>
					            	<span class="timeSpan">12:00</span>
					            	<span class="timeSpan">13:00</span>
					            	<span class="timeSpan">14:00</span>
					            	<span class="timeSpan">15:00</span>
					            	<span class="timeSpan">16:00</span>
					            	<span class="timeSpan">17:00</span>
					            	<span class="timeSpan">18:00</span>
					            	<span class="timeSpan">19:00</span>
					            	<span class="timeSpan">20:00</span>
					            	<span class="timeSpan">21:00</span>
					            	<span class="timeSpan">22:00</span>
					            	<span class="timeSpan">23:00</span>
					            	<span class="timeSpan">24:00</span>
				            	</div>
				            	<div id="timeBtnDiv">
					               	<button id="0001" class="btn allTime"></button>
								    <button id="0102" class="btn allTime"></button>
								    <button id="0203" class="btn allTime"></button>
								    <button id="0304" class="btn allTime"></button>
								    <button id="0405" class="btn allTime"></button>
					               	<button id="0506" class="btn allTime"></button>
								    <button id="0607" class="btn allTime"></button>
								    <button id="0708" class="btn allTime"></button>
								    <button id="0809" class="btn allTime"></button>
								    <button id="0910" class="btn allTime"></button>
					               	<button id="1011" class="btn allTime"></button>
								    <button id="1112" class="btn allTime"></button>
								    <button id="1213" class="btn allTime"></button>
								    <button id="1314" class="btn allTime"></button>
								    <button id="1415" class="btn allTime"></button>
					               	<button id="1516" class="btn allTime"></button>
								    <button id="1617" class="btn allTime"></button>
								    <button id="1718" class="btn allTime"></button>
								    <button id="1819" class="btn allTime"></button>
								    <button id="1920" class="btn allTime"></button>
					               	<button id="2021" class="btn allTime"></button>
								    <button id="2122" class="btn allTime"></button>
								    <button id="2223" class="btn allTime"></button>
								    <button id="2324" class="btn allTime"></button>
							    </div>
						    </div>
			            </td>
			        </tr>
			        <tr style="height:20px;">
			        </tr>
			        <tr class="trLine">
			            <td rowspan="2" style="background-color:#ffc10766;" align="center">
			            	개별 설정<br/>
			        		<input type="button" class="btn120" onclick="insertPreTime()" value="저장">
			            </td>
			            <td class="tdHeader2">날짜 : </td>
			            <td class="tdBody"><p id="selectDate">달력에서 날짜를 클릭해주세요.</p>
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader2">시간 : </td>
			            <td class="tdBody">
			            	<div id="timeSpanDiv">
				            	<span class="timeSpan">01:00</span>
				            	<span class="timeSpan">02:00</span>
				            	<span class="timeSpan">03:00</span>
				            	<span class="timeSpan">04:00</span>
				            	<span class="timeSpan">05:00</span>
				            	<span class="timeSpan">06:00</span>
				            	<span class="timeSpan">07:00</span>
				            	<span class="timeSpan">08:00</span>
				            	<span class="timeSpan">09:00</span>
				            	<span class="timeSpan">10:00</span>
				            	<span class="timeSpan">11:00</span>
				            	<span class="timeSpan">12:00</span>
				            	<span class="timeSpan">13:00</span>
				            	<span class="timeSpan">14:00</span>
				            	<span class="timeSpan">15:00</span>
				            	<span class="timeSpan">16:00</span>
				            	<span class="timeSpan">17:00</span>
				            	<span class="timeSpan">18:00</span>
				            	<span class="timeSpan">19:00</span>
				            	<span class="timeSpan">20:00</span>
				            	<span class="timeSpan">21:00</span>
				            	<span class="timeSpan">22:00</span>
				            	<span class="timeSpan">23:00</span>
				            	<span class="timeSpan">24:00</span>
			            	</div>
			            	<div id="timeBtnDiv">
				               	<button id="0001" class="btn preTime"></button>
							    <button id="0102" class="btn preTime"></button>
							    <button id="0203" class="btn preTime"></button>
							    <button id="0304" class="btn preTime"></button>
							    <button id="0405" class="btn preTime"></button>
				               	<button id="0506" class="btn preTime"></button>
							    <button id="0607" class="btn preTime"></button>
							    <button id="0708" class="btn preTime"></button>
							    <button id="0809" class="btn preTime"></button>
							    <button id="0910" class="btn preTime"></button>
				               	<button id="1011" class="btn preTime"></button>
							    <button id="1112" class="btn preTime"></button>
							    <button id="1213" class="btn preTime"></button>
							    <button id="1314" class="btn preTime"></button>
							    <button id="1415" class="btn preTime"></button>
				               	<button id="1516" class="btn preTime"></button>
							    <button id="1617" class="btn preTime"></button>
							    <button id="1718" class="btn preTime"></button>
							    <button id="1819" class="btn preTime"></button>
							    <button id="1920" class="btn preTime"></button>
				               	<button id="2021" class="btn preTime"></button>
							    <button id="2122" class="btn preTime"></button>
							    <button id="2223" class="btn preTime"></button>
							    <button id="2324" class="btn preTime"></button>
						    </div>
			            </td>
			        </tr>
			    </tbody>
		    </table>
	    </div>
	</div>
</main>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>