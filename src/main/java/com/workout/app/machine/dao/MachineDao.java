package com.workout.app.machine.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.workout.app.machine.vo.Machine;

@Mapper
public interface MachineDao {

	int insertMachine(Machine machine);

	List<Machine> selectMachineList(Machine machine);

	Machine selectMachineOne(Machine machine);

	int updateMachine(Machine machine);

	int deleteMachine(Machine machine);

}
