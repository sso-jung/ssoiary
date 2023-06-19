package com.example.imple.diary.monthly.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
public class Events {
    String title;
    Date starttime;
    Date endtime;
    String allday;
    String writer;
}