/**
 * 공통함수
 */

/**
 *  alert/confirm 창 디자인을 위해 공통 함수 적용
  		common.alert("비밀번호는 4~12자의 영문과 숫자로만 입력해야 합니다.").then((result) => {
			if (result)	return false;	// 확인 버튼 클릭 시
		});
*/
var common = {
	alert: function(str, tMsg){ 	// tMsg 없으면 확인이 default
		return Swal.fire({
		  text: str,
		  showDenyButton: true,
		  showCancelButton: false,
		  confirmButtonText: isEmpty(tMsg) ? "확인" : tMsg,
		});
	},
	
	confirm: function(str, tMsg, fMsg){ 	// tMsg, fMsg 없으면 확인/취소가 default
		return Swal.fire({
		  text: str,
		  showDenyButton: true,
		  showCancelButton: true,
		  confirmButtonText: isEmpty(tMsg) ? "확인" : tMsg,
		  cancelButtonText: isEmpty(fMsg) ? "취소" : fMsg
		});
	}
}

/** 
 * 세션 저장
 * type : local(로컬 스토리지), session(세션 스토리지)
 * 로컬은 새로고침하거나 창을 닫아도 삭제되지 않음. 세션은 페이지 나갈 경우 삭제됨.
 * ex) saveSession("local","login",'{"id": "soso"}') -> 로컬 스토리지에 login이라는 key값으로 {"id": "soso"} 데이터가 저장됨.
 */
function saveSession(type, key, data){
	if(type=="local"){
		localStorage.setItem(key, data); // 저장 
	}else if(type=="session"){
		sessionStorage.setItem(key, data); // 저장
	} 
}

/**
 * 세션 조회
 * ex) getSession("local","login") -> 로컬 스토리지에 login이라는 key값의 데이터가 리턴됨.
 *     값을 saveSession("local","login",'{"id": "soso"}') 로 넣었다면
 *     '{"id": "soso"}' 이 JSON 형식임으로 가져올때 JSON.parse(getSession("local","login")) 로 가져와야함.
 *     -> 다른 방법이 있을텐데 생각이 안남.. 간단한 방법 찾으면 수정하겠습니다..
 *        공통 수정 시 이를 사용하여 개발한 소스는 개인이 수정해야함으로 나중에 개인 소스 수정 부탁드립니다.
 */
function getSession(type, key){
	if(type=="local"){
		return localStorage.getItem(key); // 저장 
	}else if(type=="session"){
		return sessionStorage.getItem(key); // 저장
	}
} 

/**
 * 세션 삭제
 * ex) removeSession("local","login") -> 로컬 스토리지에 login이라는 key값 삭제됨.
 */
function removeSession(type, key){
	if(type=="local"){
		localStorage.removeItem(key); // 저장 
	}else if(type=="session"){
		sessionStorage.removeItem(key); // 저장 
	} 
}
 
// null 체크 : null일 경우 true 반환
function isNull(param){
	if(param == null || param == "") {
		return true;
	}
	return false;
} 
 
// 빈값 체크 : 빈값일 경우 true 반환
function isEmpty(param){
	if(param == null || param.replace(/ /gi,"") == "") {
		return true;
	}
	return false;
}

// 숫자와 영어로 이루어져 있는지 확인 : 맞으면 true 아니면 false
function checkNumEng(param){
	var noEngRule = /^[a-zA-Z0-9]*$/;
    if(!noEngRule.test(param)) {
        return false;
    } else {
        return true;
    }
}

// 현재 일자 가져오기
function today(){
	var now = new Date();	// 현재 날짜 및 시간

	return now.getFullYear() + "-" + ((now.getMonth()+1) < 10 ? "0"+(now.getMonth()+1) : (now.getMonth()+1)) + "-" + (now.getDate() < 10 ? ("0"+now.getDate()): now.getDate());
}

// 말일 가져오기
function lastDay(){
	var now = new Date();	// 현재 날짜 및 시간
	var last = new Date(now.getFullYear(), (now.getMonth()+1), 0);
	return now.getFullYear() + "-" + ((now.getMonth()+1) < 10 ? "0"+(now.getMonth()+1) : (now.getMonth()+1)) + "-" + last.getDate();
}

// 정해진 일자 포맷으로 가져오기
function dayFormat(day){
	var now = new Date(day);	// 현재 날짜 및 시간

	return now.getFullYear() + "-" + ((now.getMonth()+1) < 10 ? "0"+(now.getMonth()+1) : (now.getMonth()+1)) + "-" + (now.getDate() < 10 ? ("0"+now.getDate()): now.getDate());
}

// 정해진 월 포맷으로 가져오기
function monthFormat(day){
	var now = new Date(day);	// 현재 날짜 및 시간

	return now.getFullYear() + "-" + ((now.getMonth()+1) < 10 ? "0"+(now.getMonth()+1) : (now.getMonth()+1));
}

// 시작일과 종료일 사이 일자 구하기
function getDatesStartToLast(startDate, lastDate) {
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	if(!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
	var result = [];
	var curDate = new Date(startDate);
	while(curDate <= new Date(lastDate)) {
		result.push(curDate.toISOString().split("T")[0]);
		curDate.setDate(curDate.getDate() + 1);
	}
	return result;
}
// 각자 필요한 공통코드 추가하기
