package com.example.standard.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

public interface ListController {

	@GetMapping("/list")
	void list(@AuthenticationPrincipal User user, Model model, HttpServletRequest request);
}
