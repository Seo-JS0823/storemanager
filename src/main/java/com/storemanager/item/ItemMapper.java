package com.storemanager.item;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ItemMapper {
    
    @Select("""
        SELECT
            gi.GI_CODE      AS giCode,
            gi.GI_NAME      AS giName,
            gcm.GCM_CODE    AS gcmCode,
            gcm.GCM_NAME    AS gcmName,
            gis.GIS_TOT_QTY AS gisTotQty
        FROM
            GE_ITEMS gi
        LEFT JOIN
            GE_COM_MEMBER gcm ON gi.GCM_CODE = gcm.GCM_CODE
        LEFT JOIN
            GE_ITEMS_STOCK gis ON gi.GI_CODE = gis.GI_CODE
        ORDER BY
            gi.GI_CODE DESC
    """)
    public List<ItemDTO> findAllItems();
}