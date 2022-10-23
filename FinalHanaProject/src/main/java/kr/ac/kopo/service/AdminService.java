package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.AdminDAO;
import kr.ac.kopo.vo.MailVO;
import kr.ac.kopo.vo.ResisteredCardBenefitVO;
import kr.ac.kopo.vo.ResisteredCardVO;
import kr.ac.kopo.vo.SelectedCardInfoByCate;


@Service
public class AdminService {
	
	
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 @Autowired
	 private AdminDAO adminDAO;
	 
	 
	public boolean sendSimpleMesage(MailVO mailVO,String cardName) {
		//SimpleMailMessage message = new SimpleMailMessage();
		//message.setFrom("jojaehee3679@gmail.com");
		//message.setTo("jaehee3679@daum.net");
		/*
		 * message.setTo(mailVO.getAddress());
		 */
		//message.setSubject(mailVO.getTitle());
		//message.setText(content);
		//message.setText(mailVO.getContent());
		
		//mailSender.send(message);
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");

				message.setTo("jaehee3679@daum.net");
				message.setFrom("jojaehee3679@gmail.com");	//env.getProperty("spring.mail.username")
				message.setSubject(mailVO.getTitle());
				message.setText("<html><head><meta charset='utf-8'/></head><body><div><img src='cid:logo' style='width:200px;'/></div><img src='cid:img' style='width:400px;'/><div style='font-family:pretendard;'>"+mailVO.getContent()+"</div></body></html>", true); //ture : html 형식 사용
				
				//Mail에 img 삽입
				ClassPathResource resource = new ClassPathResource("images/marketing/"+cardName);
				ClassPathResource resource2 = new ClassPathResource("images/marketing/logo.png");
				message.addInline("logo", resource2.getFile());
				message.addInline("img", resource.getFile());
			}
		};
		
		try{
			mailSender.send(preparator);
		} catch (MailException e){
			e.printStackTrace();
			return false;
		}
		return true;		
	}
	
	public void resisterCardInfo(ResisteredCardVO resisteredCardVO) {
		adminDAO.resisterCardInfo(resisteredCardVO);
	}
	
	
	
	public void resisterCardBenefit(ResisteredCardBenefitVO resisteredCardBenefitVO) {
		adminDAO.resisterCardBenefit(resisteredCardBenefitVO);
	}
	
	public void deleteCardBenefit(ResisteredCardBenefitVO resisteredCardBenefitVO) {
		adminDAO.deleteCardBenefit(resisteredCardBenefitVO);
	}
	
	public List<Map<String,Object>> showTop10CardThisYear(){
		List<Map<String,Object>> cardList = adminDAO.showTop10CardThisYear();
		return cardList;
	}
	
	public List<Map<String,Object>> showTop10CardOneYearAgo(){
		List<Map<String,Object>> cardList = adminDAO.showTop10CardOneYearAgo();
		return cardList;
	}	
	public List<Map<String,Object>> showMemberIncreasement(){
		List<Map<String,Object>> memberMap = adminDAO.showMemberIncreasement();
		return memberMap;
	}
	public List<Map<String,Object>> showSpentMoney(){
		List<Map<String,Object>> spentMoneyMap = adminDAO.showSpentMoney();
		return spentMoneyMap;
	}
	public int countClustered() {
		int clusterSum = adminDAO.countClustered();
		return clusterSum;
	}
	public List<Map<String,Object>> showRecent7Days(){
		List<Map<String,Object>> transactionList = adminDAO.showRecent7Days();
		return transactionList;
	}
	public List<Map<String,Object>> showRecent4MonthSum(){
		List<Map<String,Object>> transactionList = adminDAO.showRecent4MonthSum();
		return transactionList;
	}
	public int getTodoListSize(int memberNum) {
		int todoListSize = adminDAO.getTodoListSize(memberNum);
		return todoListSize;
	}
	public List<Map<String,Object>> displayClusteredCharacter(int clusterNum){
		List<Map<String,Object>> clusterList = adminDAO.displayClusteredCharacter(clusterNum);
		return clusterList;
	}
	public int displayAverageAmount(int clusterNum) {
		int averageAmount = adminDAO.displayAverageAmount(clusterNum);
		return averageAmount;
	}
	public List<Map<String,Object>> displayTop3CardIncluster(int clusterNum){
		List<Map<String,Object>> top3CardList = adminDAO.displayTop3CardIncluster(clusterNum);
		return top3CardList;
	}
	public List<Map<String,Object>> displayTopCategoryAmount(int clusterNum){
		List<Map<String,Object>> categoryList = adminDAO.displayTopCategoryAmount(clusterNum);
		return categoryList;
	}
	public List<Map<String,Object>> displayTopCategoryCount(int clusterNum){
		List<Map<String,Object>> categoryList = adminDAO.displayTopCategoryCount(clusterNum);
		return categoryList;
	}
	public List<Map<String,Object>> displayMemberInfoForMail(int clusterNum){
		List<Map<String,Object>> mailList = adminDAO.displayMemberInfoForMail(clusterNum);
		return mailList;
	}
	public List<String> displayCardName(String cardSort){
		List<String> cardNameList = adminDAO.displayCardName(cardSort);
		return cardNameList;
	}
	public List<String> displayCardName2(){
		List<String> cardNameList = adminDAO.displayCardName2();
		return cardNameList;
	}
	public List<Map<String,Object>> displayAliInfoForCardResister(){
		List<Map<String,Object>> aliList = adminDAO.displayAliInfoForCardResister();
		return aliList;
	}
	public void displayCardInfoByConsumeCate(Map<String,Object> consumeMap){
		adminDAO.displayCardInfoByConsumeCate(consumeMap);
	}
	public String displayCardPrefix(String cardSort) {
		String cardSuffix = adminDAO.displayCardPrefix(cardSort);
		return cardSuffix;
	}
	public String displayCardSegPrefix() {
		String cardSegPrefix = adminDAO.displayCardSegPrefix();
		return cardSegPrefix;
	}
	public void resisterCardInfoInHanaFinder(Map<String,Object> resisteredCardMap) {
		adminDAO.resisterCardInfoInHanaFinder(resisteredCardMap);
	}
	
	public void resisterCardComment(Map<String,Object> cardCommentMap) {
		adminDAO.resisterCardComment(cardCommentMap);
	}
	public void resisterCardImgInHanaFinder(Map<String,Object> cardImgMap) {
		adminDAO.resisterCardImgInHanaFinder(cardImgMap);
	}
	
}





	
	
	

