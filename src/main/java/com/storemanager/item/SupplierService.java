 package com.storemanager.item;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@RequiredArgsConstructor
public class SupplierService {

    private final SupplierMapper supplierMapper;

    public List<SupplierDTO> findAll() {
        return supplierMapper.findAll(); 
    }
}