package com.example.imple.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.grade.mapper.GradeMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/game")
public class ListController {

	@Autowired
	GradeMapper mapper;
	
	@GetMapping("/list")
	String home(Model model, HttpServletRequest request) {
		return "game/list";
	}
}
