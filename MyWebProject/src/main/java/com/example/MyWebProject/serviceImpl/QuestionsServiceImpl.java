package com.example.MyWebProject.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.MyWebProject.broker.QuestionsBroker;
import com.example.MyWebProject.broker.QuestionsMasterBroker;
import com.example.MyWebProject.mapper.QuestionsMapper;
import com.example.MyWebProject.service.QuestionsService;

@Service
public class QuestionsServiceImpl implements QuestionsService {

	@Autowired
	private QuestionsMapper questionMapper;
	
	/**
	 * 질문지 마스터 테이블 전체 조회
	 * 
	 */
	@Override
	public List<QuestionsMasterBroker> getQuestionsMasterAll() {
		System.out.println("[QuestionsServiceImpl - getQuestionsMasterAll]");
	    try {
	        List<QuestionsMasterBroker> questionMasterList = questionMapper.getQuestionsMasterAll();
	        return questionMasterList;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getAllTestUsers 예외 발생: " + e.getMessage());
	        e.printStackTrace(); // 예외 상세 로그 출력
	        return new ArrayList<>(); // 빈 리스트 반환 (또는 null 반환 여부는 설계에 따라 결정)
	    }
	}
	
	/**
	 * 질문지 마스터 테이블 개별 조회
	 * 
	 */
	@Override
	public QuestionsMasterBroker getQuestionsMaster(String questionNo) {
		System.out.println("[QuestionsServiceImpl - getQuestionsMaster]");
	    try {
	        QuestionsMasterBroker questionMasterList = questionMapper.getQuestionsMaster(questionNo);
	        return questionMasterList;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getAllTestUsers 예외 발생: " + e.getMessage());
	        e.printStackTrace(); // 예외 상세 로그 출력
	        return null; // 빈 리스트 반환 (또는 null 반환 여부는 설계에 따라 결정)
	    }
	}
	
	/**
	 * 질문지 테이블 개별 조회
	 * 
	 */
	@Override
	public QuestionsBroker getQuestions(String questionNo) {
		System.out.println("[QuestionsServiceImpl - getQuestions]");
		
	    try {
	        QuestionsBroker questions = questionMapper.getQuestions(questionNo);
	        return questions;
	    } catch (Exception e) {
	        System.err.println("[ERROR] getAllTestUsers 예외 발생: " + e.getMessage());
	        e.printStackTrace(); // 예외 상세 로그 출력
	        return null; // 빈 리스트 반환 (또는 null 반환 여부는 설계에 따라 결정)
	    }
	}

	@Override
	public void updateQuestions(QuestionsBroker broker) {
		questionMapper.updateQuestions(broker);
	}

	@Override
	public void insertQuestions(QuestionsBroker user) {
		// TODO Auto-generated method stub
		
	}	
	
}
