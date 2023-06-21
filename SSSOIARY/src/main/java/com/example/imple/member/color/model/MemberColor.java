package com.example.imple.member.color.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class MemberColor {
    @NonNull String name;
    @NonNull String color;
}