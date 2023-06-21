package com.example.imple.member.color.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.member.color.model.MemberColor;

@Mapper
public interface MemberColorMapper {

	@Select("""
			select * from member_color order by name asc
    		""")
    List<MemberColor> selectAll();
	
	@Select("""
			select * from member_color where name = #{name}
    		""")
	MemberColor selectColorByName(String name);
	
	@Select("""
			select color from member_color where name = #{name}
    		""")
	String selectStringColorByName(String name);

    @Update("""
    		update member_color
    		set color = #{m.color}
    		where name = #{m.name}
    		""")
    int updateColor(@Param("m") MemberColor memberColor);
    
    @Insert("""
    		insert into member_color
    		values (#{name},
    				#{color})
    		""")
    int insertColor(@Param("name") String name, @Param("color") String color);
}
