package com.example.imple.diary.monthly.controller;

import java.util.List;

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
	}
    
    @GetMapping("/list-data")
    public ResponseEntity<List<Events>> listData() {
        List<Events> events = eventsMapper.selectAll();
        return ResponseEntity.ok(events);
    }
    
    @PostMapping("/add-event")
    @Transactional
    public ResponseEntity<Void> addEvent(@AuthenticationPrincipal User user, @RequestBody Events events) {
    	var writer = user.getUsername();
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
    	System.out.println(events);
    	int rowCount = eventsMapper.deleteEvent(events);
    	if (rowCount > 0) {
    		return ResponseEntity.ok().build();
    	} else {
    		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
    	}
    } 
}