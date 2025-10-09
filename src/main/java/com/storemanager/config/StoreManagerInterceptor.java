package com.storemanager.config;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/*
 * 생성일   : 2025-09-24
 * 최종수정 : 2025-09-24
 */
@Component
public class StoreManagerInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 기존 Session 가져오기
		HttpSession session = request.getSession(false);
		
		/* 다 만들면 주석 풀기
		if(session == null) {
			response.sendRedirect("/");
			return false;
		}
		*/
		
		return true;
	}
}
