package com.example.imple.diary.monthly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.imple.diary.monthly.model.Events;

@Mapper
public interface MonthlyEventsMapper {

    @Select("select * from events")
    List<Events> selectAll();
    
    @Insert("""
    		insert into events (title, starttime, endtime)
    		values (#{e.title}, #{e.starttime}, #{e.endtime})
    		
    		""")
    int insertEvent(@Param("e") Events e);
    
}
