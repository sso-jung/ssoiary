package com.example.imple.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.member.mapper.MemberMapper;
import com.example.standard.controller.ListController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberListController implements ListController {

	@Autowired
	MemberMapper mapper;
	
	@Override
	public void list(@AuthenticationPrincipal User user, Model model, HttpServletRequest request) {
		var id = user.getUsername();
		var list = mapper.selectMemberById(id);
		int pwLength = list.getPassword().length();
		String pwEncode = "*".repeat(pwLength);
		var session = request.getSession();
		session.setAttribute("pwEncode", pwEncode);
		session.setAttribute("list", list);
	}
	
}
