package com.storemanager.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	String login(MemberDTO member);
	
	int join(MemberDTO member);
}
