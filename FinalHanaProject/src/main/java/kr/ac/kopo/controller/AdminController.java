package kr.ac.kopo.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.service.AdminService;
import kr.ac.kopo.vo.MailVO;
import kr.ac.kopo.vo.ResisteredCardBenefitVO;
import kr.ac.kopo.vo.ResisteredCardVO;
import kr.ac.kopo.vo.SelectedCardInfoByCate;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@PostMapping("/uploadCard")
	public String uploadFiles(@RequestParam("uploadfile")MultipartFile[] multipartFiles, @ModelAttribute ResisteredCardVO  resisteredCardVO) { // 파라미터의 이름은 client의 formData key값과 동일해야함
		System.out.println("ResisteredCardVO : "+resisteredCardVO);
		String UPLOAD_PATH = "";
		if(resisteredCardVO.getSortCard().equals("체크 카드")) {
			UPLOAD_PATH="C:/Users/wogml/Documents/HanaFinalProject/FinalHanaProject/src/main/resources/static/images/card/checkCard";
		}else if(resisteredCardVO.getSortCard().equals("신용 카드")) {
			UPLOAD_PATH="C:/Users/wogml/Documents/HanaFinalProject/FinalHanaProject/src/main/resources/static/images/card/creditCard";
		}else {
			UPLOAD_PATH="C:/Users/wogml/Documents/HanaFinalProject/FinalHanaProject/src/main/resources/static/images/card/multiCard";
		}
		String cardCateNum = adminService.displayCardPrefix(resisteredCardVO.getSortCard());
		
		if(resisteredCardVO.getSortCard().equals("체크 카드")) {
			cardCateNum = "CH"+ cardCateNum;
		}else if(resisteredCardVO.getSortCard().equals("신용 카드")) {
			cardCateNum = "CR"+ cardCateNum;
		}else {
			cardCateNum = "MU"+ cardCateNum;
		}
		
		Map<String,Object> resisteredCardMap = new HashMap<>();
		
		
		String cardSegNum = "SE"+adminService.displayCardSegPrefix();
		
		resisteredCardMap.put("cardName", resisteredCardVO.getCardName());
		resisteredCardMap.put("annualFee", resisteredCardVO.getAnnualFee());
		resisteredCardMap.put("annualFeeCode", resisteredCardVO.getAnnualCode());
		resisteredCardMap.put("cardSegNum", cardSegNum);
		resisteredCardMap.put("sortCard", resisteredCardVO.getSortCard());
		resisteredCardMap.put("cardCateNum",cardCateNum);
		

		Map<String,Object> resisteredCardCommentMap = new HashMap<>();
		resisteredCardCommentMap.put("cardCateNum",cardCateNum);
		resisteredCardCommentMap.put("commentOfCard",resisteredCardVO.getCommentOfCard());
		

		
		System.out.println("들어오는 카드는 뭘까요? : "+ resisteredCardVO);
		System.out.println("과연 들어오는 파일은? : "+multipartFiles);
		String imgName = "";
		int cardImgSuffixNum = Integer.parseInt(adminService.displayCardPrefix(resisteredCardVO.getSortCard()));
		
		System.out.println("cardImgSuffixNum:"+cardImgSuffixNum);
		
		int length = (int)(Math.log10(cardImgSuffixNum)+1);
		
		if(length==1) {
			imgName="0"+(cardImgSuffixNum);
		}else {
			imgName=""+(cardImgSuffixNum);
		}
		if(resisteredCardVO.getSortCard().equals("체크 카드")) {
			imgName="check"+imgName;
		}else if(resisteredCardVO.getSortCard().equals("신용 카드")) {
			imgName="credit"+imgName;
		}else {
			imgName="multi"+imgName;
		}
		adminService.resisterCardComment(resisteredCardCommentMap);
		adminService.resisterCardInfoInHanaFinder(resisteredCardMap);
			
		try {
	
			for(int i=0; i<multipartFiles.length; i++) {
				MultipartFile file = multipartFiles[i];              
				//String fileId = (new Date().getTime()) + "" + (new Random().ints(1000, 9999).findAny().getAsInt()); // 현재 날짜와 랜덤 정수값으로 새로운 파일명 만들기
				String fileId = imgName;
				String originName = file.getOriginalFilename(); // ex) 파일.jpg
				String fileExtension = originName.substring(originName.lastIndexOf(".") + 1); // ex) jpg
				//originName = originName.substring(0, originName.lastIndexOf(".")); // ex) 파일
				long fileSize = file.getSize(); // 파일 사이즈
				
				System.out.println("fileSize:"+fileSize);
				System.out.println("이미지 경로:"+UPLOAD_PATH+"/"+ fileId + "." + fileExtension);
				Map<String,Object> cardImgMap = new HashMap<>();
				//String imgUrl=UPLOAD_PATH+"/"+ fileId + "." + fileExtension;
				String imgUrl="";
				if(resisteredCardVO.getSortCard().equals("체크 카드")) {
					imgUrl = "images/card/checkCard";
				}else if(resisteredCardVO.getSortCard().equals("신용 카드")) {
					imgUrl = "images/card/creditCard";
				}else {
					imgUrl = "images/card/multiCard";
				}
				
				imgUrl = imgUrl+"/"+ fileId + "." + fileExtension;
				cardImgMap.put("cardCateNum",cardCateNum);
				cardImgMap.put("imgUrl",imgUrl);
				adminService.resisterCardImgInHanaFinder(cardImgMap);
				
				File fileSave = new File(UPLOAD_PATH, fileId + "." + fileExtension); // ex) fileId.jpg
				if(!fileSave.exists()) { // 폴더가 없을 경우 폴더 만들기
					fileSave.mkdirs();
				}
                
				file.transferTo(fileSave); // fileSave의 형태로 파일 저장
				
				System.out.println("fileId= " + fileId);
				System.out.println("originName= " + originName);
				System.out.println("fileExtension= " + fileExtension);
				System.out.println("fileSize= " + fileSize);
			}
		} catch(IOException e) {
			return "admin/cardSection";
		}
		
		return "admin/cardSection";
	}
	
	
	
	@GetMapping("/resisterCard")
	public ModelAndView resisterCard() {
		ModelAndView mav = new ModelAndView("admin/resisterCard");
		
		List<Map<String,Object>> aliList = adminService.displayAliInfoForCardResister();
		
		mav.addObject("aliList", aliList);
		
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/addCardBenefit")
	public String addBenefit(@ModelAttribute ResisteredCardBenefitVO resisteredCardBenefitVO) {
		//접두사 줘서 sequence value 제어하자~! 
		int basePerform = resisteredCardBenefitVO.getBasePerform();
		String beneCode = resisteredCardBenefitVO.getBeneCode();
		int beneLimit = resisteredCardBenefitVO.getBeneLimit();
		int beneRate = resisteredCardBenefitVO.getBeneRate();
		String beneType =resisteredCardBenefitVO.getBeneType();
		String sortCard = resisteredCardBenefitVO.getSortCard();
		String sortCardSuffix;
		
		if(sortCard.equals("체크 카드")) {
			sortCardSuffix="CH";
		}else if(sortCard.equals("신용 카드")) {
			sortCardSuffix="CR";
		}else {
			sortCardSuffix="MU";
		}
		ResisteredCardBenefitVO cardBenefit = new ResisteredCardBenefitVO();
		
		cardBenefit.setBasePerform(basePerform);
		cardBenefit.setBeneCode(beneCode);
		cardBenefit.setBeneLimit(beneLimit);
		cardBenefit.setBeneRate(beneRate);
		cardBenefit.setBeneType(beneType);
		cardBenefit.setSortCard(sortCard);
		cardBenefit.setSortCardSuffix(sortCardSuffix);
		System.out.println("cardBenefit:"+cardBenefit);
		
		adminService.resisterCardBenefit(cardBenefit);
		
		return "success";
	}
	
	@ResponseBody
	@GetMapping("/deleteCardBenefit")
	public String deleteResisteredCardBenefit(@RequestParam("beneCode") String beneCode,@RequestParam("sortCard") String sortCard){
		
		//접두사 줘서 sequence value 제어하자~! 
		ResisteredCardBenefitVO cardBenefit = new ResisteredCardBenefitVO();
		
		String sortCardSuffix;
		
		if(sortCard.equals("체크 카드")) {
			sortCardSuffix="CH";
		}else if(sortCard.equals("신용 카드")) {
			sortCardSuffix="CR";
		}else {
			sortCardSuffix="MU";
		}
		
		cardBenefit.setBeneCode(beneCode);
		cardBenefit.setSortCardSuffix(sortCardSuffix);
		cardBenefit.setSortCard(sortCard);

		adminService.deleteCardBenefit(cardBenefit);
		
		return "success";
	}
	
	
	@GetMapping("/moveDashBoard")
	public ModelAndView moveDashBoard() {
		ModelAndView mav = new ModelAndView("admin/dashBoard");
		List<Map<String,Object>> increaseRatio = adminService.showMemberIncreasement();
		
		List<Map<String,Object>> lastYearCardList = adminService.showTop10CardOneYearAgo();
		List<Map<String,Object>> thisYearCardList = adminService.showTop10CardThisYear();
		
		while(thisYearCardList.size()>10) {
			thisYearCardList.remove(thisYearCardList.size()-1);
		}
				
		List<Double> cardRatio = new ArrayList<>();
		 		
		for(int i=0;i<thisYearCardList.size();i++) {
			for(int j=0;j<lastYearCardList.size();j++) {
				if(thisYearCardList.get(i).get("CARD_NAME").equals(lastYearCardList.get(j).get("CARD_NAME"))){					
					cardRatio.add(Math.round((double)((double)Integer.parseInt(String.valueOf(thisYearCardList.get(i).get("OWNER_OF_CARD")))/Integer.parseInt(String.valueOf(lastYearCardList.get(i).get("OWNER_OF_CARD"))))*100)/100.0);					 
				}
			} 
		}	
		
		List<Map<String,Object>> spentMoneyMap = adminService.showSpentMoney();
		
		int clusterSum = adminService.countClustered();
		
		mav.addObject("clusterSum",clusterSum);
		mav.addObject("spentMoneyMap",spentMoneyMap);
		mav.addObject("increaseRatio",increaseRatio);
		mav.addObject("cardRatio",cardRatio);
		mav.addObject("thisYearCardList",thisYearCardList);
		
		return mav;
	}
		
	@GetMapping("showCustomerTransaction")
	@ResponseBody
	public List<Map<String,Object>> showRecentTransactionLast7Days(){
		List<Map<String,Object>> transactionList = adminService.showRecent7Days();
		return transactionList;
	}
	
	@GetMapping("showCustomerTransactionLast4Month")
	@ResponseBody
	public List<Map<String,Object>> showRecentTransactionLast4Month(){
		List<Map<String,Object>> transactionList = adminService.showRecent4MonthSum();
		return transactionList;		
	}
	
	@GetMapping("displayClusteredCharacter")
	@ResponseBody
	public List<Map<String,Object>> displayClusteredCharacter(@RequestParam("clusterNum") int clusterNum){
		List<Map<String,Object>> memberClusterList = adminService.displayClusteredCharacter(clusterNum);
		return memberClusterList;
	}
	
	@GetMapping("displayAverageAmount")
	@ResponseBody
	public int displayAverageAmount(@RequestParam("clusterNum") int clusterNum) {
		int averageSum = adminService.displayAverageAmount(clusterNum);
		return averageSum;
	}
	
	@GetMapping("displaytop3CardList")
	@ResponseBody
	public List<Map<String,Object>> displayTop3CardIncluster(@RequestParam("clusterNum") int clusterNum){
		List<Map<String,Object>> top3CardList = adminService.displayTop3CardIncluster(clusterNum);
		return top3CardList;
	}
	
	@GetMapping("displayCategoryAmount")
	@ResponseBody
	public List<Map<String,Object>> displayTopCategoryAmount(@RequestParam("clusterNum") int clusterNum){
		List<Map<String,Object>> categoryList = adminService.displayTopCategoryAmount(clusterNum);
		while(categoryList.size()>6) {
			categoryList.remove(categoryList.size()-1);
		}
		return categoryList;
	}
	@GetMapping("displayCategoryCount")
	@ResponseBody
	public List<Map<String,Object>> displayTopCategoryCount(@RequestParam("clusterNum") int clusterNum){
		List<Map<String,Object>> categoryList = adminService.displayTopCategoryCount(clusterNum);
		while(categoryList.size()>5) {
			categoryList.remove(categoryList.size()-1);
		}			
		return categoryList;
	}
	
	@GetMapping("/sendMail")
	public ModelAndView sendMail() {
		ModelAndView mav = new ModelAndView("admin/sendMail");
		int clusterSum = adminService.countClustered();
		mav.addObject("clusterSum",clusterSum);
		List<String> cardNameList = adminService.displayCardName("신용 카드");
		mav.addObject("cardNameList",cardNameList);
				
		return mav;
	}

	@PostMapping("/sendMail")
	public ModelAndView sendMail(MailVO mailVO,@RequestParam("hiddenCardName") String cardName) {
		System.out.println("cardName"+cardName);
		boolean answer = adminService.sendSimpleMesage(mailVO,cardName);
		System.out.println("answr : "+answer);
		ModelAndView mav = new ModelAndView("admin/sendMail");
		int clusterSum = adminService.countClustered();
		mav.addObject("clusterSum",clusterSum);
		List<String> cardNameList = adminService.displayCardName("신용 카드");
		mav.addObject("cardNameList",cardNameList);	
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/displayCardNameList")
	public List<String> displayCardNameList(@RequestParam("cardSort") String cardSort){
		List<String> cardNameList = adminService.displayCardName(cardSort);
		return cardNameList;
	}
	
	@ResponseBody
	@GetMapping("/displayCardNameList2")
	public List<String> displayCardNameList(){
		List<String> cardNameList = adminService.displayCardName2();
		return cardNameList;
	}
	
	
	@GetMapping("/displayCustomerInfo")
	@ResponseBody
	public List<Map<String,Object>> displayMemberInfoForMail(@RequestParam("clusterNum") int clusterNum){
		List<Map<String,Object>> mailList = adminService.displayMemberInfoForMail(clusterNum);
		return mailList; 
	}
	
	@GetMapping("/displayCardInfoByConsumeCate")
	@ResponseBody
	public List<SelectedCardInfoByCate> displayCardListByConsumeCate(@RequestParam("consumeCate") String consumeCate){
		
		Map<String,Object> consumeMap = new HashMap<>();
		List<SelectedCardInfoByCate> selectedCardList = new ArrayList<>();
		
		consumeMap.put("consumeCate", consumeCate);
		consumeMap.put("selectedCardList",selectedCardList);
		
		adminService.displayCardInfoByConsumeCate(consumeMap);
		
		List<SelectedCardInfoByCate> cardListByConsumeCate =(List<SelectedCardInfoByCate>) consumeMap.get("selectedCardList");
		
		return cardListByConsumeCate;		
	}



}
