package com.workout.app.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workout.app.trainer.service.TrainerService;
import com.workout.app.trainer.vo.Trainer;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

	@Autowired
	private TrainerService trainerService;

	//트레이너_회원가입 화면 호출
	@GetMapping("/join")
	public String trainerJoin(Model model) {
		return "trainer/login/join";
	}

	//트레이너_로그인 화면 호출
	@PostMapping("/insertJoin")
	public String insertJoin(Trainer trainer) {
		System.out.println(trainer);
		int result = trainerService.insertJoin(trainer);
		return "index";
	}
	
	//트레이너_로그인 화면 호출
	@GetMapping("/login")
	public String trainerLogin(Model model) {
		return "trainer/login/login";
	}
	
}
