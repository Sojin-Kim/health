<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/trainer/common/header.jsp"></jsp:include>
<script type="text/javascript" src="../resources/js/trainer/login/join.js"></script>
<!-- 
  트레이너 회원가입 화면
  2023/07/17 ksj 추가
-->

<div>
    회원가입
	<form id="joinForm" action="insertJoin" method="post">
	    <table border="1px" bordercolor="grey" align="center">
	        <tbody>
	        <tr>
	            <td colspan="2" bgcolor="lightblue" align="center">트레이너 기본 정보</td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">아이디</td>
	            <td><input size="15" type="text" name="trnrId"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">비밀번호</td>
	            <td><input size="15" type="password" name="trnrPw"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">비밀번호 확인</td>
	            <td><input size="15" type="password" name="trnrPw_check"></td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">이름</td>
	            <td><input type="text" name="trnrName"></td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">성별</td>
	            <td>
	            	<input type="radio" name="trnrGender" value="M" checked>남
	            	<input type="radio" name="trnrGender" value="W">여
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" bgcolor="lightblue" align="center"> 개인 수업 정보</td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">관심분야</td>
	            <td>
	                <input type="checkbox" name="trnrLike" value="1">체형교정
	                <input type="checkbox" name="trnrLike" value="2">근력향상
	                <input type="checkbox" name="trnrLike" value="3">다이어트
	                <input type="checkbox" name="trnrLike" value="4">필라테스
	                <input type="checkbox" name="trnrLike" value="5">식단관리
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">자기소개</td>
	            <td>
	            	<textarea cols="50" style="margin: 0px; height: 200px; width:480px" name="trnrIntro"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">프로필 사진</td>
	            <td>
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">1회당 가격</td>
	            <td> <input size="15" type="text" name="trnrAmt"> <br/>
	            세부적인거 설정가능하게?-> 별도 테이블 빼야함
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">상담여부</td>
	            <td>
	            	<input type="radio" name="consultYn" value="Y">가능
	            	<input type="radio" name="consultYn" value="N" checked>불가능
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">예약거부</td>
	            <td>
	            	<input type="radio" name="refusalYn" value="Y">가능
	            	<input type="radio" name="refusalYn" value="N" checked>불가능
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">맛보기 수업 여부</td>
	            <td> 보류
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">자격사항</td>
	            <td> 보류
	            </td>
	        </tr>
	        <tr>
	            <td bgcolor="lightgrey" align="center">경력사항</td>
	            <td> 보류
	            </td>
	        </tr>
	    </tbody>
	    </table>
	        <p align="center">
	            <input type="button" onclick="join();" value="회원 가입"> 
	            <input type="reset" value="다시 입력"> 
	        </p>
	</form>

</div>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>