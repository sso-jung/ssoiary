package com.example.imple.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.member.color.mapper.MemberColorMapper;
import com.example.standard.controller.SuccessController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberSuccessController implements SuccessController {

	@Autowired
	MemberColorMapper colorMapper;
	
	@Override
	public void success(Model model, HttpServletRequest request) {
		
		var session = request.getSession();
		var name = (String)session.getAttribute("name");
		var color = colorMapper.selectColorByName(name);
		model.addAttribute("color", color);
		
	}

}
