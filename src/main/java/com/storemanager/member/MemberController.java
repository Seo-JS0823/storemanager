package com.storemanager.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.storemanager.member.encoder.BCryptPasswordEncoder;

import jakarta.servlet.http.HttpSession;

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
	public String login(HttpSession session, MemberDTO member) {
		MemberDTO target = memberService.login(member);
		if(target == null) return "redirect:/";
		
		session.setAttribute("gm_id", target.getGm_id());
		session.setAttribute("gm_name", target.getGm_name());
		session.setAttribute("gm_level", target.getGm_level());
		
		return "member/test-in";
	}
	
	@PostMapping("/member-profile")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> memberProfile(@RequestBody String id) {
		return memberService.profile(id);
	}
	
	/* 회원가입 페이지 */
	@GetMapping("/joinV")
	public String joinForm() {
		return "member/join";
	}
	
	/* 회원가입 실행 */
	@PostMapping("/join")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> join(
			@RequestPart("gm_image") MultipartFile file, 
			@RequestPart("member") String memberData) {
		return memberService.join(file, memberData);
	}
	
	/* 사용자 프로필 미리보기 */
	@GetMapping("uploads/{fileName}")
	@ResponseBody
	public ResponseEntity<byte[]> thumb(@PathVariable("fileName") String fileUrl) {
		return memberService.thumb(fileUrl);
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
	
	/* 로그아웃 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/* 회원정보변경 */
	@PostMapping("/profile-update")
	@ResponseBody
	public ResponseEntity<Map<String, String>> profileUpdate(
			@RequestPart(value = "file", required = false) MultipartFile file,
			@RequestPart("member") String member) {
		return memberService.profileUpdate(file, member);
	}
	
}













