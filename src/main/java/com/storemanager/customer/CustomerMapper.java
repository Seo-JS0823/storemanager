package com.storemanager.customer;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CustomerMapper {
	//삭제되지 않은 목록 
	@Select("SELECT GCM_IDX, GCM_CODE, GCM_NAME, GCM_EMAIL, GCM_TEL, GCM_ADDR, GCM_REGDATE, GCM_DEL_FLAG "
			+ "FROM GE_COM_MEMBER "
			+ "WHERE GCM_DEL_FLAG = 'N' "
			+ "ORDER BY GCM_IDX DESC")
	//List<CustomerDTO>  getCustomerListIN();
	List<CustomerDTO> findAll(); 
	@Insert("INSERT INTO GE_COM_MEMBER (idx, code, name, email, tel, addr, regdate, del_flag) VALUES (#{idx}, #{code}, #{name}, #{email} , #{tel}, #{addr} ,#{regdate}, #{del_flag})")
	int insert(CustomerDTO customerDTO);
	
	@Update("UPDATE GE_COM_MEMBER SET name=#{name} email=#{email} tel=#{tel}")
	List<CustomerDTO> getCustomerListIN();
	
	
		
	
}
