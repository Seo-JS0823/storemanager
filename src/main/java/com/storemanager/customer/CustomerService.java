package com.storemanager.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDate;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    // ✅ 전체 조회
    public List<CustomerDTO> findAll() {
        return customerMapper.findAll();
    }

    // ✅ 단건 조회
    public CustomerDTO findOne(Long idx) {
        return customerMapper.findOne(idx);
    }

    // ✅ 수정
    public int update(CustomerDTO dto) {
        return customerMapper.update(dto);
    }

    // ✅ 소프트 삭제
    public int softDelete(Long idx) {
        return customerMapper.softDelete(idx);
    }

    // ✅ 키워드 검색
    public List<CustomerDTO> search(String keyword) {
        return customerMapper.search(keyword);
    }

    // ✅ 날짜 + 키워드 검색 추가 (새로 추가된 기능)
    public List<CustomerDTO> searchByDate(String keyword, LocalDate startdate, LocalDate enddate) {
        // enddate 포함 처리
        LocalDate endExclusive = (enddate != null) ? enddate.plusDays(1) : null;
        return customerMapper.searchByDate(keyword, startdate, endExclusive);
    }
}
