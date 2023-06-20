package com.example.imple.member.model;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.example.imple.grade.model.Grade;
import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class MemberDTO implements Modelable<Member> {
	@NotBlank
    @Length(min = 4)
    String id;

    @NotBlank
    String name;

    @NotBlank
    @Length(min = 4)
    String password;
    
    String roles;
    
    Grade grade;
    
    Date joindate;
    
	@Override
	public Member getModel() {
			
		return Member.builder()
					.id(id)
					.name(name)
					.roles("user")
					.password(password)
					.build();
		
	}
}