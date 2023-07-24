package com.workout.app.machine.service;

import java.util.List;

import com.workout.app.machine.vo.Machine;

public interface MachineService {

	int insertMachine(Machine machine);

	List<Machine> selectMachineList(Machine machine);

	Machine selectMachineOne(Machine machine);

	int updateMachine(Machine machine);

	int deleteMachine(Machine machine);

}
