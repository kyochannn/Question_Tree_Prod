package com.example.MyWebProject.service;

import java.util.List;

import com.example.MyWebProject.broker.QTUserBroker;


public interface QTUserService {

	public QTUserBroker getQTUser(String userId, String password);
	
	public List<QTUserBroker> getQTUserAll();
	
}
