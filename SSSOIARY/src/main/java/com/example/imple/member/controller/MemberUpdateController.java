package com.example.imple.member.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.imple.member.mapper.MemberMapper;
import com.example.imple.member.model.MemberDTO;
import com.example.standard.controller.ListController;
import com.example.standard.controller.UpdateController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/member")
public class MemberUpdateController implements UpdateController<MemberDTO> {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public void update(Model model, HttpServletRequest request) {
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			var session = request.getSession();
			session.removeAttribute("member");
			session.removeAttribute("binding");
		}
		
		var id = request.getParameter("id");
		if (Objects.nonNull(id)) {
			var member = mapper.selectById(id);
			model.addAttribute("member", member);
		}
	}

	@Override
	public String update(@AuthenticationPrincipal User user, @Valid MemberDTO dto, BindingResult binding, Model model, HttpServletRequest request,
			RedirectAttributes attr) {
		var id = user.getUsername();	
		var name = mapper.selectNameById(id);
		var session = request.getSession();
		session.setAttribute("member", dto);
		session.setAttribute("binding", binding);
		
		if (binding.hasErrors())
			return "redirect:/member/update?error";
		
		var member = dto.getModel();
		System.out.println("member = " + member);		
		try {
			mapper.updatePassword(member);
		} catch (DataIntegrityViolationException e) {
			return "redirect:/member/update?error";
		}
		
		var list = mapper.selectMemberById(id);
		int pwLength = list.getPassword().length();
		String pwEncode = "*".repeat(pwLength);
		session.setAttribute("pwEncode", pwEncode);
		
		return "redirect:/member/success?password";
	}
	
}
