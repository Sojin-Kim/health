package com.workout.app.trainer.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Trainer {
	private String trnrId;			/* 아이디 */
	private String trnrPw;    		/* 비밀번호 */
	private String trnrName;        /* 이름 */
	private String trnrGender;		/* 성별 */

	private String trnrLike;		/* 관심분야 */
	private String trnrPhoto;		/* 사진 */
	private String trnrIntro;		/* 소개글 */
	private int trnrAmt=0;			/* 1회당 가격 */
	
	private String consultYn;		/* 상담여부 */
	private String refusalYn;		/* 회원거부여부 */

	private Date trnrDate;			/* 트레이너일자 */
	private String trnrTime;		/* 트레이너시간 */
	private List<Date> trnrDateList;		/* 트레이너일자목록 */
	private List<String> trnrTimeList;		/* 트레이너시간목록 */
	
	private String selectMonth;		/* 조회월 */
	private String rtnTrnrDate;		/* 조회트레이너일자 */
}
