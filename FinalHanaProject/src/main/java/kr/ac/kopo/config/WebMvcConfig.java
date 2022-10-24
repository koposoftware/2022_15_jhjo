package kr.ac.kopo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.ac.kopo.interceptor.LoginInterceptor;




@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/board/detail/**","/checkMyCard","/recommendCard","/moveConsumeCalendar");
	
	}
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
	     registry.addMapping("/**")
	            .allowedOrigins("http://localhost:3000")
	            .allowedMethods("OPTIONS", "GET", "POST", "PUT", "DELETE");
	}

	@Bean
	public MultipartResolver multipartResolver() {
		StandardServletMultipartResolver resolver = new StandardServletMultipartResolver();
		return resolver;
	}
	

	  
}
