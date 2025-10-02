package com.storemanager.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	MemberDTO login(MemberDTO member);
	
	int join(MemberDTO member);
	
	int joinIdValidation(String gm_id);
}
