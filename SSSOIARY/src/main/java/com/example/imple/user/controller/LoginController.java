package com.example.imple.user.controller;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class LoginController {
	
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
