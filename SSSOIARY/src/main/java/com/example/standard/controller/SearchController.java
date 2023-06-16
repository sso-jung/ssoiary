package com.example.standard.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;

public interface SearchController {

	@GetMapping("/search/{pageNum}/{pageSize}")
	String page(@RequestParam("keyword") String keyword, @PathVariable int pageNum, @PathVariable int pageSize, Model model, HttpServletRequest request);
}
