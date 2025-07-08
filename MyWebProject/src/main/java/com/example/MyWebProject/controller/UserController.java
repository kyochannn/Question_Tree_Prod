package com.example.MyWebProject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.MyWebProject.broker.QTUserBroker;
import com.example.MyWebProject.broker.QuestionsMasterBroker;
import com.example.MyWebProject.serviceImpl.QTUserServiceImpl;
import com.example.MyWebProject.serviceImpl.QuestionResultServiceImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	QTUserServiceImpl qtUserService;
	
	// ==================== [이하 페이지 이동 method] ====================
	
	/**
	 * 로그인 페이지 이동
	 * 
	 * @return
	 */
	@GetMapping(value = "/loginPage")
	public ModelAndView loginPage() {
		ModelAndView mv = new ModelAndView("questionTree/user/loginPage");
		
		return mv;
	}
	
	/**
	 * 로그아웃 후 index 페이지 이동
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/processLogout")
	public ModelAndView processLogout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/");
		return mv;
	}
	
	/**
	 * 모든 사용자 정보 가져오기
	 * 
	 * @param session
	 * @return
	 */
	@GetMapping("/userInfoUpdateForAdmin")
	public ModelAndView userInfoUpdateForAdmin(HttpSession session) {
		
		// 로그인한 사용자 정보 가져오기
		String userId = (String) session.getAttribute("userId");
		ModelAndView mv = new ModelAndView();
		
		if (userId == null) {
			mv.setViewName("redirect:/loginPage");
		} else {
			List<QTUserBroker> userList = qtUserService.getQTUserAll();
			System.out.println("userList.size(): " + userList.size());
			
			
			mv.setViewName("questionTree/user/userInfoUpdateForAdminPage");
			mv.addObject("userList", userList);
		}
		
		return mv;
	}
	
	// ==================== [이하 처리 method] ====================
	
	@PostMapping("/processLogin")
    public ModelAndView  processLogin(@RequestParam String userId, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
		System.out.println("[UserController - processLogin]");
		
		QTUserBroker userBorker = qtUserService.getQTUser(userId, password);
		
		ModelAndView mv = new ModelAndView();
		
		if (userBorker != null) {
			System.out.println(userId + "로 로그인을 진행한 사용자 인증 성공");
			mv.setViewName("redirect:/viewAdminPage");
			session.setAttribute("userId", userBorker.getUserId());
			session.setAttribute("userName", userBorker.getUserName());
			session.setAttribute("userStatus", userBorker.getUserStatus());
		} else {
			System.out.println(userId + "로 로그인을 진행한 사용자 인증 실패");
			redirectAttributes.addFlashAttribute("userId", userId);
			mv.setViewName("redirect:/loginPage");
		}
		
		/*
		 * 사용자 로그 활성화
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
	
}
