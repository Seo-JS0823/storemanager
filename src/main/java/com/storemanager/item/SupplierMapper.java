package com.storemanager.item;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface SupplierMapper {
    List<SupplierDTO> findAll();
}