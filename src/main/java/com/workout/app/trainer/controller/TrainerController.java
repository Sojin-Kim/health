package com.workout.app.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workout.app.trainer.service.TrainerService;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

	@Autowired
	private TrainerService trainerService;

	//트레이너_로그인 화면 호출
	@GetMapping("/login")
	public String memberList(Model model) {
		return "trainer/login";
	}
	
}
