package com.example.imple.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.standard.controller.SuccessController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberSuccessController implements SuccessController {

	@Override
	public void success(Model model, HttpServletRequest request) {
		
	}

}
