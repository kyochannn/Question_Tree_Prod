package com.example.MyWebProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.MyWebProject.serviceImpl.QuestionResultServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	QuestionResultServiceImpl userService;
	
	@GetMapping(value = "/loginPage")
	public ModelAndView loginPage() {
		ModelAndView mv = new ModelAndView("questionTree/user/loginPage");
		
		return mv;
	}
	
	@PostMapping("/processLogin")
    public ModelAndView  processLogin(@RequestParam String userName, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("[UserController - processLogin]");
		
		ModelAndView mv = new ModelAndView();
		
		// DB 로직 및 보안 강화 예정
		if ("qtadmin".equals(userName) && "qtadmin".equals(password)) {			
			System.out.println("사용자 인증 성공");
			mv.setViewName("redirect:/viewAdminPage");
			session.setAttribute("userName", "구교찬 개발자 및");
		} else if ("1004".equals(userName) && "1004".equals(password)) {
			System.out.println("사용자 인증 성공");			
			mv.setViewName("redirect:/viewAdminPage");
			session.setAttribute("userName", "이유나 개발자 및");
		} else if ("amy8552".equals(userName) && "chanmi0906".equals(password)) {
			System.out.println("사용자 인증 성공");			
			mv.setViewName("redirect:/viewAdminPage");
			session.setAttribute("userName", "임찬미");
		} else {
			System.out.println("사용자 인증 실패");
			redirectAttributes.addFlashAttribute("userName", userName);
			mv.setViewName("redirect:/loginPage");
		}

		/*
		UserBroker user = userService.authenticateUser(userName, password);
		
		System.out.println("isNotEmpty: " + ObjectUtils.isNotEmpty(user));
		
		mv.addObject("userName", userName);
		mv.setViewName("/user/login");
		
		if (ObjectUtils.isNotEmpty(user)) {
			// 로그인 사용자 로그 남기기
			userService.userLogToDatabase(user);
			session.setAttribute("loginUser", user);
			mv.setViewName("redirect:/");
		}
		*/
        return mv;
    }
	
	@GetMapping("/processLogout")
	public ModelAndView processLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/");
		return mv;
	}
	
}
