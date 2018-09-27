package com.cfr.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.cfr.web.favorite.service.FavoriteService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	FavoriteService favoriteService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome home! The client locale is {}.", locale);
		List list = favoriteService.recentReg(map);
		List list2 = favoriteService.rankReg(map);
	
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return "home";
	}
	
	// 테스트용
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
		
		return "test";
	}
	
}
