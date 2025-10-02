package com.storemanager.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	/* 기본 루트 페이지 (로그인) */
	@GetMapping("/")
	public String loginForm() {
		return "member/test-out";
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
	
	/* 회원가입 ID Validation true: 사용 가능한 아이디 , false: 사용 불가능한 아이디 */
	@PostMapping("/api/member")
	@ResponseBody
	public String joinIdValidation(@RequestBody String gm_id) {
		if(memberService.joinIdValidation(gm_id)) {
			return "true";
		}
		return "false";
	}
	
}
