package kr.ac.kopo.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.ac.kopo.service.AdminService;

@Component
public class ChatHandler extends TextWebSocketHandler{
	
    private static List<WebSocketSession> list = new ArrayList<>();
	
	private static Map<Integer,Object> alramMap = new HashMap<>();
	
	@Autowired
	private AdminService adminService;
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	
    	String payloadMessage = message.getPayload();
    	String [] arr =payloadMessage.split(":");
    	
    	alramMap.put(Integer.parseInt(arr[0]), session);
    
    	
    	System.out.println("alramMap : " + alramMap.size());
    	System.out.println("session은 해신? : "+session);
    	
    	
    	
    	
    	int todoListSize = adminService.getTodoListSize(Integer.parseInt(arr[0]));
    	
    	
    	session.sendMessage(new TextMessage("할일 목록은:"+todoListSize));
    	
		/*
		 * for(WebSocketSession sess: list) { sess.sendMessage(new
		 * TextMessage("안녕하세요")); sess.sendMessage(message);
		 * System.out.println("세션 확인중:"+sess); }
		 */
    	
    }

    /* Client가 접속 시 호출되는 메서드 */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
    	System.out.println("연결된 세션을 한번 보자!"+session);
        list.add(session);
        System.out.println("socket 연결 완료" + session);

    }

    /* Client가 접속 해제 시 호출되는 메서드드 */

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {


        list.remove(session);
        System.out.println("접속 끝겼냐?");
    }
}