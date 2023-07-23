package com.workout.app.sample.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.workout.app.sample.vo.Machine;

@Mapper
public interface MachineDao {

	int insertMachine(Machine machine);

	List<Machine> selectMachineList(Machine machine);

	Machine selectMachineOne(Machine machine);

	int updateMachine(Machine machine);

	int deleteMachine(Machine machine);

}
