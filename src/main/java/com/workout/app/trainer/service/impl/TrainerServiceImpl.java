package com.workout.app.trainer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workout.app.trainer.dao.TrainerDao;
import com.workout.app.trainer.service.TrainerService;
import com.workout.app.trainer.vo.Trainer;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDao trainerDao;

	@Override
	public int insertJoin(Trainer trainer) {
		System.out.println(trainer);
		
		// 비밀번호 암호화 추가하기
		int result = trainerDao.insertJoin(trainer);
		return result;
	}

	@Override
	public Trainer selectOneMember(Trainer trainer) {
		System.out.println(trainer);
		Trainer result = trainerDao.selectOneMember(trainer);
		System.out.println(result);
		return result;
	}

}
