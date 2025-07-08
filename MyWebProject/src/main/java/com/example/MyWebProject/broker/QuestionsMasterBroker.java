package com.example.MyWebProject.broker;

public class QuestionsMasterBroker {
	
	private String questionNo;
	private String userId;
	private String questionName;
	private String questionImgUrl;
	private String createdDate;
	private String updatedDate;
	
	// getter, setter
	public String getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(String questionNo) {
		this.questionNo = questionNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionName() {
		return questionName;
	}
	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}
	public String getQuestionImgUrl() {
		return questionImgUrl;
	}
	public void setQuestionImgUrl(String questionImgUrl) {
		this.questionImgUrl = questionImgUrl;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public String getUpdatedDate() {
		return updatedDate;
	}
	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	// toSting
	@Override
	public String toString() {
		return "QuestionsMasterBroker [questionNo=" + questionNo + ", userId=" + userId + ", questionName="
				+ questionName + ", questionImgUrl=" + questionImgUrl + ", createdDate=" + createdDate
				+ ", updatedDate=" + updatedDate + "]";
	}
		
}
