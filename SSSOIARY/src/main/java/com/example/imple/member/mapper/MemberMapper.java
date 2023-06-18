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
			SELECT member.name, roles,
			       (SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) AS postcount,
			       (select count(*) from freeboard_reply where writer = member.name) as replycount,
			       ((SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) * 5 +
			        (SELECT COUNT(*) FROM freeboard_reply WHERE writer = member.name) * 1) AS point,
			       (SELECT grade FROM rank WHERE ((SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) * 5 +
			                                      (SELECT COUNT(*) FROM freeboard_reply WHERE writer = member.name) * 1)
			                                     BETWEEN rank.lowpoint AND rank.highpoint) AS rank
			FROM member, grade
			WHERE member.name = grade.name
			order by point desc
    		""")
    List<Member> selectAll();
	
	@Select("""
			SELECT member.name, roles, password,
			       (SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) AS postcount,
			       (select count(*) from freeboard_reply where writer = member.name) as replycount,
			       ((SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) * 5 +
			        (SELECT COUNT(*) FROM freeboard_reply WHERE writer = member.name) * 1) AS point,
			       (SELECT grade FROM rank WHERE ((SELECT COUNT(*) FROM freeboard_post WHERE writer = member.name) * 5 +
			                                      (SELECT COUNT(*) FROM freeboard_reply WHERE writer = member.name) * 1)
			                                     BETWEEN rank.lowpoint AND rank.highpoint) AS rank
			FROM member, grade
			WHERE member.name = grade.name
			 	  and member.name = #{name}
			order by point desc
    		""")
    Member selectMemberByName(String name);

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
