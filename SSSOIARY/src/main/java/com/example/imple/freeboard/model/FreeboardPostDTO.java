package com.example.imple.freeboard.model;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

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
public class FreeboardPostDTO {
	@NotNull
    long id;
	
	@NotBlank
	@Length(min = 1, max = 100)
    String title;
	
	@Length(min = 0, max = 4000)
    String content;
	
    Date day;
    
    Integer reply;
    
    String writer;
    
	public FreeboardPost getModel(String writer, Date day) {
		return FreeboardPost.builder()
				  .id(id)
				  .title(title.trim())
				  .content(content)
				  .day(day)
				  .reply(0)
				  .writer(writer)
				  .build();
	}
}