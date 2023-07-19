<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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
$(document).ready(function(){
	// 기존 비밀번호 체크
	// 새 비밀번호 2중 체크
	// 수정 버튼
});
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
	            <input type="button" class="btn120" onclick="updatePassword()" value="수정"> 
	        </p>
		</form>
	
	</div>
</body>
</html>