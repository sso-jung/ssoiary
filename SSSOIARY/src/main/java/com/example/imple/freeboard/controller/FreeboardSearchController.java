package com.example.imple.freeboard.controller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.model.FreeboardPost;
import com.example.imple.member.mapper.MemberMapper;
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
	MemberMapper memberMapper;
	
	@Autowired
	FreeboardPostMapper postMapper;
	
	@Autowired
	ObjectMapper json;

	@Override
	public String page(String keyword, int pageNum, int pageSize, Model model, HttpServletRequest request) {
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			postMapper.deletePost(deleteId);
			return "redirect:/freeboard/page/{pageNum}/10";
		}
		
		List<FreeboardPost> list;
		int postCount;
		
		PageHelper.startPage(pageNum, pageSize);
		if (keyword.isBlank()) {
			list = Collections.emptyList();
			postCount = 0;
		} else {
			list = postMapper.selectByKeywordWithReplyCount(keyword);
			postCount = postMapper.selectCountByKeyword(keyword);
		}
		var paging = PageInfo.of(list, 10);
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
