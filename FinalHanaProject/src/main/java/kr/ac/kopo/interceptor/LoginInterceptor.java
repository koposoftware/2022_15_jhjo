package kr.ac.kopo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.ac.kopo.vo.MemberVO;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
			
		HttpSession session = request.getSession();
		
		String dest = request.getRequestURI();
		session.setAttribute(dest, dest);
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginVO");
		
		if(memberVO == null) {
			response.sendRedirect("/login");
			return false;
		}
			
		return true;
	}
	

}
