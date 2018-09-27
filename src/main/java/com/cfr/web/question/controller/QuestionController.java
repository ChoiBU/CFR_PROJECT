package com.cfr.web.question.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cfr.web.question.service.QuestionService;

@Controller
public class QuestionController {

	@Autowired QuestionService questionService;
	
	@RequestMapping(value= "/question/regist", method= RequestMethod.POST)
	public String regist(@RequestParam Map map, Model model)  {
		int result = questionService.regist(map);
		// 성공시 화면 바꿔야함
		model.addAttribute("forward_url", "/");
		model.addAttribute("flag", result);
		model.addAttribute("msg", "전송");
		return "/alert/alert";
	}
}
