package com.example.imple.home.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.imple.diary.monthly.mapper.MonthlyEventsMapper;
import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.reply.mapper.FreeboardReplyMapper;
import com.example.imple.grade.mapper.GradeMapper;
import com.example.imple.member.mapper.MemberMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	FreeboardPostMapper postMapper;
	
	@Autowired
	FreeboardReplyMapper replyMapper;
	
	@Autowired
	MonthlyEventsMapper eventsMapper;
	
	@GetMapping("/")
	String home(@AuthenticationPrincipal User user, Model model, HttpServletRequest request) {
		var session = request.getSession();
		var id = user.getUsername();
		var name = memberMapper.selectNameById(id);
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		var postList = postMapper.selectOnly10();
		model.addAttribute("postList", postList);
		var postCount = postMapper.countAll();
		if (postCount<10) {
			var blankCount = 10-postCount;
			model.addAttribute("blankCount", blankCount);
		}
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dateFormat.format(today);
		var eventsList = eventsMapper.selectOnly10(name, date);
		model.addAttribute("eventsList", eventsList);
		var eventCount = eventsMapper.CountByWriterAfterDate(name, date);
		if (eventCount<10) {
			var eventBlankCount = 10-eventCount;
			model.addAttribute("eventBlankCount", eventBlankCount);
		}
		
		return "home";
	}

}
