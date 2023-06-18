package com.example.imple.member.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class Member {
    @NonNull Integer id;
    @NonNull String name;
    @NonNull String password;
    String roles;
    Integer postCount;
    Integer replyCount;
    Integer point;
    String rank;
}