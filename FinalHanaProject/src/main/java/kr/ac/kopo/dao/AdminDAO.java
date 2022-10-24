package kr.ac.kopo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.ResisteredCardBenefitVO;
import kr.ac.kopo.vo.ResisteredCardVO;
import kr.ac.kopo.vo.SelectedCardInfoByCate;

@Mapper
public interface AdminDAO {
	public void resisterCardInfo(ResisteredCardVO resisteredCardVO);
	public void resisterCardBenefit(ResisteredCardBenefitVO resisteredBenefitVO);
	public void deleteCardBenefit(ResisteredCardBenefitVO resisteredCardBenefitVO);
	public List<Map<String,Object>> showTop10CardThisYear();
	public List<Map<String,Object>>	showTop10CardOneYearAgo();
	public List<Map<String,Object>> showMemberIncreasement();
	public List<Map<String,Object>> showSpentMoney();
	public int countClustered();
	public List<Map<String,Object>> showRecent7Days();
	public List<Map<String,Object>> showRecent4MonthSum();
	public int getTodoListSize(int memberNum);
	public List<Map<String,Object>> displayClusteredCharacter(int clusterNum);
	public int displayAverageAmount(int clusterNum);
	public List<Map<String,Object>> displayTop3CardIncluster(int clusterNum);
	public List<Map<String,Object>> displayTopCategoryCount(int clusterNum);
	public List<Map<String,Object>> displayTopCategoryAmount(int clusterNum);
	
	public List<Map<String,Object>> displayMemberInfoForMail(int clusterNum);
	
	public List<String> displayCardName(String cardSort);
	public List<String> displayCardName2();
	
	
	public List<Map<String,Object>> displayAliInfoForCardResister();
	
	public void displayCardInfoByConsumeCate(Map<String,Object> consumeMap);
	
	public String displayCardPrefix(String cardSort);
	
	public String displayCardSegPrefix();
	
	public void resisterCardInfoInHanaFinder(Map<String,Object> resisteredCardMap);
	
	public void resisterCardComment(Map<String,Object> cardCommentMap);
	
	public void resisterCardImgInHanaFinder(Map<String,Object> cardImgMap);
}
