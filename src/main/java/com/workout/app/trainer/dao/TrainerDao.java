package com.workout.app.trainer.dao;

import org.apache.ibatis.annotations.Mapper;

import com.workout.app.trainer.vo.Trainer;

@Mapper
public interface TrainerDao {

	int insertJoin(Trainer trainer);

}