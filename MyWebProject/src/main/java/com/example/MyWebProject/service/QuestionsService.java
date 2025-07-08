package com.example.MyWebProject.service;

import java.util.List;
import com.example.MyWebProject.broker.QuestionsBroker;
import com.example.MyWebProject.broker.QuestionsMasterBroker;

public interface QuestionsService {
	
	public List<QuestionsMasterBroker> getQuestionsMasterAll();
	
	public QuestionsMasterBroker getQuestionsMaster(String questionNo);
	
	// public List<QuestionsBroker> getQuestionsAll(String questionNo);
	
	public QuestionsBroker getQuestions(String questionNo);
	
	public void updateQuestions(QuestionsBroker broker);
	
	public void insertQuestions(QuestionsBroker user);
	
}
