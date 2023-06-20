package com.example.members.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.imple.member.mapper.MemberMapper;

@SpringBootTest
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper;
	
	@Test
	void selectAll() {
		var users = mapper.selectAll();
		System.out.println(users);
	}
	
	@Test
	void selectById() {
		var user = mapper.selectById("박소정");
		System.out.println(user);
	}
	
	@Test
	void selectByIdWithGrade() {
		var user = mapper.selectByNameWithGrade("박소정");
		System.out.println(user);
	}
	
}
