package com.storemanager.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 로그인 실패시 URL
	@GetMapping("/no")
	public String loginFalse(Model model) {
		model.addAttribute("message" , "로그인이 필요한 서비스입니다.");
		return "member/login";
	}
	
	// 로그인 아이디와 비번이 맞지 않을 때
	@GetMapping("/noid")
	public String loginIdFalse(Model model) {
		model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		return "member/login";
	}
	
	// 로그인 URL
	@PostMapping("/login")
	public String login(HttpSession session, MemberDTO member) {
		MemberDTO target = memberService.login(member);
		if(target == null) return "redirect:/noid";
		
		session.setAttribute("gm_id", target.getGm_id());
		session.setAttribute("gm_name", target.getGm_name());
		session.setAttribute("gm_level", target.getGm_level());
		session.setAttribute("login", true);
		
		return "member/pg-out";
		//return "dashboard/dash";
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
	
	/* 비밀번호 찾기 페이지 */
	@GetMapping("/profile-findV")
	public String profileFindView() {
		return "member/find";
	}
	
	/* 비밀번호 찾기 전 아이디, 이메일 검증 */
	@PostMapping("/profile-find-call")
	@ResponseBody
	public ResponseEntity<String> profileFindCall(@RequestBody String target) {
		return memberService.profileFindCall(target);
	}
	
	/* 비밀번호 찾기 - 변경 */
	@PostMapping("/profile-find")
	@ResponseBody
	public ResponseEntity<String> profileFind(@RequestBody String target) {
		return memberService.profileFind(target);
	}
	
}













