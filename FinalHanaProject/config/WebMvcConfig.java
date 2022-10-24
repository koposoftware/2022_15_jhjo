package kr.ac.kopo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;




@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		//resistry.addInterceptors(new LoginInterceptor()).addPathPatterns("/board/detail/**");
	
	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
	     registry.addMapping("/**")
	            .allowedOrigins("http://localhost:3000")
	            .allowedMethods("OPTIONS", "GET", "POST", "PUT", "DELETE");
	}

	    

	  
}
