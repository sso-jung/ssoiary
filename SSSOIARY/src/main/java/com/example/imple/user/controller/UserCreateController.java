package com.example.imple.user.controller;

import java.util.Date;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.grade.mapper.GradeMapper;
import com.example.imple.member.mapper.MemberMapper;
import com.example.imple.member.model.MemberDTO;
import com.example.standard.controller.CreateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserCreateController implements CreateController<MemberDTO> {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	GradeMapper gradeMapper;

	@Override
	public void create(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("member");
			session.removeAttribute("binding");
		}
	}

	@Override
	@Transactional
	public String create(@Valid MemberDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		
		var session = request.getSession();
		session.setAttribute("member", dto);
		session.setAttribute("binding", binding);
		var day = new Date();
		
		if (binding.hasErrors()) {
			return "redirect:/user/create?error";
		}
		
		var member = dto.getModel();
		var name = member.getName();
		try {
			memberMapper.insertMember(member, day);
			gradeMapper.insertGrade(name);
		} catch (DuplicateKeyException e) {
			binding.reject("duplicate key", "아이디가 중복됩니다.");
			return "redirect:/user/create?error";
		}
		
		return "redirect:/user/success";
	}
}
