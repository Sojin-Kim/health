package com.workout.app.machine.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Machine {
	
	private int mNum;		/* 번호 */
	private String mName;		/* 이름 */
	private String mMakeDate;    /* 등록일자 */
	private String mComment;        /* 설명 */
}
