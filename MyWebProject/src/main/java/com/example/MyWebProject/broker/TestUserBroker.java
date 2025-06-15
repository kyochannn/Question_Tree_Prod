package com.example.MyWebProject.broker;

public class TestUserBroker {
	
	private String userNo;				// 사용자 번호
	private String userName;			// 사용자 이름
	private String gender;				// 사용자 성별
	private String testResultType;		// 테스트 결과
	private int tetoScore;				// 테토 점수(수치)
	private int egenScore;				// 에겐 점수(수치)
	private int topPercent;				// 테토/에겐 수치 절댓값 (%)
	private int zScore;					// (tetoScore - egenScore) / 표준편차
	private String styleSelfcareResultType;		// 테스트 결과
	private int styleSelfcarePoint;		// 외적 스타일 및 자기관리 점수(수치)
	private String socialSkillResultType;		// 테스트 결과
	private int socialSkillPoint;		// 사회성 및 인간관계 점수(수치)
	private String innerTendencyResultType;		// 테스트 결과
	private int innerTendencyPoint;		// 내면 성향 및 감정 처리 방식(수치)
	private String ambitionResultType;		// 테스트 결과
	private int ambitionPoint;			// 야망 및 인생 태도(수치)
	private boolean isTesterMyself;		// 테스트 진행자 (나 - T, 다른 사람 - F)
	private String testDate;			// 테스트 진행 시각
	
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTestResultType() {
		return testResultType;
	}
	public void setTestResultType(String testResultType) {
		this.testResultType = testResultType;
	}
	public int getTetoScore() {
		return tetoScore;
	}
	public void setTetoScore(int tetoScore) {
		this.tetoScore = tetoScore;
	}
	public int getEgenScore() {
		return egenScore;
	}
	public void setEgenScore(int egenScore) {
		this.egenScore = egenScore;
	}
	public int getTopPercent() {
		return topPercent;
	}
	public void setTopPercent(int topPercent) {
		this.topPercent = topPercent;
	}
	public int getzScore() {
		return zScore;
	}
	public void setzScore(int zScore) {
		this.zScore = zScore;
	}
	public int getStyleSelfcarePoint() {
		return styleSelfcarePoint;
	}
	public void setStyleSelfcarePoint(int styleSelfcarePoint) {
		this.styleSelfcarePoint = styleSelfcarePoint;
	}
	public String getStyleSelfcareResultType() {
		return styleSelfcareResultType;
	}
	public void setStyleSelfcareResultType(String styleSelfcareResultType) {
		this.styleSelfcareResultType = styleSelfcareResultType;
	}
	public int getSocialSkillPoint() {
		return socialSkillPoint;
	}
	public void setSocialSkillPoint(int socialSkillPoint) {
		this.socialSkillPoint = socialSkillPoint;
	}
	public String getSocialSkillResultType() {
		return socialSkillResultType;
	}
	public void setSocialSkillResultType(String socialSkillResultType) {
		this.socialSkillResultType = socialSkillResultType;
	}
	public int getInnerTendencyPoint() {
		return innerTendencyPoint;
	}
	public void setInnerTendencyPoint(int innerTendencyPoint) {
		this.innerTendencyPoint = innerTendencyPoint;
	}
	public String getInnerTendencyResultType() {
		return innerTendencyResultType;
	}
	public void setInnerTendencyResultType(String innerTendencyResultType) {
		this.innerTendencyResultType = innerTendencyResultType;
	}
	public int getAmbitionPoint() {
		return ambitionPoint;
	}
	public void setAmbitionPoint(int ambitionPoint) {
		this.ambitionPoint = ambitionPoint;
	}
	public String getAmbitionResultType() {
		return ambitionResultType;
	}
	public void setAmbitionResultType(String ambitionResultType) {
		this.ambitionResultType = ambitionResultType;
	}
	public boolean isTesterMyself() {
		return isTesterMyself;
	}
	public void setTesterMyself(boolean isTesterMyself) {
		this.isTesterMyself = isTesterMyself;
	}
	public String getTestDate() {
		return testDate;
	}
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}

}
