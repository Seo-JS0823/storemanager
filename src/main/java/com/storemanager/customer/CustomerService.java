package com.storemanager.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper; // 🔹 final 제거 + @Autowired 추가

    // 조회
    public List<CustomerDTO> findAll() {
        return customerMapper.findAll();
    }

    public CustomerDTO findOne(Long idx) {
        return customerMapper.findOne(idx);
    }

    // 🔹 (선택) 아래 3개 메서드가 필요하다면 mapper에도 추가해야 함
    public int update(CustomerDTO dto) {
        return customerMapper.update(dto);
    }

    public int softDelete(Long idx) {
        return customerMapper.softDelete(idx);
    }

    public List<CustomerDTO> search(String keyword) {
        return customerMapper.search(keyword);
    }
}
