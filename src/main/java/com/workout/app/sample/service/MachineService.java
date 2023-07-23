package com.workout.app.sample.service;

import java.util.List;

import com.workout.app.sample.vo.Machine;

public interface MachineService {

	int insertMachine(Machine machine);

	List<Machine> selectMachineList(Machine machine);

	Machine selectMachineOne(Machine machine);

	int updateMachine(Machine machine);

	int deleteMachine(Machine machine);

}
