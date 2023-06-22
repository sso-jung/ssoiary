package com.example.imple.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.model.FreeboardPostDTO;
import com.example.imple.member.mapper.MemberMapper;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/freeboard")
public class FreeboardCreateController implements CreateController<FreeboardPostDTO> {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	FreeboardPostMapper mapper;
	
	@Override
	public void create(Model model, HttpServletRequest request) {
		
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("post");
			session.removeAttribute("binding");
		}
	}

	@Override
	@Options(useGeneratedKeys = true, keyProperty = "id")
	@Transactional
	public String create(FreeboardPostDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		var session = request.getSession();
		session.setAttribute("post", dto);
		session.setAttribute("binding", binding);
		var writer = (String)session.getAttribute("name");
		var day = new Date();
		
		if (binding.hasErrors()) {
			return "redirect:/freeboard/create?error";
		}
		
		var post = dto.getModel(writer, day);
		try {
			mapper.insertPost(post);
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "글 번호가 중복됩니다.");
			return "redirect:/freeboard/create?error";
		}
		
		int id = mapper.selectIdByWriter(writer);
		return "redirect:/freeboard/detail/" + id + "?page=1";
	}
	
	@PostMapping("/uploadImage")
	public ResponseEntity<Map<String,String>> uploadSummernoteImageFile(@RequestParam("file") MultipartFile file) {
		
		System.out.println("hi controller");
		Map<String, String> jsonObject = new HashMap<>();
		System.out.println("file = " + file);
		String fileRoot = "C:\\summernote_image\\";
		String originalFileName = file.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.put("url", "/summernote_image/"+savedFileName);
			jsonObject.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.put("responseCode", "error");
			e.printStackTrace();
		}
		
		System.out.println("jsonObject =" + jsonObject);
		return ResponseEntity.ok(jsonObject);
	}
}
