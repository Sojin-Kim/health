<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/trainer/login/join.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trainer/login/join.css">
<!-- 
  트레이너 회원가입 화면
  2023/07/17 ksj 추가
-->

<div>
    <h1 id="subHeader">트레이너 회원가입</h1>
	<form id="joinForm" action="insertJoin" method="post">
	    <table id="joinTable">
	        <tbody>
		        <tr>
		            <td colspan="4" style="background-color:#ffc10766;" align="center">트레이너 기본 정보</td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">아이디</td>
		            <td class="tdBody" colspan="3">
		            	<input size="15" type="text" class="text200" id="trnrId" name="trnrId" placeholder="4~12자 영문/숫자로 입력">
		            	<input type="button" class="btn90" onclick="checkDuplId();" value="중복 확인">
		            	<span id="idErrorMsg" class="errorMsg"></span>
		            	<span id="idSuccessMsg" class="successMsg"></span>
		            </td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">비밀번호</td>
		            <td class="tdBody" colspan="3"><input size="15" type="password" class="text200" id="trnrPw" name="trnrPw" placeholder="4~12자 영문/숫자로 입력"></td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">비밀번호 확인</td>
		            <td class="tdBody" colspan="3">
		            	<input size="15" type="password" class="text200" id="trnrPw_check" name="trnrPw_check">
		            	<span id="pwErrorMsg" class="errorMsg"></span>
		            	<span id="pwSuccessMsg" class="successMsg"></span>
					</td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">이름</td>
		            <td class="tdBody" colspan="3"><input type="text" id="trnrName" class="text200" name="trnrName"></td>
		        </tr>
		        <tr class="trLine">
		            <td class="tdHeader" align="center">성별</td>
		            <td class="tdBody" colspan="3">
		            	<input type="radio" name="trnrGender" value="M" checked>남
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
		            	<textarea cols="50" class="textarea480" name="trnrIntro"></textarea>
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
		            	<input type="radio" name="consultYn" value="N" checked>불가능
		            </td>
		            <td class="tdSubHeader" align="center">예약거부</td>
		            <td class="tdBody">
		            	<input type="radio" name="refusalYn" value="Y">가능
		            	<input type="radio" name="refusalYn" value="N" checked>불가능
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
	        <input type="button" class="btn120" onclick="join();" value="회원 가입"> 
	        <input type="reset" id="btnReset" class="btn120" value="다시 입력"> 
	    </p>
	</form>

</div>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>