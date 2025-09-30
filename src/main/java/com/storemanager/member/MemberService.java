package com.storemanager.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.storemanager.member.encoder.BCrypt;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	
	// Login 로직
	public String login(MemberDTO member) {
		String oldpw = memberMapper.login(member);
		boolean validate = has(member.getGm_pwd(), oldpw);
		if(!validate) {
			return "redirect:/";
		}
		
		return "in/in";
	}
	
	// Join 로직
	public String join(MemberDTO member) {
		String hashpw = encode(member);
		member.setGm_pwd(hashpw);
		int join = memberMapper.join(member);
		if(join == 0) {
			return "redirect:/joinV";
		}
		return "redirect:/";
	}
	
	// join Id Validation 로직
	public boolean joinIdValidation(String gm_id) {
		int target = memberMapper.joinIdValidation(gm_id);
		if(target == 0) return true;
		else return false;
	}
	
	public String encode(MemberDTO member) {
		if(member == null) throw new IllegalArgumentException();
		
		int cost = 11;
		String salt = BCrypt.gensalt(cost);
		return BCrypt.hashpw(member.getGm_pwd(), salt);
	}
	
	public boolean has(String param1, String param2) {
		return BCrypt.checkpw(param1, param2);
	}
	
}
