<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/passwordPop.css">
<!-- 폰트 디자인 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 메세지 창 디자인 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>

<script type="text/javascript">
const urlParams = new URL(location.href).searchParams;
const id = urlParams.get('id');

// 비밀번호 조회
function updatePw(){
	var pw = $("#trnrPw").val();
	var nPw = $("#newTrnrPw").val();
	var nPwCk = $("#newTrnrPwCk").val();
	if(isEmpty(pw)) { common.alert("비밀번호를 입력해주세요."); return false; }
	if(isEmpty(nPw)) { common.alert("새 비밀번호를 입력해주세요."); return false; }
	if(isEmpty(nPwCk)) { common.alert("새 비밀번호 확인을 입력해주세요."); return false; }
	if(pw == nPw) { common.alert("기존 비밀번호와 동일합니다."); return false; }
	if(nPwCk != nPw) { common.alert("새비밀번호가 일치하지 않습니다."); return false; }
	// 기존 비밀번호 체크
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
				// 새비밀번호 업데이트
				upDt();
			}else{
				common.alert("기존 비밀번호가 맞지 않습니다.");
				return false;
			}
			
			// 데이터 없을 경우 회원 정보 못찾음 alert
			
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	});
}

// 비밀번호 변경
function upDt(){  
	var nPw = $("#newTrnrPw").val();
	$.ajax({
	    url: "/app/trainer/updatePassword", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post)
	    data: {
				trnrId:id,
				trnrPw:nPw
			  },
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				// 새비밀번호 업데이트 성공
				common.alert("비밀번호가 정상적으로 수정되었습니다.").then((result) => {
					if(result.isConfirmed){
						window.close();
					}
				});
			}
			
			// 데이터 없을 경우 회원 정보 못찾음 alert
			
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
	    }
	});
}
</script>

<body>
	<div>
	    <h1 id="subHeader">비밀번호 변경</h1>
		<form id="joinForm" action="loginAction" method="post">
		    <table id="joinTable">
		        <tbody>
			        <tr>
			            <td colspan="2" style="background-color:#ffc10766; height:24px;" align="center">기존 정보</td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">기존 비밀번호</td>
			            <td class="tdBody"><input size="15" type="password" class="text200" id="trnrPw" name="trnrPw"></td>
			        </tr>
			        <tr>
			            <td colspan="2" style="background-color:#ffc10766; height:24px;" align="center">변경 정보</td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">새 비밀번호</td>
			            <td class="tdBody"><input size="15" type="password" class="text200" id="newTrnrPw" name="newTrnrPw"></td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">새 비밀번호 확인</td>
			            <td class="tdBody"><input size="15" type="password" class="text200" id="newTrnrPwCk" name="newTrnrPwCk"></td>
			        </tr>
			    </tbody>
		    </table>
	        <p align="center">
	            <input type="button" class="btn120" onclick="updatePw()" value="수정"> 
	        </p>
		</form>
	
	</div>
</body>
</html>