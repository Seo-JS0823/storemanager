package com.storemanager.item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemDTO {
    
    private int giCode;         
    private String giName;      
    private String gcmCode;     
    private String gcmName;     
    private int gisTotQty;     

}