package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.ObtainedBenefitVO;

@Mapper
public interface CardDAO {
	public List<Map<String,Object>> showCardImage();
	public List<Map<String,Object>> cardDetailInModal(String cardSegNum);
	public List<Map<String,Object>> showNetworkImg(String cardSegNum);
	public List<Map<String,Object>> showCardDetailImg(String cardSegNum);
	public List<Map<String,Object>> showMyCard(Map<String,Object> memberMap);
	public List<Map<String,Object>> showMyCardBenefit(String cardCateNum);
	public int showMyRecentConsumeTrand_c(int memberNum);
	public int showMyRecentConsumeTrand_1(int memberNum);
	public int showMyRecentConsumeTrand_2(int memberNum);
	public List<Map<String,Object>> showMyRecentConsumeTransaction(int memberNum);
	public List<Map<String,Object>> findLastWeekConsume(String cardNum);
	public List<ObtainedBenefitVO> obtainedCardBenefit(Map<String,Object> benefitMap);
	public List<ObtainedBenefitVO> obtainedCardBenefit_3(Map<String,Object> benefitMap);
	public List<Map<String,Object>> showCardConsumeGraph2(String cardNum);
	
	public List<Map<String,Object>> showInfoAboutCard(String cardCateNum);
	
	public void showSelectedCardBeneAli(Map<String,Object> benefitMap);

}
