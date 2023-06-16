package com.example.imple.freeboard.reply.model;

import java.util.Date;

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
    String content;
    Date day;
    String writer;
    long replyId;
}