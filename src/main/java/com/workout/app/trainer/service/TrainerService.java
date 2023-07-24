package com.workout.app.trainer.service;

import com.workout.app.trainer.vo.Trainer;

public interface TrainerService {

	int insertJoin(Trainer trainer);

	Trainer selectOneMember(Trainer trainer);

	int updateJoin(Trainer trainer);

	int updatePassword(Trainer trainer);

}
