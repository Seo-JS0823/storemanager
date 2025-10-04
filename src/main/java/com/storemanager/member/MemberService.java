package com.storemanager.member;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.storemanager.member.encoder.BCrypt;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private ObjectMapper objectMapper;
	
	private final Path fileStorage = Paths.get("uploads").toAbsolutePath().normalize();
	
	// Login 로직
	public MemberDTO login(MemberDTO member) {
		MemberDTO target = memberMapper.login(member.getGm_id());
		boolean validate = has(member.getGm_pwd(), target.getGm_pwd());
		if(!validate) {
			return null;
		}
		
		return target;
	}
	
	// Join 로직
	@Transactional
	public String join(MultipartFile file, String memberData) {
		MemberDTO member = null;
		String path = null;
		String fileName = null;
		String originalFileName = file.getOriginalFilename();
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		try {
			member = objectMapper.readValue(memberData, MemberDTO.class);
			path = "uploads/" + today + "-" + member.getGm_id() + "-" + originalFileName;
			fileName = today + "-" + member.getGm_id() + "-" + originalFileName;
			member.setGm_path(path);
			member.setGm_pwd(this.encode(member));
		} catch(JsonMappingException e1) {
			e1.printStackTrace();
			return null;
		} catch(JsonProcessingException e2) {
			e2.printStackTrace();
			return null;
		}
		
		// 이미지 파일 경로에 저장
		try(InputStream is =  file.getInputStream()) {
			Path filePath = this.fileStorage.resolve(fileName);
			
			Files.copy(is, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		// 회원가입 시작
		int joinValidate = memberMapper.join(member);
		if(joinValidate == 0) {
			return null;
		}
		
		return "회원가입이 완료되었습니다.";
	}
	
	// Member Profile
	public ResponseEntity<Map<String, Object>> profile(String id) {
		MemberDTO target = memberMapper.login(id);
		if(target == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		} else {
			target.setGm_regdate(target.getGm_regdateByParse());
			
			Map<String, Object> response = Map.of(
				"member", target,
				"filepath", target.getGm_path()
			);
			return ResponseEntity.status(HttpStatus.OK).body(response);
		}
	}
	
	// Member Profile Image Thumb
	public ResponseEntity<byte[]> thumb(String fileUrl) {
		Path path = Paths.get("uploads/" + fileUrl);
		
		byte[] file = null;
		String contentType = null;
		try {
			file = Files.readAllBytes(path);
			contentType = Files.probeContentType(path);
		} catch (IOException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		return ResponseEntity.status(HttpStatus.OK)
				             .header("Content-Type", contentType)
				             .body(file);
	}
	
	// join Id Validation 로직
	public boolean joinIdValidation(String gm_id) {
		int target = memberMapper.joinIdValidation(gm_id);
		if(target == 0) return true;
		else return false;
	}
	
	public String encode(MemberDTO member) {
		if(member == null) throw new IllegalArgumentException();
		
		int cost = 11;
		String salt = BCrypt.gensalt(cost);
		return BCrypt.hashpw(member.getGm_pwd(), salt);
	}
	
	public boolean has(String param1, String param2) {
		return BCrypt.checkpw(param1, param2);
	}
	
}
