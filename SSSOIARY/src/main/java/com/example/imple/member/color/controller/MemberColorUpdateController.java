package com.example.imple.member.color.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.member.color.mapper.MemberColorMapper;
import com.example.imple.member.color.model.MemberColorDTO;
import com.example.imple.member.mapper.MemberMapper;
import com.example.imple.member.model.MemberDTO;
import com.example.standard.controller.ListController;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/member/color")
public class MemberColorUpdateController implements UpdateController<MemberColorDTO> {

	@Autowired
	MemberMapper mapper;
	
	@Autowired
	MemberColorMapper colorMapper;
	
	@Override
	public void update(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("color");
			session.removeAttribute("binding");
		}
		
		var id = request.getParameter("id");
		System.out.println(id);
		var name = mapper.selectNameById(id);
		var color = colorMapper.selectColorByName(name);
		System.out.println(color);
		if (Objects.nonNull(id)) {
			var member= mapper.selectById(id);
			model.addAttribute("member", member);
			model.addAttribute("color", color);
		}
	}

	@Override
	public String update(@AuthenticationPrincipal User user, @Valid MemberColorDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		var id = user.getUsername();	
		var name = mapper.selectNameById(id);
		var session = request.getSession();
		session.setAttribute("color", dto);
		session.setAttribute("binding", binding);
		
		if (binding.hasErrors())
			return "redirect:/member/color/update?error";
		
		var color = dto.getModel();
		System.out.println("color = " + color);		
		try {
			colorMapper.updateColor(color);
		} catch (DataIntegrityViolationException e) {
			return "redirect:/member/color/update?error";
		}
		
		return "redirect:/member/success?color";
	}
	
}
