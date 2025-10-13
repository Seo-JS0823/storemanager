package com.storemanager.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class ItemService {

    @Autowired
    private ItemMapper itemMapper;

    @Value("${file.upload-dir}")
    private String uploadDir;

    public List<ItemDTO> selectItemList() {
        return itemMapper.selectItemList();
    }
    
    public List<ItemDTO> findItems(boolean includeDeleted, String search, String searchOption) {
        Map<String, Object> params = new HashMap<>();
        params.put("includeDeleted", includeDeleted); 
        params.put("search", search);
        params.put("searchOption", searchOption); // [필수 확인] Map에 담아 전달
        return itemMapper.findItems(params);
    }
    
    @Transactional
    public int insertItem(ItemDTO item, MultipartFile file) throws IOException {
        if (file != null && !file.isEmpty()) {
            String savedFileName = saveFile(file); 
            item.setGiImg(savedFileName);
        }
        return itemMapper.insertItem(item);
    }

    public ItemDTO selectItemById(String giCode) {
        return itemMapper.selectItemById(giCode);
    }
    
    // 이미지 수정
    @Transactional 
    public int updateItem(ItemDTO item, MultipartFile file, boolean imageDeleted) throws IOException {
        String originalGiImg = item.getGiImg(); // 컨트롤러에서 설정한 기존 이미지 파일명

        // 이미지 삭제
        if (imageDeleted) {
            if (originalGiImg != null && !originalGiImg.isEmpty()) {
                deleteFile(originalGiImg); 
            }
            item.setGiImg(null); 
        
        // 이미지 교체
        } else if (file != null && !file.isEmpty()) {
            if (originalGiImg != null && !originalGiImg.isEmpty()) {
                deleteFile(originalGiImg); 
            }
            String savedFileName = saveFile(file); 
            item.setGiImg(savedFileName);
        }
        // 이미지를 건드리지 않을 경우
        return itemMapper.updateItem(item);
    }

    @Transactional
    public int deleteItem(String giCode) {
        return itemMapper.deleteItem(giCode);
    }
    
    @Transactional
    public int restoreItem(String giCode) {
        return itemMapper.restoreItem(giCode);
    }


    private String saveFile(MultipartFile file) throws IOException {
        // UUID : 파일의 중복명을 막아준다
        String originalFilename = file.getOriginalFilename();
        String savedFileName = UUID.randomUUID().toString() + "_" + originalFilename;
        
        Path uploadPath = Paths.get(uploadDir);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path destPath = uploadPath.resolve(savedFileName);
        file.transferTo(destPath.toFile());
        
        return savedFileName;
    }

    private void deleteFile(String filename) {
        if (filename == null || filename.isEmpty()) {
            return;
        }
        File fileToDelete = new File(uploadDir + filename);
        if (fileToDelete.exists()) {
            fileToDelete.delete();
        }
    }
    
}