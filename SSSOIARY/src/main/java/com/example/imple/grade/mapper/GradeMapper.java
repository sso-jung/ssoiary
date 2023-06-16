package com.example.imple.grade.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.imple.grade.model.Grade;

@Mapper
public interface GradeMapper {

    @Select("select * from grade order by point")
    List<Grade> selectAll();

    @Select("select * from grade where name=#{name}")
    Grade selectGrade(String name);
    
}
