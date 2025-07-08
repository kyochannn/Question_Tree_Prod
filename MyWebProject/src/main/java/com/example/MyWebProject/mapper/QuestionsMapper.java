package com.example.MyWebProject.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.MyWebProject.broker.QuestionsMasterBroker;
import com.example.MyWebProject.broker.QuestionsBroker;


@Mapper
public interface QuestionsMapper {

	List<QuestionsMasterBroker> getQuestionsMasterAll();
	
	QuestionsMasterBroker getQuestionsMaster(String questionNo);
	
	// List<QuestionsBroker> getQuestionsAll(String questionNo);
	
	QuestionsBroker getQuestions(String userNo);
	
	void updateQuestions(QuestionsBroker broker);
	
	void insertQuestions(QuestionsBroker user);
	
}
