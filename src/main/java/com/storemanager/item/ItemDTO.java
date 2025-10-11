package com.storemanager.item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemDTO {
    private String giCode;  
    private String giName;    
    private String gcmCode;   
    private String giDelFlag;
    private String gcmName;
    
    private String giImg;   
    private String remark;  
}
 