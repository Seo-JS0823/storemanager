package com.storemanager.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class StoreManagerConfig implements WebMvcConfigurer {
	
	@Autowired
	private StoreManagerInterceptor interceptor;
	
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		/*
		 * 포트번호 정해지면 첫 번째, 두 번째 allowedOrigins 포트부분 바꾸기 (바꾸면 주석 삭제)
		 */
		registry.addMapping("/**")
		        .allowedOrigins("http://192.*:9090")
		        .allowedOrigins("http://localhost:9090")
		        .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
		        .allowedHeaders("*")
		        .allowCredentials(true)
		        .maxAge(3600);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		        .addPathPatterns("/**")
		        .excludePathPatterns(
		        "/", "/api/", "/css/**", "/img/**", "/js/**"
		        );
	}
	
}
