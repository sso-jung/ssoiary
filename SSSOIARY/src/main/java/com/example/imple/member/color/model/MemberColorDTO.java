package com.example.imple.member.color.model;

import com.example.standard.model.Modelable;
import com.example.standard.util.RandomColor;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class MemberColorDTO implements Modelable<MemberColor> {
	@NotBlank
    String name;

    @NotBlank
    String color;

	@Override
	public MemberColor getModel() {
			
		return MemberColor.builder()
					.name(name)
					.color(color)
					.build();
		
	}
}