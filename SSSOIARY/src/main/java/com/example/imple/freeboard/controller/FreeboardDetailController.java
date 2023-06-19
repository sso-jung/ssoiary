package com.example.imple.freeboard.controller;

import java.util.Date;
import java.util.Objects;

import org.apache.ibatis.annotations.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.reply.mapper.FreeboardReplyMapper;
import com.example.imple.freeboard.reply.model.FreeboardReplyDTO;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.imple.member.mapper.MemberMapper;
import com.example.standard.controller.DetailController;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/freeboard")
public class FreeboardDetailController implements DetailController<Integer> {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	FreeboardPostMapper postMapper;
	
	@Autowired
	FreeboardReplyMapper replyMapper;
	
	@Override
	@Transactional
	public String detail(Integer key, Model model, HttpServletRequest request) {
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		var post = postMapper.selectPostById(key);
		model.addAttribute("post", post);
		var reply = replyMapper.selectAll(post.getId());
		model.addAttribute("reply", reply);
		var session = request.getSession();
		
		var error = request.getParameter("error");
		if (Objects.isNull(error)) {
			session.removeAttribute("post");
			session.removeAttribute("binding");
		}
		String getDeleteId = request.getParameter("deleteId");
		if (getDeleteId != null && !getDeleteId.isEmpty()) {
			int deleteId = Integer.parseInt(getDeleteId);
			replyMapper.deleteReplyByPostId(deleteId);
			int replies = replyMapper.countById(deleteId);
			System.out.println(replies);
			if (replies==0) {
				postMapper.deletePost(deleteId);
			}
			return "redirect:/freeboard/page/1/10";
		}
		String getDeleteReplyId = request.getParameter("deleteReplyId");
		String pageNum = request.getParameter("page");
		if (getDeleteReplyId != null && !getDeleteReplyId.isEmpty()) {
			int deleteReplyId = Integer.parseInt(getDeleteReplyId);
			replyMapper.deleteReplyById(deleteReplyId);
			return "redirect:/freeboard/detail/{key}?page=" + pageNum;
		}
		return "freeboard/detail";
	}
	
	@GetMapping("/detail/{id}/{page}/{createReply}")
	@Options(useGeneratedKeys = true, keyProperty = "id")
	@Transactional
	public String detail(@PathVariable Integer id, @PathVariable Integer page, @PathVariable String createReply, FreeboardReplyDTO dto, BindingResult binding, Model model, HttpServletRequest request) {
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		var post = postMapper.selectPostById(id);
		model.addAttribute("post", post);
		var reply = replyMapper.selectAll(post.getId());
		model.addAttribute("reply", reply);
		var session = request.getSession();
		
		session.setAttribute("newReply", dto);
		session.setAttribute("binding", binding);
		var writer = (String)session.getAttribute("name");
		var day = new Date();
		
		var newReply = dto.getModel(writer, day, id);
		
		String content = newReply.getContent().trim();
		session.setAttribute("content", content);
		if (binding.hasErrors()) {
			return "redirect:/freeboard/detail/{id}?page={page}&?error";
		} else if (content.isEmpty()) {
			return "redirect:/freeboard/detail/{id}?page={page}&?error";
		}
		
		replyMapper.insertReply(newReply);
		
		return "redirect:/freeboard/detail/"+id+"?page="+page;
	
	}
	
}
