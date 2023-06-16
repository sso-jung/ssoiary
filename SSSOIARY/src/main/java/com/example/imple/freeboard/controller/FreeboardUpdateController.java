package com.example.imple.freeboard.controller;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.model.FreeboardPostDTO;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/freeboard")
public class FreeboardUpdateController implements UpdateController<FreeboardPostDTO> {

	@Autowired
	GradeMapper gradeMapper;
	
	@Autowired
	FreeboardPostMapper mapper;
	
	@Override
	public void update(Model model, HttpServletRequest request) {
		var gradeList = gradeMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("post");
			session.removeAttribute("binding");
		}
		
		var id = request.getParameter("id");
		if (Objects.nonNull(id)) {
			var key = Integer.parseInt(id);
			var post = mapper.selectPostById(key);
			model.addAttribute("post", post);
		}
	}

	@Override
	public String update(User user, @Valid FreeboardPostDTO dto, BindingResult binding, Model model,
			HttpServletRequest request, RedirectAttributes attr) {
		
		var gradeList = gradeMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		var session = request.getSession();
		session.setAttribute("post", dto);
		session.setAttribute("binding", binding);
		var writer = (String)session.getAttribute("name");
		var day = new Date();
		
		if (binding.hasErrors())
			return "redirect:/freeboard/update?error";
		
		var post = dto.getModel(writer, day);
		var id = request.getParameter("id");
		int key;
		var page = request.getParameter("page");
		int pageNum;
		try {
			key = Integer.parseInt(id);
			pageNum = Integer.parseInt(page);
			mapper.updatePostById(post, key);
		} catch (DataIntegrityViolationException e) {
			binding.rejectValue("deptno", "9999", "없는 부서번호 입니다.");
			return "redirect:/freeboard/update?error";
		}
		
		
		
		return "redirect:/freeboard/detail/"+key+"?page="+pageNum;
	}

}
