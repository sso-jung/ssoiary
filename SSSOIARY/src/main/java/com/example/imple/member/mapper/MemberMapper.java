package com.example.imple.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.grade.model.Grade;
import com.example.imple.member.model.Member;

@Mapper
public interface MemberMapper {
	
	@Select("""
			select * 
			  from grade
			 where name = #{name} 
			""")
	Grade selectGrade(String name);

    @Select("select * from member")
    List<Member> selectAll();

    @Select("select * from member where name=#{name}")
    Member selectByName(String name);
    
	@Select("""
			select *
			  from member
			 where name = #{name} 
			""")
	@Results({
		@Result(property = "name", column = "name"),
		@Result(property = "grade", 
				column = "name",
				one = @One(select = "selectGrade"))
	})
	Member selectByNameWithGrade(String name);

    @Update("""
    		update member 
    		set password = #{m.password, jdbcType=VARCHAR}
    		where name = #{m.name}
    		""")
    int updatePassword(@Param("m") Member member);
}
