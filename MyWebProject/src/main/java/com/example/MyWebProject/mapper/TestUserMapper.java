package com.example.MyWebProject.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.MyWebProject.broker.TestUserBroker;


@Mapper
public interface TestUserMapper {

	List<TestUserBroker> getAllTestUsers();
	
	TestUserBroker getTestUser(String userNo);
	
	void updateUserName(String userNo, String userName);
	
	void userLogToDatabase(TestUserBroker user);
	
}
