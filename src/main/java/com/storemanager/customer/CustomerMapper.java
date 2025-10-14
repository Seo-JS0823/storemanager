package com.storemanager.customer;

import java.time.LocalDate;
import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CustomerMapper {

    //  전체 목록 조회 (삭제되지 않은 고객)
    @Select("""
        SELECT
            GCM_IDX         AS gcm_Idx,
            GCM_CODE        AS gcm_Code,
            GCM_NAME        AS gcm_Name,
            GCM_EMAIL       AS gcm_Email,
            GCM_TEL         AS gcm_Tel,
            GCM_ADDR        AS gcm_Addr,
            DATE_FORMAT(GCM_REGDATE, '%Y-%m-%d')     AS gcm_Regdate,
            GCM_DEL_FLAG    AS gcm_Del_Flag
        FROM GE_COM_MEMBER
        WHERE GCM_DEL_FLAG = 'N'
        ORDER BY GCM_IDX DESC
        """)
    List<CustomerDTO> findAll();


    //  단일 조회 (상세보기)
    @Select("""
        SELECT
            GCM_IDX         AS gcm_Idx,
            GCM_CODE        AS gcm_Code,
            GCM_NAME        AS gcm_Name,
            GCM_EMAIL       AS gcm_Email,
            GCM_TEL         AS gcm_Tel,
            GCM_ADDR        AS gcm_Addr,
            GCM_REGDATE     AS gcm_Regdate,
            GCM_DEL_FLAG    AS gcm_Del_Flag
        FROM GE_COM_MEMBER
        WHERE GCM_IDX = #{idx}
        """)
    CustomerDTO findOne(@Param("idx") Long idx);


    //  키워드 검색 (단일)
    @Select("""
        <script>
        SELECT
            GCM_IDX         AS gcm_Idx,
            GCM_CODE        AS gcm_Code,
            GCM_NAME        AS gcm_Name,
            GCM_EMAIL       AS gcm_Email,
            GCM_TEL         AS gcm_Tel,
            GCM_ADDR        AS gcm_Addr,
            GCM_REGDATE     AS gcm_Regdate,
            GCM_DEL_FLAG    AS gcm_Del_Flag
        FROM GE_COM_MEMBER
        WHERE GCM_DEL_FLAG = 'N'
        <if test="keyword != null and keyword != ''">
            AND (
                GCM_NAME LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_EMAIL LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_TEL LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_ADDR LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_CODE LIKE CONCAT('%', #{keyword}, '%')
            )
        </if>
        ORDER BY GCM_IDX DESC
        </script>
        """)
    List<CustomerDTO> search(@Param("keyword") String keyword);


    //  키워드 + 날짜 검색 (날짜 구간 + 키워드 둘 다 가능)
    @Select("""
        <script>
        SELECT
            GCM_IDX         AS gcm_Idx,
            GCM_CODE        AS gcm_Code,
            GCM_NAME        AS gcm_Name,
            GCM_EMAIL       AS gcm_Email,
            GCM_TEL         AS gcm_Tel,
            GCM_ADDR        AS gcm_Addr,
            GCM_REGDATE     AS gcm_Regdate,
            GCM_DEL_FLAG    AS gcm_Del_Flag
        FROM GE_COM_MEMBER
        WHERE GCM_DEL_FLAG = 'N'
        
        <if test="keyword != null and keyword != ''">
            AND (
                GCM_NAME LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_EMAIL LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_TEL LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_ADDR LIKE CONCAT('%', #{keyword}, '%')
                OR GCM_CODE LIKE CONCAT('%', #{keyword}, '%')
            )
        </if>
        
        <if test="startdate != null">
            AND GCM_REGDATE &gt;= #{startdate}
        </if>
        
        <if test="endExclusive != null">
            AND GCM_REGDATE &lt; #{endExclusive}
        </if>
        
        ORDER BY GCM_IDX DESC
        </script>
        """)
    List<CustomerDTO> searchByDate(
            @Param("keyword") String keyword,
            @Param("startdate") LocalDate startdate,
            @Param("endExclusive") LocalDate endExclusive
    );
    
    @Select("""
            <script>
            SELECT
                GCM_IDX         AS gcm_Idx,
                GCM_CODE        AS gcm_Code,
                GCM_NAME        AS gcm_Name,
                GCM_EMAIL       AS gcm_Email,
                GCM_TEL         AS gcm_Tel,
                GCM_ADDR        AS gcm_Addr,
                GCM_REGDATE     AS gcm_Regdate,
                GCM_DEL_FLAG    AS gcm_Del_Flag
            FROM GE_COM_MEMBER
            WHERE GCM_DEL_FLAG = 'N'
            
            <if test="keyword != null and keyword != ''">
                AND (
                    GCM_NAME LIKE CONCAT('%', #{keyword}, '%')
                    OR GCM_EMAIL LIKE CONCAT('%', #{keyword}, '%')
                    OR GCM_TEL LIKE CONCAT('%', #{keyword}, '%')
                    OR GCM_ADDR LIKE CONCAT('%', #{keyword}, '%')
                    OR GCM_CODE LIKE CONCAT('%', #{keyword}, '%')
                )
            </if>
            
            <if test="startdate != null">
                AND GCM_REGDATE &gt;= #{startdate}
            </if>
            
            <if test="endExclusive != null">
                AND GCM_REGDATE &lt; #{endExclusive}
            </if>
            
            ORDER BY GCM_IDX DESC
            LIMIT ${nowPage},10
            </script>
            """)
        List<CustomerDTO> searchByDatePaging(
                @Param("keyword") String keyword,
                @Param("startdate") LocalDate startdate,
                @Param("endExclusive") LocalDate endExclusive,
                @Param("nowPage") Integer nowPage
        );


    //  신규 등록
    @Insert("""
        INSERT INTO GE_COM_MEMBER (
            GCM_CODE, GCM_NAME, GCM_EMAIL, GCM_TEL, GCM_ADDR, GCM_REGDATE, GCM_DEL_FLAG
        ) VALUES (
            #{gcm_Code}, #{gcm_Name}, #{gcm_Email}, #{gcm_Tel}, #{gcm_Addr}, NOW(), 'N'
        )
        """)
    int insert(CustomerDTO dto);


    //  수정
    @Update("""
        UPDATE GE_COM_MEMBER
        SET 
            GCM_NAME = #{gcm_Name},
            GCM_EMAIL = #{gcm_Email},
            GCM_TEL = #{gcm_Tel},
            GCM_ADDR = #{gcm_Addr}
        WHERE GCM_IDX = #{gcm_Idx}
        """)
    int update(CustomerDTO dto);


    //  삭제 대신 플래그 변경 (soft delete)
    @Update("""
        UPDATE GE_COM_MEMBER
        SET GCM_DEL_FLAG = 'Y'
        WHERE GCM_IDX = #{idx}
        """)
    int softDelete(@Param("idx") Long idx);
}
