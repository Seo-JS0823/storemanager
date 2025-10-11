<<<<<<< HEAD
package com.storemanager.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	MemberDTO login(String gm_id);
	
	int join(MemberDTO member);
	
	int joinIdValidation(String gm_id);
	
	int profileUpdate(MemberDTO member);
}
=======
package com.storemanager.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	MemberDTO login(MemberDTO member);
	
	int join(MemberDTO member);
	
	int joinIdValidation(String gm_id);
}
>>>>>>> fe880323677131d19633a252e168557fc548128b
