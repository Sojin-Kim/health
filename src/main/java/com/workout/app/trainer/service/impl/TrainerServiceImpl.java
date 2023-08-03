package com.workout.app.trainer.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workout.app.machine.vo.Machine;
import com.workout.app.trainer.dao.TrainerDao;
import com.workout.app.trainer.service.TrainerService;
import com.workout.app.trainer.vo.Trainer;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDao trainerDao;

	@Override
	public int insertJoin(Trainer trainer) {
		// 비밀번호 암호화 추가하기
		int result = trainerDao.insertJoin(trainer);
		return result;
	}

	@Override
	public Trainer selectOneMember(Trainer trainer) {
		Trainer result = trainerDao.selectOneMember(trainer);
		return result;
	}

	@Override
	public int updateJoin(Trainer trainer) {
		int result = trainerDao.updateJoin(trainer);
		return result;
	}

	@Override
	public int updatePassword(Trainer trainer) {
		int result = trainerDao.updatePassword(trainer);
		return result;
	}

	@Override
	public int insertOneDay(Trainer trainer) {
		int result = 0;
		// 기존 하루 데이터 지우고 다시 저장
		for(Date date : trainer.getTrnrDateList()) {
			trainer.setTrnrDate(date);
			result = trainerDao.deleteOneDay(trainer);	// 하루 데이터 삭제
			for(String time : trainer.getTrnrTimeList()) {
				trainer.setTrnrTime(time);
				result = trainerDao.insertOneDay(trainer);	// 하루 시간별 추가
			}
		}
		return result;
	}

	@Override
	public List<Trainer> selectMonthTime(Trainer trainer) {
		List<Trainer> result = trainerDao.selectMonthTime(trainer);
		return result;
	}
	
}
