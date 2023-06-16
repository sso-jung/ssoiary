package com.example.standard.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;

public interface PageableController {

	@GetMapping("/page/{pageNum}/{pageSize}")
	String page(@PathVariable int pageNum, @PathVariable int pageSize, Model model, HttpServletRequest request);
}
