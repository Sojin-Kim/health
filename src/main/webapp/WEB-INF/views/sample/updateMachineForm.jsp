<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script type="text/javascript">
$(document).ready(function(){
	//nav 선택
	$("#sample").addClass('active');
	
    // 그리드 설정 
	selectMachineOne();
	
});

function selectMachineOne(){
	const urlParams = new URL(location.href).searchParams;
	const mnum = urlParams.get('mnum');
	$.ajax({
	    url: "/app/machine/selectMachineOne", //request 보낼 서버의 경로
	    data:{
	    	mNum:mnum   // 키:값
	    },
	    type:'post', // 메소드(get, post)
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				var machine = JSON.parse(data.machine);
				console.log(machine);
				$("#mName").val(machine.mname);
				$("#mComment").val(machine.mcomment);
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}

function updateMachine(){
	const urlParams = new URL(location.href).searchParams;
	const mnum = urlParams.get('mnum');
	$("#mNum").val(mnum);
	var mName = $("#mName").val();
	var mImg = $("#mImg").val();
	var mComment = $("#mComment").val();
	if(isEmpty(mName)) { common.alert("이름을 입력해주세요."); return false; }
	if(isEmpty(mComment)) { common.alert("설명을 입력해주세요."); return false; }
	
	$.ajax({
	    url: "/app/machine/updateMachineAction", //request 보낼 서버의 경로
	    data:{
	    	mNum:mnum,   // 키:값
	    	mName:mName,
	    	mComment:mComment
	    },
	    type:'post', // 메소드(get, post)
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				common.alert("기구가 정상적으로 수정되었습니다.").then((result) => {
					if(result.isConfirmed){
						location.replace("/app/machine/sample");
					}
				});
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}

function deleteMachine(){
	const urlParams = new URL(location.href).searchParams;
	const mnum = urlParams.get('mnum');
	$.ajax({
	    url: "/app/machine/deleteMachineAction", //request 보낼 서버의 경로
	    data:{
	    	mNum:mnum   // 키:값
	    },
	    type:'post', // 메소드(get, post)
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				common.alert("기구가 정상적으로 삭제되었습니다.").then((result) => {
					if(result.isConfirmed){
						location.replace("/app/machine/sample");
					}
				});
			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}
</script>

<main>
    <h1 id="subHeader">기구 정보 수정</h1>
    <div style="padding-left:100px">
	    <input type="button" class="btn120" onclick="history.back();" value="뒤로가기">
    </div>
	<form id="machineForm" class="form-style" action="" method="post">
	    <table id="machineTable" class="table-style">
	        <tbody>
		        <tr>
		            <td colspan="2" style="background-color:#ffc10766; height:35px;" align="center">기구정보
		            <input size="15" type="text" class="text400" id="mNum" name="mNum" hidden>
		            </td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">이름</td>
		            <td class="tdBody"><input size="15" type="text" class="text400" id="mName" name="mName"></td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">사진(보류)</td>
		            <td class="tdBody"><input size="15" type="text" class="text400" id="mImg" name="mImg"></td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">설명</td>
		            <td class="tdBody">
		            	<textarea cols="50" class="textarea480" id="mComment" name="mComment"></textarea>
		            </td>
		        </tr>
		    </tbody>
	    </table>
	    <div id="btnList">
		    <input type="button" class="btn120" onclick="updateMachine();" value="수정">
		    <input type="button" class="btn120" onclick="deleteMachine();" value="삭제">
	    </div>
	</form>
</main>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>