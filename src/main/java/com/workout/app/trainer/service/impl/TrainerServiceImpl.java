package com.workout.app.trainer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workout.app.trainer.dao.TrainerDao;
import com.workout.app.trainer.service.TrainerService;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDao trainerDao;

}
