package com.example.imple.grade.model;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class GradeDTO implements Modelable<Grade> {
	@NotBlank
	String name;
	
    Integer point;
    String rank;
    Integer postcount;
    Integer replycount;
    
	@Override
	public Grade getModel() {
		
		return Grade.builder()
				.name(name)
				.build();
	}
}