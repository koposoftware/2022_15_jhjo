package kr.ac.kopo.controller;



import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.service.CardService;
import kr.ac.kopo.vo.CardVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.ObtainedBenefitVO;
import kr.ac.kopo.vo.RecommendedCardBenefitVO;



@Controller
public class CardController{
	
	@Autowired
	private CardService cardService;

	
	
	
	@GetMapping("/cardSection")
	public String cardResister() {
		return "admin/cardSection";
	}
	
	

	
	@ResponseBody
	@PostMapping("/showCardImage")
	public List<Map<String,Object>> showCardImage(){

		List<Map<String,Object>> cardImageList = cardService.showCardImage();

		return cardImageList;
	}
	@ResponseBody
	@GetMapping("/showCardImage")
	public List<Map<String,Object>> showCardImage2(){

		List<Map<String,Object>> cardImageList = cardService.showCardImage();

		return cardImageList;
	}
	
	
	@ResponseBody
	@PostMapping("/showCardDetailInModal")
	public List<Map<String,Object>> cardDetailInModal(@RequestParam("cardCateNum") String cardCateNum){
		List<Map<String,Object>> cardDetailList= cardService.cardDetailInModal(cardCateNum);
		return cardDetailList;
	}
	
	
	@ResponseBody
	@GetMapping("/showNetworkImg")
	public List<Map<String,Object>> showNetworkImg(@RequestParam("cardCateNum") String cardCateNum){
		List<Map<String,Object>> cardNetworkList = cardService.showNetworkImg(cardCateNum);
		return cardNetworkList;
	}
	
	@ResponseBody
	@GetMapping("/showCardDetailImg")
	public List<Map<String,Object>> showCardDetailImg(@RequestParam("cardCateNum") String cardCateNum){
		List<Map<String,Object>> CardDetailImg = cardService.showCardDetailImg(cardCateNum);
		return CardDetailImg;
	}
	
	@GetMapping("/checkMyCard")
	public ModelAndView checkMyCard(HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("loginVO");
		int memberNum = memberVO.getMemberNum();
		Map<String,Object> memberMap = new HashMap<>();
		memberMap.put("memberNum", memberNum);
		List<CardVO> myCardInfoList = new ArrayList<>();
		memberMap.put("myCardInfoList", myCardInfoList);
		
		cardService.showMyCard(memberMap);
		
		List<CardVO> myCardList = (List<CardVO>) memberMap.get("myCardInfoList");
		
		
		ModelAndView mav = new ModelAndView("member/checkMyCard");
		mav.addObject("myCardList", myCardList);
		int myCardListSize = myCardList.size();
		mav.addObject("myCardListSize",myCardListSize);
		
		int sumC = cardService.showMyRecentConsumeTrand_c(memberNum);
		int sum1 = cardService.showMyRecentConsumeTrand_1(memberNum);
		int sum2 = cardService.showMyRecentConsumeTrand_2(memberNum);
		
		int difference = sumC-sum1;
		String message = " ";
		String messageColor = " ";
		String incrementType ="";
		DecimalFormat formatter = new DecimalFormat("###,###");
		if(difference<0) {
			message = formatter.format((-1)*difference)+"원";
			messageColor ="red";
			incrementType=" 감소했습니다.";
		}else{
			message = formatter.format(difference)+"원";
			messageColor ="blue";
			incrementType=" 증가했습니다.";
		}
		
		mav.addObject("sumC",sumC);
		mav.addObject("sum1",sum1);
		mav.addObject("sum2",sum2);
		mav.addObject("message",message);
		mav.addObject("messageColor",messageColor);
		mav.addObject("incrementType",incrementType);
		return mav;
	}
	
	
	@ResponseBody
	@GetMapping("/showMyCardBenefit")
	public List<Map<String,Object>> showMyCardBenefit(@RequestParam("myCardId") String myCardId){
		List<Map<String,Object>> myCardBenefitList = cardService.showMyCardBenefit(myCardId);
		return myCardBenefitList;
	}
	@ResponseBody
	@GetMapping("/showMyConsumeTransaction")
	public List<Map<String,Object>> showMyConsumeTransaction(@RequestParam("memberNum") int memberNum){
		List<Map<String,Object>> myConsumeTransactionList = cardService.showMyRecentConsumeTransaction(memberNum);
		return myConsumeTransactionList;
	}
	
	@ResponseBody
	@GetMapping("/findLastWeekConsume")
	public List<Map<String,Object>> findLastWeekConsume(@RequestParam("cardNum") String cardNum){
		Map<String,Object> memberMap = new HashMap<>();
		memberMap.put("cardNum", cardNum);
		List<Map<String,Object>> lastWeekConsumeList = cardService.findLastWeekConsume(cardNum);
		return lastWeekConsumeList;
	}
	@ResponseBody
	@GetMapping("/showObtainedBenefit")
	public List<ObtainedBenefitVO> showObtainedBenefit(@RequestParam("cardNum") String cardNum){
		List<ObtainedBenefitVO> obtainedBenefitList = new ArrayList<>();
		Map<String,Object> obtainedCardBenefitMap = new HashMap<>();
		obtainedCardBenefitMap.put("cardNum", cardNum);
		obtainedCardBenefitMap.put("obtainedCardBenefitList", obtainedBenefitList);
		cardService.obtainedCardBenefit(obtainedCardBenefitMap);
		List<ObtainedBenefitVO> myObtainedBenefitList = (List<ObtainedBenefitVO>) obtainedCardBenefitMap.get("obtainedCardBenefitList");
		
		return myObtainedBenefitList;
	}
	@ResponseBody
	@GetMapping("/showObtainedBenefit_3")
	public List<ObtainedBenefitVO> showObtainedBenefit_3(@RequestParam("cardNum") String cardNum){
		List<ObtainedBenefitVO> obtainedBenefitList = new ArrayList<>();
		Map<String,Object> obtainedCardBenefitMap = new HashMap<>();
		obtainedCardBenefitMap.put("cardNum", cardNum);
		obtainedCardBenefitMap.put("obtainedCardBenefitList", obtainedBenefitList);
		cardService.obtainedCardBenefit_3(obtainedCardBenefitMap);
		List<ObtainedBenefitVO> myObtainedBenefitList = (List<ObtainedBenefitVO>) obtainedCardBenefitMap.get("obtainedCardBenefitList");
		
		return myObtainedBenefitList;
	}
	
	
	
	@ResponseBody
	@GetMapping("/showCardConsumeGraph2")
	public List<Map<String,Object>> showCardConsumeGraph2(@RequestParam("cardNum") String cardNum){
		List<Map<String,Object>> myCardConsumeList = cardService.showCardConsumeGraph2(cardNum);
		return myCardConsumeList;
	}
	
	@ResponseBody
	@GetMapping("/giveMeCardList")
	public List<CardVO> giveMeCardList(@RequestParam("memberNum") String memberNum){
		Map<String,Object> cardMap = new HashMap<>();
		List<CardVO> cardList = new ArrayList<>();
		
		cardMap.put("memberNum", memberNum);
		cardMap.put("myCardInfoList", cardList);
		
		cardService.showMyCard(cardMap);
		
		List<CardVO> myCardList=(List<CardVO>)cardMap.get("myCardInfoList");

		return myCardList;
	}
	
	
	@ResponseBody
	@GetMapping("/showInfoAboutCard")
	public List<Map<String,Object>> showInfoAboutCard(@RequestParam("cardCateNum") String cardCateNum){
		List<Map<String,Object>> cardInfo = cardService.showInfoAboutCard(cardCateNum);
		return cardInfo;
	}

	@ResponseBody
	@GetMapping("/showSelectedCardBeneAli")
	public List<ObtainedBenefitVO> showSelectedCardBenefitAli(@RequestParam("memberNum") String memberNum,@RequestParam("cardNum") String cardNum,@RequestParam("cardCateNum") String cardCateNum){
		Map<String,Object> selectedCardBenefitMap = new HashMap<>();
		
		List<ObtainedBenefitVO> obtainedBenefitList = new ArrayList<>();
		selectedCardBenefitMap.put("memberNum",memberNum);
		selectedCardBenefitMap.put("cardNum",cardNum);
		selectedCardBenefitMap.put("cardCateNum",cardCateNum);
		selectedCardBenefitMap.put("obtainedBenefitList",obtainedBenefitList);
		
		cardService.showSelectedCardBeneAli(selectedCardBenefitMap);
		
		List<ObtainedBenefitVO> selectedCardBenefitList =(List<ObtainedBenefitVO>) selectedCardBenefitMap.get("obtainedBenefitList");

		return selectedCardBenefitList;
	}	
	
	
}