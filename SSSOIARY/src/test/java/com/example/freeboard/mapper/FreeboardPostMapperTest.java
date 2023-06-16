package com.example.freeboard.mapper;

import java.util.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.model.FreeboardPost;
import com.example.imple.freeboard.model.FreeboardPostDTO;

@SpringBootTest
public class FreeboardPostMapperTest {

	@Autowired
	FreeboardPostMapper mapper;
	
	@Test
	void selectAll() {
		var users = mapper.selectAll();
		System.out.println(users);
	}
	
	@Test
	void insertPost() {
		var post = FreeboardPost.builder()
								.title("하이")
								.content("하이")
								.build();
		var count = mapper.insertPost(post);
		System.out.println(post);
		System.out.println(count);
	}
	
	@Test
	@Transactional
	void updatePostById() {
		var post = FreeboardPost.builder()
								.id(100)
								.content("하이")
								.title("하이")
								.writer("박소정")
								.build();
		var update = mapper.updatePostById(post, 53);
		System.out.println(update);
	}

}
