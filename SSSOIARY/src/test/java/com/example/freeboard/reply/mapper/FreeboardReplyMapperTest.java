package com.example.freeboard.reply.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.example.imple.freeboard.mapper.FreeboardPostMapper;
import com.example.imple.freeboard.model.FreeboardPost;
import com.example.imple.freeboard.reply.mapper.FreeboardReplyMapper;
import com.example.imple.freeboard.reply.model.FreeboardReply;

@SpringBootTest
public class FreeboardReplyMapperTest {

	@Autowired
	FreeboardReplyMapper mapper;
	
	@Test
	void selectAll() {
		var replies = mapper.selectAll(10);
		System.out.println(replies);
	}
	
	@Test
	@Transactional
	void insertPost() {
		var reply = FreeboardReply.builder()
								.content("하이")
								.id(2)
								.build();
		var count = mapper.insertReply(reply);
		System.out.println(reply);
		System.out.println(count);
	}

}
