package com.example.imple.diary.monthly.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.imple.diary.monthly.mapper.MonthlyEventsMapper;
import com.example.imple.diary.monthly.model.Events;
import com.example.imple.member.mapper.MemberMapper;
import com.example.standard.controller.ListController;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/diary/monthly")
public class MonthlyListController implements ListController{

	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MonthlyEventsMapper eventsMapper;
	
	@Autowired
	ObjectMapper objectMapper;
	
	@Override
	public void list(User user, Model model, HttpServletRequest request) {
		var gradeList = memberMapper.selectAll();
		model.addAttribute("gradeList", gradeList);
		var memberName = memberMapper.selectMemberName();
		model.addAttribute("memberName", memberName);
		System.out.println(memberName);
	}
    
    @GetMapping("/list-data")
    public ResponseEntity<List<Events>> listData(@AuthenticationPrincipal User user) {
    	var id = user.getUsername();
    	var name = memberMapper.selectNameById(id);
        List<Events> events = eventsMapper.selectAllByName(name);
        return ResponseEntity.ok(events);
    }
    
    @PostMapping("/add-event")
    @Transactional
    public ResponseEntity<Void> addEvent(@AuthenticationPrincipal User user, @RequestBody Events events) {
    	var id = user.getUsername();
    	var writer = memberMapper.selectNameById(id);
        int rowCount = eventsMapper.insertEvent(events, writer);
        if (rowCount > 0) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    } 
    
    @PostMapping("/delete-event")
    @Transactional
    public ResponseEntity<Void> deleteEvent(@RequestBody Events events) {
    	SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
    	SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
    	String formattedDate = "";
    	formattedDate = outputFormat.format(events.getStarttime());
    	int rowCount = eventsMapper.deleteEvent(events, formattedDate);
    	if (rowCount > 0) {
    		return ResponseEntity.ok().build();
    	} else {
    		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    	}
    } 
}