package com.example.imple.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.standard.controller.ListController;
import com.example.standard.controller.PageableController;
import com.example.standard.controller.SearchController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/freeboard")
public class FreeboardSearchController implements SearchController {

	@Autowired
	GradeMapper gradeMapper;
	
	@Autowired
	FreeboardPostMapper postMapper;
	
	@Autowired
	ObjectMapper json;

	@Override
	public String page(String keyword, int pageNum, int pageSize, Model model, HttpServletRequest request) {
		var gradeList = gradeMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			postMapper.deletePost(deleteId);
			return "redirect:/freeboard/page/{pageNum}/10";
		}
		
		PageHelper.startPage(pageNum, pageSize);
		var list = postMapper.selectByKeyword(keyword);
		var paging = PageInfo.of(list, 10);
		var postCount = postMapper.selectCountByKeyword(keyword);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("postCount", postCount);
		model.addAttribute("keyword", keyword);
		
		try {
			paging.setList(null);
			var str = json.writeValueAsString(paging);
			model.addAttribute("json", str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "freeboard/search";
	}

}
