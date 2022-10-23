package kr.ac.kopo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.service.MemberService;
import kr.ac.kopo.service.TextMessageService;
import kr.ac.kopo.vo.CalendarVO;
import kr.ac.kopo.vo.CardRankVO;
import kr.ac.kopo.vo.CartBenefitVO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.MultiCardRankVO;
import kr.ac.kopo.vo.RecommendedCardBenefitVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private TextMessageService textMessageService;
	

	
	@GetMapping("/login")
	public String loginGet(HttpServletRequest request) {
		
		request.setAttribute("memberVO", new MemberVO());
		
		return "member/login";
	}
	

	@PostMapping("/login")
	public String loginPost(@Valid MemberVO memberVO, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "member/login";
		}else {
			MemberVO authMember = memberService.login(memberVO);
			if(authMember == null) {
				model.addAttribute("loginMsg","id와 password가 유효하지 않습니다");
				return "member/login";
			}else {
				session.setAttribute("loginVO",authMember);
			}		
			String dest = (String)session.getAttribute("dest");
			if(dest == null) {
				return "redirect:/";
			}else{
				return "redirect:"+dest;
			}
			

		}
	

	}
	

	@GetMapping("/logout")
	public String logout(HttpSession session,SessionStatus sessionStatus) {
		System.out.println("sessionStatus : "+ sessionStatus);
		session.invalidate();
		sessionStatus.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/recommendCard")
	public ModelAndView recommandCard(HttpSession session){
		MemberVO member = (MemberVO)session.getAttribute("loginVO");
		int memberNum = member.getMemberNum();

//		신용카드 추천 목록 저장 중
		
		Map<String,Object> creditCardMap = new HashMap<>();
		List<CardRankVO> recommendedCreditCardList = new ArrayList<>();
		creditCardMap.put("memberNum", memberNum);
		creditCardMap.put("creditCardRankList",recommendedCreditCardList);
		
		memberService.showRecommendedCreditCardRank(creditCardMap);
		List<CardRankVO> creditCardList = (List<CardRankVO>)creditCardMap.get("creditCardRankList");
		

		
// 		카드를 6개만 보여주고 싶다! 
		
		while(creditCardList.size()>6) {
			creditCardList.remove(creditCardList.size()-1);
		}
		

		
//		체크카드 리스트 저장 중 
		
		Map<String,Object> checkCardMap = new HashMap<>();
		List<CardRankVO> recommendedCheckCardList = new ArrayList<>();
		checkCardMap.put("memberNum", memberNum);
		checkCardMap.put("checkCardRankList",recommendedCheckCardList);
		
		memberService.showRecommendedCheckCardRank(checkCardMap);
		List<CardRankVO> checkCardList = (List<CardRankVO>)checkCardMap.get("checkCardRankList");
		
//		카드를 6개만 보여주고 싶다! 
	
		
		while(checkCardList.size()>6) {
			checkCardList.remove(checkCardList.size()-1);
		}
		
		
//	 	멀티카드도 보여줘보자~! 
		Map<String,Object> multiCardMap = new HashMap<>();
		List<MultiCardRankVO> multiCardBenefitList = new ArrayList<>();
		
		
		multiCardMap.put("memberNum",memberNum);
		multiCardMap.put("multiCardBenefitList", multiCardBenefitList);
	
		
		memberService.showRecommendedMultiCard(multiCardMap);
		
		multiCardBenefitList =  (List<MultiCardRankVO>)multiCardMap.get("multiCardBenefitList");
		
		while(multiCardBenefitList.size()>3) {
			multiCardBenefitList.remove(multiCardBenefitList.size()-1);
		}		
			

		ModelAndView mav = new ModelAndView("member/recommendedCard");
		
		mav.addObject("creditCardList", creditCardList);
		mav.addObject("checkCardList", checkCardList);
		mav.addObject("multiCardList",multiCardBenefitList);
		
		
		return mav;
	}
	
	
//	json으로 여기서 받을 예정임 
	@ResponseBody
	@GetMapping("/noticeCardBenefit")
	public List<RecommendedCardBenefitVO> noticeCardBenefit(HttpSession session,@RequestParam("cardCateNum") String cardCateNum){
		
		Map<String,Object> memberMap = new HashMap<>();
		List<RecommendedCardBenefitVO> cardBenefitList = new ArrayList<>();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginVO");
		int memberNum = memberVO.getMemberNum();
		memberMap.put("memberNum",memberNum);
		memberMap.put("cardCateNum", cardCateNum);
		memberMap.put("recommendedCardBenefitList",cardBenefitList);
		
		memberService.showRecommendedCardBenefit(memberMap);
		
		List<RecommendedCardBenefitVO> recommendedCardBenefitList = (List<RecommendedCardBenefitVO>)memberMap.get("recommendedCardBenefitList");

		return recommendedCardBenefitList;
	}
	
	@ResponseBody
	@GetMapping("/calcBenefitInMyCart")
	public List<CartBenefitVO> calcBenefitInMyCart(HttpSession session,@RequestParam("cardCateNum") String cardCateNum){
		
		Map<String,Object> memberMap = new HashMap<>();
		List<CartBenefitVO> cardBenefitList = new ArrayList<>();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginVO");
		int memberNum = memberVO.getMemberNum();
		memberMap.put("memberNum",memberNum);
		memberMap.put("cardCateNum", cardCateNum);
		memberMap.put("recommendedCardBenefitList",cardBenefitList);
		
		memberService.calcBenefitInMyCart(memberMap);
		
		List<CartBenefitVO> recommendedCardBenefitList = (List<CartBenefitVO>)memberMap.get("recommendedCardBenefitList");
		
		
		return recommendedCardBenefitList;
	}
	
	@ResponseBody
	@GetMapping("/showSelectedCardBene")
	public List<RecommendedCardBenefitVO> showSelectedCardBenefit(@RequestParam("memberNum") String memberNum,@RequestParam("cardNum") String cardNum,@RequestParam("cardCateNum") String cardCateNum){
		Map<String,Object> selectedCardBenefitMap = new HashMap<>();
		List<RecommendedCardBenefitVO> obtainedBenefitList = new ArrayList<>();
		selectedCardBenefitMap.put("memberNum",memberNum);
		selectedCardBenefitMap.put("cardNum",cardNum);
		selectedCardBenefitMap.put("cardCateNum",cardCateNum);
		selectedCardBenefitMap.put("obtainedBenefitList",obtainedBenefitList);
		memberService.showSelectedCardBene(selectedCardBenefitMap);
		
		List<RecommendedCardBenefitVO> selectedCardBenefitList =(List<RecommendedCardBenefitVO>) selectedCardBenefitMap.get("obtainedBenefitList");
	
		
		return selectedCardBenefitList;
	}
	
	@ResponseBody
	@GetMapping("/addSelectedCardIntoCart")
	public void addSelectedCard(@RequestParam("cardCateNum") String cardCateNum,@RequestParam("memberNum") int memberNum) {
		
		Map<String,Object> cardMap = new HashMap<>();
		cardMap.put("cardCateNum", cardCateNum);
		cardMap.put("memberNum", memberNum);
		
		memberService.addSelectedCardIntoCart(cardMap);
	}
	
	@ResponseBody
	@GetMapping("/showMyCardCartList")
	public List<Map<String,Object>> showMyCardCartList(@RequestParam("memberNum") int memberNum){
		List<Map<String,Object>> cardCartList = memberService.showMyCardCart(memberNum);		
		return cardCartList;
	}
	
	@ResponseBody
	@GetMapping("/deleteMyWishedCard")
	public void deleteMyWishedCard(@RequestParam("memberNum") int memberNum,@RequestParam("cardCateNum") String cardCateNum){
		Map<String,Object> cardMap = new HashMap<>();
		cardMap.put("memberNum", memberNum);
		cardMap.put("cardCateNum", cardCateNum);
		memberService.deleteMyWishedCard(cardMap);
	}
	
	@ResponseBody
	@GetMapping("recommendCardInMyAge")
	public List<Map<String,Object>> recommendCardInMyAge(@RequestParam("age") int age){
		List<Map<String,Object>> cardList = memberService.recommendedCardInSameAge(age);
		while(cardList.size()>6) {
			cardList.remove(cardList.size()-1);
		}	
		
		return cardList;
	}
	@ResponseBody
	@GetMapping("recommendCardInMyCluster")
	public List<Map<String,Object>> recommendCardInMyCluster(@RequestParam("memberNum") int memberNum){
		List<Map<String,Object>> cardList = memberService.recommendedCardInCluster(memberNum);
		while(cardList.size()>6) {
			cardList.remove(cardList.size()-1);
		}
		return cardList;
	}
	
	
	@GetMapping("/moveConsumeCalendar")
	public ModelAndView moveToConsumeCalendar(HttpSession session) {
		ModelAndView mav = new ModelAndView("member/consumeCalendar");
		MemberVO memberVO = (MemberVO)session.getAttribute("loginVO");
		int memberNum = memberVO.getMemberNum();
		List<Map<String,Object>> accountList = memberService.showAccountList(memberNum);
		mav.addObject("accountList", accountList);
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/getCardImgFromAccount")
	public Map<String,String> getCardImgFromAccount(@RequestParam("memberNum") int memberNum, @RequestParam("accountNum") String accountNum) {

		Map<String,Object> accountMap = new HashMap<>();
		accountMap.put("memberNum",memberNum);
		accountMap.put("accountNum", accountNum);
		String cardImg = memberService.getCardImgFromAccount(accountMap);
		Map<String,String> cardImgMap = new HashMap<>();
		cardImgMap.put("cardImgUrl", cardImg);
		return cardImgMap;
	}
	
	@ResponseBody
	@GetMapping("/getCalendarList")
	public List<CalendarVO> getCalendarList(@RequestParam("memberNum") int memberNum){
		List<CalendarVO> calendarList = memberService.getCalendarList(memberNum);
		return calendarList;
	}
	
	@ResponseBody
	@GetMapping("/getTodoListInModal")
	public List<Map<String,Object>> getTodoListInModal(@RequestParam("memberNum") int memberNum){		
		List<Map<String,Object>> todoList = memberService.displayTodoList(memberNum);
		memberService.updateReadStatus(memberNum);				
		return todoList;
	}
	
	
	//메세지와 할일을 동시에 보내주는 기능! 
	@ResponseBody
	@GetMapping("/addTodoList")
	public void addTodoList(HttpSession httpSession,@ModelAttribute CalendarVO calendar,@RequestParam("accountNum") String accountNum,@RequestParam("smsMessage") String smsMessage,@RequestParam("messageConsentBlank") String messageConsentBlank) {
		Map<String,Object> calendarMap  = new HashMap<>();
		calendarMap.put("memberNum", calendar.getGroupId());
		calendarMap.put("start", calendar.getStart());
		calendarMap.put("end", calendar.getEnd());
		calendarMap.put("content", calendar.getContent());
		calendarMap.put("title", calendar.getTitle());
		calendarMap.put("writer",calendar.getWriter());
		calendarMap.put("textColor",calendar.getTextColor());
		calendarMap.put("borderColor",calendar.getBorderColor());
		calendarMap.put("backgroundColor", calendar.getBackgroundColor());
		calendarMap.put("allDay",0);
		
		
		memberService.addTodoList(calendarMap);
		
		//사용자한테 번호랑 이런거 넘겨주자~ 
		MemberVO memberVO = (MemberVO)httpSession.getAttribute("loginVO");
		String phoneNumber = memberVO.getPhoneNumber();
		
		textMessageService.sendAlertMessage(phoneNumber,calendar.getStart(),"["+calendar.getStart().substring(0,10)+"]에 "+smsMessage,messageConsentBlank);
		
	}
	
	
//	그냥 테스트용도 
	
	@GetMapping("/test")
	public String test() {
		
		return "test/test";
	}
	
	
}
