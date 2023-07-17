<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/trainer/login/login.js"></script>
<!-- 
  트레이너 로그인 화면
  2023/07/17 ksj 추가
-->

<div>
로그인
	<form id="loginForm" action="loginAction" method="post">
	    <table border="1px" bordercolor="grey" align="center">
	        <tbody>
		        <tr>
		            <td bgcolor="lightgrey" align="center">아이디</td>
		            <td><input size="15" type="text" id="trnrId" name="trnrId"></td>
		        </tr>
		        <tr>
		            <td bgcolor="lightgrey" align="center">비밀번호</td>
		            <td><input size="15" type="password" id="trnrPw"name="trnrPw"></td>
		        </tr>
		    </tbody>
	    </table>
        <p align="center">
            <input type="button" onclick="login()" value="로그인"> 
            <input type="button" onclick="findInfo()" value="아이디/비밀번호 찾기"> 
            <input type="button" onclick="joinForm()" value="회원가입"> 
        </p>
	</form>

</div>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>