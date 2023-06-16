package com.example.imple.member.model;

import org.hibernate.validator.constraints.Length;

import com.example.imple.grade.model.Grade;
import com.example.standard.model.Modelable;

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
    Integer id;

    @NonNull
    String name;

    @NonNull
    @Length(max = 100)
    String password;

    String roles;
    Grade grade;
    
	@Override
	public Member getModel() {
			
		return Member.builder()
					.id(10)
					.name(name)
					.password(password)
					.build();
		
	}
}