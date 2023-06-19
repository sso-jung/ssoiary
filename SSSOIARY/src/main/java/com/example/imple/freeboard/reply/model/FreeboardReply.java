package com.example.imple.freeboard.reply.model;

import java.util.Date;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class FreeboardReply {
    long id;
    @NotBlank String content;
    Date day;
    String writer;
    long replyId;
}