package com.example.imple.member.model;

import java.util.Date;

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
    @NonNull String id;
    @NonNull String name;
    @NonNull String password;
    String roles;
    Date joindate;
    Integer postCount;
    Integer replyCount;
    Integer point;
    String rank;
}