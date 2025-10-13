package com.storemanager.member.encoder;

import com.storemanager.member.MemberDTO;

public class BCryptPasswordEncoder {

	public static String encode(MemberDTO member) {
		if(member == null) throw new IllegalArgumentException();
		
		int cost = 11;
		String salt = BCrypt.gensalt(cost);
		return BCrypt.hashpw(member.getGm_pwd(), salt);
	}
	
	public static boolean has(String param1, String param2) {
		return BCrypt.checkpw(param1, param2);
	}
}
