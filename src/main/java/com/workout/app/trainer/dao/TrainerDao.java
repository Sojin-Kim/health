package com.workout.app.trainer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.workout.app.trainer.vo.Trainer;

@Mapper
public interface TrainerDao {

	int insertJoin(Trainer trainer);

	Trainer selectOneMember(Trainer trainer);

	int updateJoin(Trainer trainer);

	int updatePassword(Trainer trainer);

	int deleteOneDay(Trainer trainer);
	
	int insertOneDay(Trainer trainer);

	List<Trainer> selectMonthTime(Trainer trainer);
}
