package com.example.imple.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.reply.mapper.FreeboardReplyMapper;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.standard.controller.DetailController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/freeboard")
public class FreeboardDetailController implements DetailController<Integer> {

	@Autowired
	GradeMapper gradeMapper;
	
	@Autowired
	FreeboardPostMapper mapper;
	
	@Autowired
	FreeboardReplyMapper replyMapper;
	
	@Override
	public String detail(Integer key, Model model, HttpServletRequest request) {
		var gradeList = gradeMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		var post = mapper.selectPostById(key);
		model.addAttribute("post", post);
		var reply = replyMapper.selectAll(post.getId());
		model.addAttribute("reply", reply);
		return "freeboard/detail";
	}

}
