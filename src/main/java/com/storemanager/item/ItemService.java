package com.storemanager.item;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

    private final String uploadDir = "item-images/";

    public List<ItemDTO> selectItemList() {
        return itemMapper.selectItemList();
    }

    public List<ItemDTO> findItems(boolean includeDeleted, String search, String searchOption) {
        Map<String, Object> params = new HashMap<>();
        params.put("includeDeleted", includeDeleted);
        params.put("search", search);
        params.put("searchOption", searchOption);
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

    @Transactional
    public int updateItem(ItemDTO item, MultipartFile file, boolean imageDeleted) throws IOException {
        // 기존 이미지 파일명을 DB에서 먼저 조회하여 사용합니다.
        ItemDTO existingItem = itemMapper.selectItemById(item.getGiCode());
        String originalGiImg = existingItem.getGiImg();

        // 시나리오 1: 이미지 삭제 체크
        if (imageDeleted) {
            if (originalGiImg != null && !originalGiImg.isEmpty()) {
                deleteFile(originalGiImg);
            }
            item.setGiImg(null); // DB의 이미지 경로를 null로 설정
        
        // 시나리오 2: 새 이미지로 교체
        } else if (file != null && !file.isEmpty()) {
            if (originalGiImg != null && !originalGiImg.isEmpty()) {
                deleteFile(originalGiImg); // 기존 파일 삭제
            }
            String savedFileName = saveFile(file); // 새 파일 저장
            item.setGiImg(savedFileName); // DB에 새 파일명 설정
        
        // 시나리오 3: 이미지를 건드리지 않음
        } else {
            // item 객체의 giImg 필드를 기존 값으로 유지
            item.setGiImg(originalGiImg);
        }
        
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

    public ResponseEntity<byte[]> getImage(String filename) {
        Path filePath = Paths.get(uploadDir + filename);
        try {
            byte[] data = Files.readAllBytes(filePath);
            String contentType = Files.probeContentType(filePath);
            
            final HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.parseMediaType(contentType));
            
            return new ResponseEntity<>(data, headers, HttpStatus.OK);
        } catch (IOException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}