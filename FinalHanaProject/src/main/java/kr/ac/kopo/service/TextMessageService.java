package kr.ac.kopo.service;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class TextMessageService {
	
	public void sendAlertMessage(String phoneNumber,String date,String message,String messageConsentBlank) {
		String api_key = "api키 감춤";
		String api_secret = "api키 감춤";
		Message coolsms = new Message(api_key,api_secret);
		
		System.out.println("동의 상태가 뭐가 들어오려나?"+messageConsentBlank);
		System.out.println("날짜가 뭐가 들어오려나? : " + date);
		int sendDay= Integer.parseInt(date.substring(9,10))-1;
		String sendDate = date.substring(0,4) + date.substring(5,7)+date.substring(8,9)+sendDay;
	    LocalTime now = LocalTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");         // 포맷 적용하기        
        String sendTime = now.format(formatter); 
		System.out.println("sendDate : " + sendDate);
		System.out.println("sendTime : " + sendTime);
		System.out.println("message : " + message);
	    HashMap<String, String> params = new HashMap<>();
	    params.put("to", phoneNumber);      // 수신자
	    params.put("from", "01029523679");   // 발신자
	    params.put("type", "sms");
	    params.put("text", message);
	    //params.put("datetime", "20220921210601");
	    
	    System.out.println(params);
	    
		
		try { 
			coolsms.send(params); // 메세지 전송 
			}catch(CoolsmsException e) {
			System.out.println(e.getMessage()); 
		}
		
		
	}

}
