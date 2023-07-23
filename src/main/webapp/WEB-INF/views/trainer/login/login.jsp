<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/trainer/login/login.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/login/login.css">
<!-- 
  트레이너 로그인 화면
  2023/07/17 ksj 추가
-->

<div>
    <h1 id="subHeader">트레이너 로그인</h1>
	<form id="loginForm" action="loginAction" method="post">
	    <table id="loginTable">
	        <tbody>
		        <tr>
		            <td colspan="2" style="background-color:#ffc10766; height:35px;" align="center">로그인</td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">아이디</td>
		            <td class="tdBody"><input size="15" type="text" class="text200" id="trnrId" name="trnrId"></td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">비밀번호</td>
		            <td class="tdBody"><input size="15" type="password" class="text200" id="trnrPw"name="trnrPw"></td>
		        </tr>
		    </tbody>
	    </table>
        <p align="center">
            <input type="button" class="btn120" onclick="login()" value="로그인"> 
            <input type="button" class="btn120" onclick="findInfo()" value="아이디/비밀번호 찾기"> 
            <input type="button" class="btn120" onclick="joinForm()" value="회원가입"> 
        </p>
	</form>

</div>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>