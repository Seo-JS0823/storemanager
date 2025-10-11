package com.storemanager.member;

import java.nio.file.Path;
import java.nio.file.Paths;
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
import com.storemanager.member.encoder.BCryptPasswordEncoder;
import com.storemanager.member.upload.ImageUpload;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private ObjectMapper objectMapper;
	
	// Login 로직
	public MemberDTO login(MemberDTO member) {
		MemberDTO target = memberMapper.login(member.getGm_id());
		boolean validate = BCryptPasswordEncoder.has(member.getGm_pwd(), target.getGm_pwd());
		if(!validate) {
			return null;
		}
		
		return target;
	}
	
	// Join 로직
	@Transactional
	public ResponseEntity<Map<String, Object>> join(MultipartFile file, String memberData) {
		MemberDTO member = this.jsonToDTO(memberData);
		if(member == null) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		
		String path = ImageUpload.saveUrl(file.getOriginalFilename(), member.getGm_id());
		String fileName = ImageUpload.saveFileName(file.getOriginalFilename(), member.getGm_id());
		
		member.setGm_path(path);
		member.setGm_pwd(BCryptPasswordEncoder.encode(member));
		
		if(!ImageUpload.fileSave(file, fileName).equals(fileName)) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		// 회원가입 시작
		int joinValidate = memberMapper.join(member);
		Map<String, Object> response = null;
		if(joinValidate == 0) {
			response = Map.of(
				"status" , "FALSE",
				"message" , "알 수 없는 이유로 회원가입에 실패하였습니다.",
				"redirectUrl" , "/joinV"
			);
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
		} else {
			response = Map.of(
				"status" , "TRUE",
				"message" , "회원가입에 성공하였습니다.",
				"redirectUrl" , "/"
			);
			return ResponseEntity.ok(response);			
		}
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
		Map<String, Object> imageData = ImageUpload.getImageData(path);
		if(imageData == null) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		
		return ResponseEntity.status(HttpStatus.OK)
				             .header("Content-Type", (String) imageData.get("type"))
				             .body((byte[]) imageData.get("data"));
	}
	
	// Member Profile Update
	@Transactional
	public ResponseEntity<Map<String, String>> profileUpdate(MultipartFile file, String memberData) {
		MemberDTO member = jsonToDTO(memberData);
		
		if(file != null) {
			String path = ImageUpload.saveUrl(file.getOriginalFilename(), member.getGm_id());
			String fileName = ImageUpload.saveFileName(file.getOriginalFilename(), member.getGm_id());
			
			member.setGm_path(path);
			if(member.getGm_pwd() != "FALSE") {
				member.setGm_pwd(BCryptPasswordEncoder.encode(member));			
			}
			
			if(!ImageUpload.fileSave(file, fileName).equals(fileName)) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
			}
		}
		
		if(!member.getGm_pwd().equals("FALSE")) {
			member.setGm_pwd(BCryptPasswordEncoder.encode(member));
		}
		
		int updated = memberMapper.profileUpdate(member);
		if(updated == 0) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		
		Map<String, String> response = Map.of(
			"message", "회원정보가 변경되었습니다.",
			"redirectUrl", ""
		);
		
		return ResponseEntity.status(HttpStatus.OK)
				             .body(response);
	}
	
	
	
	// join Id Validation 로직
	public boolean joinIdValidation(String gm_id) {
		int target = memberMapper.joinIdValidation(gm_id);
		if(target == 0) return true;
		else return false;
	}
	
	// JSON 문자열을 MemberDTO로 변환
	public MemberDTO jsonToDTO(String member) {
		MemberDTO target = null;
		try {
			target = objectMapper.readValue(member, MemberDTO.class);
		} catch(JsonMappingException e1) {
			return null;
		} catch(JsonProcessingException e2) {
			return null;
		}
		return target;
	}
	
}
