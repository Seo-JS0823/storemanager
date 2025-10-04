package com.storemanager.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	MemberDTO login(String gm_id);
	
	int join(MemberDTO member);
	
	int joinIdValidation(String gm_id);
}
