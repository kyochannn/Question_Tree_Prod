package com.example.MyWebProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.MyWebProject.broker.TestUserBroker;
import com.example.MyWebProject.mapper.TestUserMapper;
import com.example.MyWebProject.service.QuestionResultService;


@Service
public class QuestionResultServiceImpl implements QuestionResultService {

	@Autowired
	private TestUserMapper testUserMapper;

	@Override
	public List<TestUserBroker> getAllTestUsers() {
		System.out.println("[QuestionResultServiceImpl - getAllTestUsers]");
	    try {
	        List<TestUserBroker> userList = testUserMapper.getAllTestUsers();
	        return userList;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getAllTestUsers 예외 발생: " + e.getMessage());
	        e.printStackTrace(); // 예외 상세 로그 출력
	        return new ArrayList<>(); // 빈 리스트 반환 (또는 null 반환 여부는 설계에 따라 결정)
	    }
	}
	
	@Override
	public void updateUserName(String userNo, String userName) {
		System.out.println("[QuestionResultServiceImpl - updateUserName]");
		
		testUserMapper.updateUserName(userNo, userName);
	}
	
	@Override
	public TestUserBroker getTestUser(String userNo) {
		System.out.println("[QuestionResultServiceImpl - getTestUser]");
		TestUserBroker user = testUserMapper.getTestUser(userNo);
		
		return user;
	}
	
	@Override
	public void userLogToDatabase(TestUserBroker user) {
		System.out.println("[QuestionResultServiceImpl - userLogToDatabase]");
		
		testUserMapper.userLogToDatabase(user);
	}

	
}
