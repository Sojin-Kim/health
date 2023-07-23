package com.workout.app.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.workout.app.sample.service.MachineService;
import com.workout.app.sample.vo.Machine;

@Controller
@RequestMapping("/machine")
public class MachineController {

	@Autowired
	private MachineService machineService;

	//메인 화면 호출
	@GetMapping("/sample")
	public String sample(Model model) {
		return "sample/sample";
	}
	
	// 전체 리스트 조회
	@ResponseBody
	@PostMapping("/selectMachineList")
	public Map<String, String> selectMachineList(Machine machine, Model model) throws Exception {
		System.out.println(machine);
		List<Machine> sMachine = machineService.selectMachineList(machine);
		model.addAttribute("result", sMachine);

		System.out.println(sMachine);

		Map<String, String> result = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String machineString = mapper.writeValueAsString(sMachine);
		if(sMachine != null) {
			result.put("result", "200");
			result.put("machine", machineString);
		}else {
			result.put("result", "500");
		}
		System.out.println(result);
		return result;
	}

	// 전체 리스트 조회
	@ResponseBody
	@PostMapping("/selectMachineOne")
	public Map<String, String> selectMachineOne(Machine machine, Model model) throws Exception {
		System.out.println(machine);
		Machine sMachine = machineService.selectMachineOne(machine);
		model.addAttribute("result", sMachine);

		System.out.println(sMachine);

		Map<String, String> result = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String machineString = mapper.writeValueAsString(sMachine);
		if(sMachine != null) {
			result.put("result", "200");
			result.put("machine", machineString);
		}else {
			result.put("result", "500");
		}
		System.out.println(result);
		return result;
	}

	//메인 화면 호출
	@GetMapping("/insertMachineForm")
	public String insertMachineForm(Model model) {
		return "sample/insertMachineForm";
	}

	//메인 화면 호출
	@GetMapping("/updateMachineForm")
	public String updateMachineForm(Model model) {
		return "sample/updateMachineForm";
	}
	
	//insert
	@ResponseBody
	@PostMapping("insertMachineAction")
	public Map<String, String> insertMachine(Machine machine) {
		int iMachine = machineService.insertMachine(machine);
		Map<String, String> result = new HashMap<String, String>();
		System.out.println(iMachine);
		if(iMachine > 0) {
			result.put("result", "200");
		}else {
			result.put("result", "500");
		}
		return result;
	}

	//update
	@ResponseBody
	@PostMapping("updateMachineAction")
	public Map<String, String> updateMachine(Machine machine) {
		int uMachine = machineService.updateMachine(machine);
		Map<String, String> result = new HashMap<String, String>();
		if(uMachine > 0) {
			result.put("result", "200");
		}else {
			result.put("result", "500");
		}
		return result;
	}

	//delete
	@ResponseBody
	@PostMapping("deleteMachineAction")
	public Map<String, String> deleteMachine(Machine machine) {
		int dMachine = machineService.deleteMachine(machine);
		Map<String, String> result = new HashMap<String, String>();
		if(dMachine > 0) {
			result.put("result", "200");
		}else {
			result.put("result", "500");
		}
		return result;
	}
	
}
