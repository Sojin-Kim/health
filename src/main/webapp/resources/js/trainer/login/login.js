// 화면 오픈 시 실행
$(document).ready(function(){
	
}); 

// 로그인 버튼
function login(){
	// 아이디/비번 널체크
	var id = $("#trnrId").val();
	var pw = $("#trnrPw").val();
	if(isEmpty(id)) { common.alert("아이디를 입력해주세요."); return false; }
	if(isEmpty(pw)) { common.alert("비밀번호를 입력해주세요."); return false; }
	
	$.ajax({
	    url: "/app/trainer/selectOneMember", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post)
	    data: {
				trnrId:id,
				trnrPw:pw
			  },
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				location.href = "/app/trainer/mypage";
				saveSession("local","trainerInfo",data.trainer);
			}
			
			// 데이터 없을 경우 회원 정보 못찾음 alert
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	});
	
}

// 회원가입 버튼
function joinForm(){
	location.href = "/app/trainer/join";
}

// 아이디/비밀번호 버튼
function findInfo(){
	//location.href = "/app/trainer/join";
}