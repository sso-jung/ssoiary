package com.example.imple.freeboard.reply.model;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class FreeboardReplyDTO {
	@NotNull
    long id;
	
	@NotBlank
	@Length(min = 1, max = 2000)
    String content;
	
    Date day;
    
    @NotBlank
    String writer;
    
    @NotNull
    long replyId;
    
	public FreeboardReply getModel(String writer, Date day) {
		return FreeboardReply.builder()
				  .id(id)
				  .content(content)
				  .day(day)
				  .writer(writer)
				  .replyId(replyId)
				  .build();
	}
}