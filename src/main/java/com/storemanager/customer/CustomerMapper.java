package com.storemanager.customer;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CustomerMapper {
	//삭제되지 않은 목록 
	/*
	 * @Select("SELECT GCM_IDX, GCM_CODE, GCM_NAME, GCM_EMAIL, GCM_TEL, GCM_ADDR, GCM_REGDATE, GCM_DEL_FLAG "
	 * + "FROM GE_COM_MEMBER " + "WHERE GCM_DEL_FLAG = 'N' " +
	 * "ORDER BY GCM_IDX DESC") //List<CustomerDTO> getCustomerListIN();
	 * List<CustomerDTO> findAll();
	 */ 
	/*
	 * @Insert("INSERT INTO GE_COM_MEMBER (idx, code, name, email, tel, addr, regdate, del_flag) VALUES (#{idx}, #{code}, #{name}, #{email} , #{tel}, #{addr} ,#{regdate}, #{del_flag})"
	 * ) int insert(CustomerDTO customerDTO);
	 */
	@Select("""
			SELECT
				GCM_IDX			AS gcm_Idx,
				GCM_CODE		AS gcm_Code,
				GCM_NAME		AS gcm_Name,
				GCM_EMAIL		AS gcm_Email,
				GCM_TEL			AS gcm_Tel,
				GCM_ADDR		AS gcm_Addr,
				GCM_REGDATE		AS gcm_Regdate,
				GCM_DEL_FLAG	AS gcm_Del_Flag
				FROM 	GE_COM_MEMBER
				WHERE	GCM_DEL_FLAG = 'N'
				ORDER	BY	GCM_IDX DESC
			""")
	List<CustomerDTO> findAll();
	
	
	@Select("""
		   SELECT
			    GCM_IDX			AS gcm_Idx,
				GCM_CODE		AS gcm_Code,
				GCM_NAME		AS gcm_Name,
				GCM_EMAIL		AS gcm_Email,
				GCM_TEL			AS gcm_Tel,
				GCM_ADDR		AS gcm_Addr,
				GCM_REGDATE		AS gcm_Regdate,
				GCM_DEL_FLAG	AS gcm_Del_Flag
			FROM GE_COM_MEMBER
			WHERE GCM_IDX	=	#{idx}
			""")
		CustomerDTO findOne(@Param("idx")Long idx);

	@Insert("""
		    INSERT INTO GE_COM_MEMBER(
		        GCM_CODE, GCM_NAME, GCM_EMAIL, GCM_TEL, GCM_ADDR, GCM_REGDATE, GCM_DEL_FLAG
		    ) VALUES (
		        #{gcm_Code}, #{gcm_Name}, #{gcm_Email}, #{gcm_Tel}, #{gcm_Addr}, NOW(), 'N'
		    )
		""")
		int insert(CustomerDTO dto);


	int update(CustomerDTO dto);


	int softDelete(Long idx);


	List<CustomerDTO> search(String keyword);
	
	/*
	 * // keyword 있으면 매칭
	 * 
	 * @Select(""" <script> SELECT GCM_IDX AS gcmIdx, GCM_CODE AS gcmCode, GCM_NAME
	 * AS gcmName, GCM_EMAIL AS gcmEmail, GCM_TEL AS gcmTel, GCM_ADDR AS gcmAddr,
	 * GCM_REGDATE AS gcmRegdate, GCM_DEL_FLAG AS gcmDelFlag FROM GE_COM_MEMBER
	 * WHERE GCM_DEL_FLAG = 'N' <if test="keyword != null and keyword != ''"> AND(
	 * GCM_NAME LIKE '%' || #{keyword} || '%' OR GCM_EMAIL LIKE '%' || #{keyword} ||
	 * '%' OR GCM_TEL LIKE '%' || #{keyword} || '%' OR GCM_ADDR LIKE '%' ||
	 * #{keyword} || '%' OR GCM_CODE LIKE '%' || #{keyword} || '%' ) </if> ORDER BY
	 * GCM_IDX DESC </script> """) List<CustomerDTO> search(String keyword);
	 */




	
		
	
}