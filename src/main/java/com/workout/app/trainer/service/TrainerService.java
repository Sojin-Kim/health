package com.workout.app.trainer.service;

import java.util.List;

import com.workout.app.trainer.vo.Trainer;

public interface TrainerService {

	int insertJoin(Trainer trainer);

	Trainer selectOneMember(Trainer trainer);

	int updateJoin(Trainer trainer);

	int updatePassword(Trainer trainer);

	int insertOneDay(Trainer trainer);

	List<Trainer> selectMonthTime(Trainer trainer);

}
