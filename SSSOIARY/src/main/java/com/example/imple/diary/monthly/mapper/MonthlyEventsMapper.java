package com.example.imple.diary.monthly.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.imple.diary.monthly.model.Events;

@Mapper
public interface MonthlyEventsMapper {

    @Select("select * from monthly_events")
    List<Events> selectAll();
    
    @Select("select * from monthly_events where writer = #{writer}")
    List<Events> selectAllByName(@Param("writer") String writer);
    
    @Select("select distinct * from monthly_events where writer = #{writer}")
    List<Events> selectDistinctAllByName(@Param("writer") String writer);
    
    @Select("""
    		select distinct * from monthly_events
    		where writer in (#{writers})
    		""")
    List<Events> selectDistinctAllBySelectedNames (@Param("writers") String writers);
    
    @Insert("""
    		insert into monthly_events (title, starttime, endtime, writer)
    		values (#{e.title}, #{e.starttime}, #{e.endtime}, #{writer})
    		
    		""")
    int insertEvent(@Param("e") Events e, @Param("writer") String writer);
    
    @Delete ("delete from monthly_events where title = #{e.title} and starttime >= TO_DATE(#{time}, 'YYYY-MM-DD')")
    int deleteEvent(@Param("e") Events e, @Param("time") String time);
    
}
