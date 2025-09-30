package com.storemanager.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	/* 기본 루트 페이지 (로그인) */
	@GetMapping("/")
	public String loginForm() {
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(MemberDTO member) {
		return memberService.login(member);
	}
	
	/* 회원가입 페이지 */
	@GetMapping("/joinV")
	public String joinForm() {
		return "member/join";
	}
	
	/* 회원가입 실행 */
	@PostMapping("/join")
	public String join(MemberDTO member) {
		return memberService.join(member);
	}
	
}
