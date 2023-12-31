package com.example.imple.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.reply.mapper.FreeboardReplyMapper;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.imple.member.mapper.MemberMapper;
import com.example.standard.controller.ListController;
import com.example.standard.controller.PageableController;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/freeboard")
public class FreeboardPageController implements ListController, PageableController {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	FreeboardPostMapper postMapper;
	
	@Autowired
	FreeboardReplyMapper replyMapper;
	
	@Autowired
	ObjectMapper json;
	
	@Override
	public void list(User user, Model model, HttpServletRequest request) {
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
	}

	@Override
	public String page(int pageNum, int pageSize, Model model, HttpServletRequest request) {
		
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			replyMapper.deleteReplyByPostId(deleteId);
			int replies = replyMapper.countById(deleteId);
			System.out.println(replies);
			if (replies==0) {
				postMapper.deletePost(deleteId);
			}
			return "redirect:/freeboard/page/{pageNum}/10";
		}
		
		PageHelper.startPage(pageNum, pageSize);
		var list = postMapper.selectAllWithReplyCount();
		var paging = PageInfo.of(list, 10);
		var postCount = postMapper.countAll();
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("postCount", postCount);
		
		try {
			paging.setList(null);
			var str = json.writeValueAsString(paging);
			model.addAttribute("json", str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return "freeboard/page";
	}
}
