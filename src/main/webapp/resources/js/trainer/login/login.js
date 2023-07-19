// 화면 오픈 시 실행
$(document).ready(function(){
	
}); 

// 로그인 버튼
function login(){
	/**
	아이디/비번 조회해서 확인 후 세션 저장 -> 마이페이지로 이동
 */
// 아이디/비번 널체크
	
	//var login = getSession("local","login");
	$.ajax({
	    url: "/app/trainer/selectOneMember", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post)
	    data: {
				trnrId:$("#trnrId").val(),
				trnrPw:$("#trnrPw").val()
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
	/**
	아이디/비번 확인 후 세션 저장
 */
	location.href = "/app/trainer/join";
	
	//$("#loginForm").submit();
}

// 아이디/비밀번호 버튼
function findInfo(){
	/**
	아이디/비번 확인 후 세션 저장
 */
	
	
	//$("#loginForm").submit();
}