<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/navi.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/mypage.css">

<script type="text/javascript">
$(document).ready(function(){
	$("#mypage").addClass('active');
	
	// 정보 조회
	srchInfo();
	
});

function srchInfo(){
	var trainer = JSON.parse(getSession("local","trainerInfo")); // 세션 정보 조회
	var id = trainer.trnrId;
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
				var trainer = JSON.parse(data.trainer);
				$("#trnrId").val(trainer.trnrId);
				$("#trnrName").val(trainer.trnrName);
				$("#trnrIntro").val(trainer.trnrIntro);
				$("#trnrAmt").val(trainer.trnrAmt);
				
				$("input[name='trnrGender'][value='"+trainer.trnrGender+"']").prop("checked", true);
				$("input[name='consultYn'][value='"+trainer.consultYn+"']").prop("checked", true);
				$("input[name='refusalYn'][value='"+trainer.refusalYn+"']").prop("checked", true);
				
				var like = trainer.trnrLike.split(",");
				for(var i = 0 ; i < like.length ; i++){
					$("input[name='trnrLike'][value='"+like[i]+"']").prop("checked", true);
				}
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}
function updateInfo(){
	// 이름 길이 체크
	var name =  $("#trnrName").val();
	if(name.length > 50){
		common.alert("이름이 길어 저장되지 않습니다. 관리자에게 문의 바랍니다.");
		return false;
	}
	
	// 자기소개/사진 제외 널 체크
	var amt = $("#trnrAmt").val();
	if(isEmpty(name)) { common.alert("이름을 입력해주세요."); return false; }
	if(isEmpty(amt)) { common.alert("가격을 입력해주세요."); return false; }

	//check 확인
	if(!$('input:checkbox[name="trnrLike"]').is(":checked")){
		common.alert("관심분야를 1개 이상 선택해주세요.");
		return false;
	}
	if(!$('input:radio[name="trnrGender"]').is(":checked")){
		common.alert("성별을 선택해주세요.");
		return false;
	}
	if(!$('input:radio[name="consultYn"]').is(":checked")){
		common.alert("상담 가능 여부를 선택해주세요.");
		return false;
	}
	if(!$('input:radio[name="refusalYn"]').is(":checked")){
		common.alert("예약거부 가능 여부를 선택해주세요.");
		return false;
	}
	
	$("#joinForm").submit();
}

function changePw(){

	//창 크기 지정
	var width = 500;
	var height = 300;
	
	//pc화면기준 가운데 정렬
	var left = (window.screen.width / 2) - (width/2);
	var top = (window.screen.height / 4);
	
    	//윈도우 속성 지정
	var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
	
    	//연결하고싶은url
    	const url = "http://localhost:8080/app/trainer/passwordPop?id="+$("#trnrId").val();

	//등록된 url 및 window 속성 기준으로 팝업창을 연다.
	window.open(url, "popup", windowStatus);
}
</script>

<main>
	<div>
		<h1 id="subHeader">개인 정보 수정</h1>
		<form id="joinForm" action="updateJoin" method="post">
		    <table id="joinTable">
		        <tbody>
			        <tr>
			            <td colspan="4" style="background-color:#ffc10766;" align="center">트레이너 기본 정보</td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">아이디</td>
			            <td class="tdBody" colspan="3">
			            	<input size="15" type="text" class="text200" id="trnrId" name="trnrId" readonly>
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">비밀번호</td>
			            <td class="tdBody" colspan="3">
							<input type="button" class="btn150" onclick="changePw();" value="비밀번호 변경">
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">이름</td>
			            <td class="tdBody" colspan="3"><input type="text" id="trnrName" class="text200" name="trnrName"></td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">성별</td>
			            <td class="tdBody" colspan="3">
			            	<input type="radio" name="trnrGender" value="M">남
			            	<input type="radio" name="trnrGender" value="W">여
			            </td>
			        </tr>
			        <tr>
			            <td colspan="4" style="background-color:#ffc10766;" align="center"> 개인 수업 정보</td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">관심분야</td>
			            <td class="tdBody" colspan="3">
			                <input type="checkbox" name="trnrLike" value="1">체형교정
			                <input type="checkbox" name="trnrLike" value="2">근력향상
			                <input type="checkbox" name="trnrLike" value="3">다이어트
			                <input type="checkbox" name="trnrLike" value="4">필라테스
			                <input type="checkbox" name="trnrLike" value="5">식단관리
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">자기소개</td>
			            <td class="tdBody" colspan="3">
			            	<textarea cols="50" class="textarea480" name="trnrIntro" id="trnrIntro"></textarea>
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">프로필 사진</td>
			            <td class="tdBody" colspan="3">
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">1회당 가격</td>
			            <td class="tdBody" colspan="3">
			            	<input size="15" type="text" class="text200" name="trnrAmt" id="trnrAmt"> 
			            	세부 설정가능하게?-> 별도 테이블 빼야함
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">상담여부</td>
			            <td class="tdBody">
			            	<input type="radio" name="consultYn" value="Y">가능
			            	<input type="radio" name="consultYn" value="N">불가능
			            </td>
			            <td class="tdSubHeader" align="center">예약거부</td>
			            <td class="tdBody">
			            	<input type="radio" name="refusalYn" value="Y">가능
			            	<input type="radio" name="refusalYn" value="N">불가능
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">자격사항</td>
			            <td class="tdBody"> 보류
			            </td>
			            <td class="tdSubHeader" align="center">경력사항</td>
			            <td class="tdBody"> 보류
			            </td>
			        </tr>
			        <tr class="trLine">
			            <td class="tdHeader" align="center">맛보기 수업 여부</td>
			            <td class="tdBody" colspan="3"> 보류
			            </td>
			        </tr>
			    </tbody>
		    </table>
		    <p>
		        <input type="button" class="btn120" onclick="updateInfo();" value="수정">
		    </p>
		</form>
	
	</div>
</main>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>