package com.example.MyWebProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.MyWebProject.broker.QTUserBroker;
import com.example.MyWebProject.mapper.QTUserMapper;
import com.example.MyWebProject.service.QTUserService;


@Service
public class QTUserServiceImpl implements QTUserService {

	@Autowired
	private QTUserMapper qtUserMapper;

	@Override
	public QTUserBroker getQTUser(String userId, String password) {
		System.out.println("[QTUserServiceImpl - getQTUser]");
		
	    try {
	    	QTUserBroker user = qtUserMapper.getQTUser(userId, password);
	        return user;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getQTUser 예외 발생: " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	}

	@Override
	public List<QTUserBroker> getQTUserAll() {
		System.out.println("[QTUserServiceImpl - getQTUserAll]");
		
	    try {
	    	List<QTUserBroker> userList = qtUserMapper.getQTUserAll();
	        return userList;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getQTUser 예외 발생: " + e.getMessage());
	        e.printStackTrace();
	        return new ArrayList<>();
	    }
	}

}
