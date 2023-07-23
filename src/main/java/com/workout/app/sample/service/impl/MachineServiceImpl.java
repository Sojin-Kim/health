package com.workout.app.sample.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workout.app.sample.dao.MachineDao;
import com.workout.app.sample.service.MachineService;
import com.workout.app.sample.vo.Machine;
import com.workout.app.trainer.vo.Trainer;

@Service
public class MachineServiceImpl implements MachineService{

	@Autowired
	private MachineDao machineDao;

	@Override
	public int insertMachine(Machine machine) {
		System.out.println(machine);
		
		int result = machineDao.insertMachine(machine);
		return result;
	}

	@Override
	public List<Machine> selectMachineList(Machine machine) {
		List<Machine> result = machineDao.selectMachineList(machine);
		System.out.println(result);
		return result;
	}

	@Override
	public Machine selectMachineOne(Machine machine) {
		Machine result = machineDao.selectMachineOne(machine);
		System.out.println(result);
		return result;
	}

	@Override
	public int updateMachine(Machine machine) {
		System.out.println(machine);
		
		int result = machineDao.updateMachine(machine);
		return result;
	}
	
	@Override
	public int deleteMachine(Machine machine) {
		System.out.println(machine);
		
		int result = machineDao.deleteMachine(machine);
		return result;
	}
}
