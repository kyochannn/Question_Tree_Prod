package com.example.MyWebProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.MyWebProject.broker.QTUserBroker;


@Mapper
public interface QTUserMapper {

	QTUserBroker getQTUser(String userId, String password);
	
	List<QTUserBroker> getQTUserAll();
	
}
