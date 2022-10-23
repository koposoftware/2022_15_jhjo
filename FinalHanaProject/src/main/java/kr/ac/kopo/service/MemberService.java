package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.CalendarVO;
import kr.ac.kopo.vo.CartBenefitVO;
import kr.ac.kopo.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberVO login(MemberVO memberVO) {
		MemberVO authMember = memberDAO.login(memberVO);
		return authMember;
	}
	public void showRecommendedCheckCardRank(Map<String,Object> memberMap) {
		memberDAO.recommendedCheckCardRank(memberMap);
	}
	
	public void showRecommendedCreditCardRank(Map<String,Object> memberMap) {
		memberDAO.recommendedCreditCardRank(memberMap);
	}
	
	public void showRecommendedCardBenefit(Map<String,Object> memberMap) {
		memberDAO.recommendedCardBenefit(memberMap);
	}
	public List<CartBenefitVO> calcBenefitInMyCart(Map<String,Object> memberMap){
		List<CartBenefitVO> cardBenefit = memberDAO.calcBenefitInMyCart(memberMap);
		return cardBenefit;
	}
	
	
	public void showSelectedCardBene(Map<String,Object> benefitMap){
		memberDAO.showSelectedCardBene(benefitMap);
	}
	public void addSelectedCardIntoCart(Map<String,Object> cardMap){
		memberDAO.addSelectedCardIntoCart(cardMap);
	}
	public List<Map<String,Object>> showMyCardCart(int memberNum) {
		List<Map<String,Object>> cardCartList = memberDAO.showMyCardCart(memberNum);
		return cardCartList;
	}
	public void deleteMyWishedCard(Map<String,Object> cardMap) {
		memberDAO.deleteMyWishedCard(cardMap);
	}
	public List<Map<String,Object>> showAccountList(int memberNum){
		List<Map<String,Object>> accountList = memberDAO.showMyAccount(memberNum);
		return accountList;
	}
	public String getCardImgFromAccount(Map<String,Object> accountMap) {
		String cardImg = memberDAO.getCardImgFromAccount(accountMap);
		return cardImg;
	}
	public List<CalendarVO> getCalendarList(int memberNum){
		List<CalendarVO> calendarList = memberDAO.getMyCalendar(memberNum);
		return calendarList;
	}
	public void addTodoList(Map<String,Object> calendarMap) {
		memberDAO.addMyTodoList(calendarMap);
	}
	public List<Map<String,Object>> displayTodoList(int memberNum){
		List<Map<String,Object>> todoList = memberDAO.displayTodoList(memberNum);
		return todoList;
	}
	public void updateReadStatus(int memberNum) {
		memberDAO.updateReadStatus(memberNum);
	}
	
	
	public void showRecommendedMultiCard(Map<String,Object> multiCardMap) {
		memberDAO.showMultiCardBenefit(multiCardMap);
	}
	
	public List<Map<String,Object>> recommendedCardInSameAge(int age){
		List<Map<String,Object>> recommendedCardList = memberDAO.recommendedCardInSameAge(age);
		return recommendedCardList;
	}
	public List<Map<String,Object>> recommendedCardInCluster(int memberNum){
		List<Map<String,Object>> recommendedCardList = memberDAO.recommendedCardInCluster(memberNum);
		return recommendedCardList;
	}
}
