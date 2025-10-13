package com.storemanager.item;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemDTO {
<<<<<<< HEAD
    private String giCode;  
    private String giName;    
    private String gcmCode;   
    private String giDelFlag;
    private String gcmName;
    
    private String giImg;   
    private String giRemark;   
}
 
=======
    
    private int giCode;         
    private String giName;      
    private String gcmCode;     
    private String gcmName;     
    private int gisTotQty;     

}
>>>>>>> edd0af4572442d2de9b4ca0b709f7328a36b019f
