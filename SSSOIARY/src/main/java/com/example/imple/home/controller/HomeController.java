package com.example.imple.home.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.imple.grade.mapper.GradeMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.websocket.Session;

@Controller
public class HomeController {

	@Autowired
	GradeMapper mapper;
	
	@GetMapping("/")
	String home(@AuthenticationPrincipal User user, Model model, HttpServletRequest request) {
		var session = request.getSession();
		var name = user.getUsername();
		session.setAttribute("name", name);
		var list = mapper.selectAll();
		model.addAttribute("list", list);
		return "home";
	}
	
    @GetMapping("/login")
    void login() {
    }

    @PostMapping("/loginFail")
    public void loginFail(Model model, HttpServletRequest request) {
    	String errorMessage = null;
        Exception exception = (Exception) request.getAttribute("exception");
        if (exception instanceof BadCredentialsException) {
            errorMessage = "자격 증명에 실패하였습니다.";
        }
       model.addAttribute("errorMessage", errorMessage);
    }
}
