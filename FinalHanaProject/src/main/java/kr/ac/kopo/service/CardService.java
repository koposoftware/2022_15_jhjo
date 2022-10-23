package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.CardDAO;
import kr.ac.kopo.vo.ObtainedBenefitVO;

@Service
public class CardService {
	@Autowired
	private CardDAO cardDAO;

	public List<Map<String,Object>> showCardImage(){
		List<Map<String,Object>> cardImageList = cardDAO.showCardImage();
		return cardImageList;
	}
	public List<Map<String,Object>> cardDetailInModal(String cardSegNum){
		List<Map<String,Object>> cardDetailList = cardDAO.cardDetailInModal(cardSegNum);
		return cardDetailList;
	}
	public List<Map<String,Object>> showNetworkImg(String cardSegNum){
		List<Map<String,Object>> cardNetworkList = cardDAO.showNetworkImg(cardSegNum);
		return cardNetworkList;
	}
	
	public List<Map<String,Object>> showCardDetailImg(String cardSegNum){
		List<Map<String,Object>> cardDetailImg = cardDAO.showCardDetailImg(cardSegNum);
		return cardDetailImg;
	}
	
	public List<Map<String,Object>> showMyCard(Map<String,Object> memberMap){
		List<Map<String,Object>> myCardList = cardDAO.showMyCard(memberMap);
		return myCardList;
	}
	public List<Map<String,Object>> showMyCardBenefit(String cardCateNum){
		List<Map<String,Object>> myCardBenefitList = cardDAO.showMyCardBenefit(cardCateNum);
		return myCardBenefitList;
	}
	public int showMyRecentConsumeTrand_c(int memberNum) {
		int consumeSum= cardDAO.showMyRecentConsumeTrand_c(memberNum);
		return consumeSum;
	}
	public int showMyRecentConsumeTrand_1(int memberNum) {
		int consumeSum= cardDAO.showMyRecentConsumeTrand_1(memberNum);
		return consumeSum;
	}
	public int showMyRecentConsumeTrand_2(int memberNum) {
		int consumeSum= cardDAO.showMyRecentConsumeTrand_2(memberNum);
		return consumeSum;
	}
	
	public List<Map<String,Object>> showMyRecentConsumeTransaction(int memberNum){
		List<Map<String,Object>> recentConsumeTransactionList = cardDAO.showMyRecentConsumeTransaction(memberNum);
		return recentConsumeTransactionList;
	}
	public List<Map<String,Object>> findLastWeekConsume(String cardNum){
		List<Map<String,Object>> recentLastWeekConsume = cardDAO.findLastWeekConsume(cardNum);
		return recentLastWeekConsume;
	}
	public List<ObtainedBenefitVO> obtainedCardBenefit(Map<String,Object> benefitMap){
		List<ObtainedBenefitVO> obtainedBenefitList = cardDAO.obtainedCardBenefit(benefitMap);
		return obtainedBenefitList;
	}
	
	public List<ObtainedBenefitVO> obtainedCardBenefit_3(Map<String,Object> benefitMap){
		List<ObtainedBenefitVO> obtainedBenefitList = cardDAO.obtainedCardBenefit_3(benefitMap);
		return obtainedBenefitList;
	}
	
	public List<Map<String,Object>> showCardConsumeGraph2(String cardNum){
		List<Map<String,Object>> myCardConsumeList = cardDAO.showCardConsumeGraph2(cardNum);
		return myCardConsumeList;
	}
	
	
	public List<Map<String,Object>> showInfoAboutCard(String cardCateNum){
		List<Map<String,Object>> cardInfoList = cardDAO.showInfoAboutCard(cardCateNum);
		return cardInfoList;
	}
	
	public void showSelectedCardBeneAli(Map<String,Object> benefitMap){
		cardDAO.showSelectedCardBeneAli(benefitMap);
	}

}
