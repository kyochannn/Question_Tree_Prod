package com.example.MyWebProject.service;

import java.util.List;

import com.example.MyWebProject.broker.TestUserBroker;


public interface QuestionResultService {
	
	public List<TestUserBroker> getAllTestUsers();

	public TestUserBroker getTestUser(String userNo);
	
	public void userLogToDatabase(TestUserBroker user);
	
	public void updateUserName(String userNo, String userName);
	
}
