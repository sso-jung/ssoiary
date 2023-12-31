package com.example.imple.grade.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class Grade {
	@NonNull String name;
    Integer point;
    String rank;
    Integer postcount;
    Integer replycount;
}