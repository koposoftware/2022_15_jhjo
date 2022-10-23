package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.CalendarVO;
import kr.ac.kopo.vo.CartBenefitVO;
import kr.ac.kopo.vo.MemberVO;


@Mapper
public interface MemberDAO {
	
	public MemberVO login(MemberVO memberVO);
	public void recommendedCheckCardRank(Map<String,Object> memberMap);
	public void recommendedCreditCardRank(Map<String,Object> memberMap);
	public void recommendedCardBenefit(Map<String,Object> memberMap);
	public List<CartBenefitVO> calcBenefitInMyCart(Map<String,Object> memberMap);
	public void showSelectedCardBene(Map<String,Object> benefitMap);
	public void addSelectedCardIntoCart(Map<String,Object> cardMap);
	public List<Map<String,Object>> showMyCardCart(int memberNum);
	public void deleteMyWishedCard(Map<String,Object> cardMap);
	public List<Map<String,Object>> showMyAccount(int memberNum);
	public String getCardImgFromAccount(Map<String,Object> accountMap);
	public List<CalendarVO> getMyCalendar(int memberNum);
	public void addMyTodoList(Map<String,Object> calendarMap);
	
	public List<Map<String,Object>> displayTodoList(int memberNum);
	
	public void updateReadStatus(int memberNum);
	
	public void showMultiCardBenefit(Map<String,Object> multiCardMap);
	
	public List<Map<String,Object>> recommendedCardInSameAge(int age);
	public List<Map<String,Object>> recommendedCardInCluster(int memberNum);
	
	
}
