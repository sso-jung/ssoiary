package com.example.imple.freeboard.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.freeboard.model.FreeboardPost;

@Mapper
public interface FreeboardPostMapper {

    @Select("select * from freeboard_post order by id desc")
    List<FreeboardPost> selectAll();
    
    @Select("""
    		select * from (
					select * from freeboard_post
					order by id desc
					)
    		where rownum <= 10
    		""")
    List<FreeboardPost> selectOnly10();
    
    @Select("""
    		select p.*, count(r.id) as reply
			from freeboard_post p
			left join freeboard_reply r on p.id = r.id
			group by p.id, p.title, p.content, p.day,  p.writer
			order by p.id desc
    		""")
    List<FreeboardPost> selectAllWithReplyCount();
    
    @Select("select count(*) from freeboard_post")
    int countAll();
    
    @Select("select count(*) from freeboard_post where writer = #{writer}")
    int postCountByWriter(@Param("writer") String writer);

    @Select("select * from freeboard_post where writer=#{writer}")
    FreeboardPost selectPostByWriter(String writer);
    
    @Select("select * from freeboard_post where title LIKE '%#{title}'")
    FreeboardPost selectPostByTitle(String title);
    
    @Select("select * from freeboard_post where id = #{id}")
    FreeboardPost selectPostById(int id);
    
    @Select("select id from freeboard_post where writer = #{writer} and day = #{day}")
    Integer selectIdByWriterAndDay(@Param("writer") String writer, @Param("day") Date day);
    
    @Select("""
    		SELECT id
			FROM (
			  SELECT id
			  FROM freeboard_post
			  WHERE writer = #{writer}
			  ORDER BY id DESC
			) WHERE ROWNUM = 1
    		""")
    Integer selectIdByWriter(@Param("writer") String writer);
    
    @Select("""
    		select * from freeboard_post
    		where title like '%' || #{keyword} || '%' or writer like '%' || #{keyword} || '%' 
    		""")
    List<FreeboardPost> selectByKeyword(@Param("keyword") String keyword);
    
    @Select("""
    	    select p.*, count(r.id) as reply
    	    from freeboard_post p
    	    left join freeboard_reply r on p.id = r.id
    	    where (p.title like '%' || #{keyword} || '%' or p.writer like '%' || #{keyword} || '%')
    	    group by p.id, p.title, p.content, p.day, p.writer
    	    order by p.id desc
    	    """)
    	List<FreeboardPost> selectByKeywordWithReplyCount(@Param("keyword") String keyword);

    
    @Select("""
    		select count(*) from freeboard_post
    		where title like '%' || #{keyword} || '%' or writer like '%' || #{keyword} || '%' 
    		""")
    int selectCountByKeyword(@Param("keyword") String keyword);
    
    int insertPost(@Param("p") FreeboardPost post);
    
    @Delete("delete freeboard_post where id = #{id}")
    int deletePost(int id);
    
    @Update("""
    		update freeboard_post
    		set title = #{p.title, jdbcType = VARCHAR},
    			content = #{p.content, jdbcType = VARCHAR}
    		where id = #{id}
    		""")
    int updatePostById(@Param("p") FreeboardPost post, @Param("id") int id);
}
