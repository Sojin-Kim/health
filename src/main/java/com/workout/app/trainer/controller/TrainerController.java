package com.workout.app.trainer.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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

	//트레이너_회원가입 등록
	@PostMapping("/insertJoin")
	public String insertJoin(Trainer trainer) {
		System.out.println(trainer);
		int result = trainerService.insertJoin(trainer);
		return "redirect:/trainer/login";
	}
	
	//트레이너_로그인 화면 호출
	@GetMapping("/login")
	public String trainerLogin(Model model) {
		return "trainer/login/login";
	}

	//트레이너_개인정보수정 화면 호출
	@GetMapping("/mypage")
	public String trainerMypage(Model model) {
		return "trainer/mypage";
	}

	//트레이너_개인정보수정 수정하기
	@PostMapping("/updateJoin")
	public String updateJoin(Trainer trainer) {
		System.out.println(trainer);
		int result = trainerService.updateJoin(trainer);
		return "redirect:/trainer/mypage";
	}

	//트레이너_비밀번호수정 화면 호출
	@GetMapping("/passwordPop")
	public String trainerPasswordPop(Model model) {
		return "trainer/passwordPop";
	}

	//트레이너_일정수정 화면 호출
	@GetMapping("/schedule")
	public String trainerSchedule(Model model) {
		return "trainer/schedule";
	}
	
	//트레이너_회원가입 화면 호출
	@ResponseBody
	@PostMapping("/selectOneMember")
	public Map<String, String> selectOneMember(Trainer trainer, Model model) throws Exception {
		System.out.println(trainer);
		Trainer sTrainer = trainerService.selectOneMember(trainer);
		model.addAttribute("result", sTrainer);

		System.out.println(sTrainer);
		Map<String, String> result = new HashMap<String, String>();
		ObjectMapper mapper = new ObjectMapper();
		String trainerString = mapper.writeValueAsString(sTrainer);
		if(sTrainer != null) {
			result.put("result", "200");
			result.put("trainer", trainerString);
		}else {
			result.put("result", "500");
		}
		return result;
	}

}
