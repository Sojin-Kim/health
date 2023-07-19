// 화면 오픈 시 실행
$(document).ready(function(){
	// 아이디 입력 시 id 중복 확인 메시지 초기화
	$("#trnrId").keyup(function(){
		$("#idErrorMsg").html("");
		$("#idSuccessMsg").html("");
	});
	
	// 2차 비밀번호 입력 시 맞는지 확인 메시지 초기화
	$("#trnrPw_check, #trnrPw").keyup(function(){
		checkDuplPw();
	});
}); 

// 아이디 중복 확인 버튼
function checkDuplId(){
	var id = $("#trnrId").val();
	if(isEmpty(id)){
		common.alert("아이디를 입력하세요.");
		$("#idErrorMsg").html("");
		$("#idSuccessMsg").html("");
		return false;
	}
	$.ajax({
	    url: "/app/trainer/selectOneMember", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post)
	    data: {
				trnrId:id
			  },
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				$("#idErrorMsg").html("이미 존재하는 아이디입니다.");
				$("#idSuccessMsg").html("");
				return false;
			}else{
				$("#idErrorMsg").html("");
				$("#idSuccessMsg").html("사용 가능한 아이디입니다.");
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}

// 비밀번호 2차 체크
function checkDuplPw(){
	var pw = $("#trnrPw").val();
	var pwCk =  $("#trnrPw_check").val();
	if(pwCk != pw){
		$("#pwErrorMsg").html("비밀번호가 일치하지 않습니다.");
		$("#pwSuccessMsg").html("");
	}else{
		$("#pwErrorMsg").html("");
		$("#pwSuccessMsg").html("비밀번호가 일치합니다.");
	}
}

// 회원 가입 버튼
function join(){
	// 아이디 길이 및 영문숫자 체크
	var id = $("#trnrId").val();
	if(!checkNumEng(id) || id.length < 4 || id.length > 12){	// 영문,숫자로 이루어져 있는지 확인
		common.alert("아이디는 4~12자의 영문과 숫자로만 입력해야 합니다.");
		return false;
	}
	
	// 비밀번호 길이 및 영문숫자 체크
	var pw = $("#trnrPw").val();
	console.log(pw.length);
	if(!checkNumEng(pw) || pw.length < 4 || pw.length > 12){	// 영문,숫자로 이루어져 있는지 확인
		common.alert("비밀번호는 4~12자의 영문과 숫자로만 입력해야 합니다.");
		return false;
	}
	
	// 아이디 중복 확인 버튼
	// 아이디 중복 확인을 안한 경우
	if($("#idSuccessMsg").html() == "" && $("#idErrorMsg").html() == ""){
		common.alert("아이디 중복 확인이 필요합니다.");
		return false;
	}
	// 아이디 중복인 경우
	if($("#idErrorMsg").html() != ""){
		common.alert("이미 존재하는 아이디입니다.");
		return false;
	}
	// 비밀번호 2차 체크 --> 재확인
	var pwCk =  $("#trnrPw_check").val();
	if(pwCk != pw){
		common.alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	
	// 이름 길이 체크
	
	console.log("계속 타는중");
	
	// 자기소개/사진 제외 널 체크
	
	//$("#joinForm").submit();
}