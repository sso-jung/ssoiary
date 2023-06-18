package com.example.imple.freeboard.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.freeboard.model.FreeboardPost;
import com.example.imple.freeboard.reply.model.FreeboardReply;

@Mapper
public interface FreeboardReplyMapper {

    @Select("select * from freeboard_reply where id = #{id} order by day asc")
    List<FreeboardReply> selectAll(@Param("id") long id);
    
    @Select("select count(*) from freeboard_reply where id = #{id}")
    int countById(@Param("id") long id);
    
    @Select("select count(*) from freeboard_reply where writer = #{writer}")
    int replyCountByWriter(@Param("writer") String writer);
    
    int insertReply(@Param("r") FreeboardReply reply);

    @Delete("delete from freeboard_reply where reply_id = #{replyId}")
    int deleteReplyById(@Param("replyId") long replyId);
    
    @Delete("delete from freeboard_reply where id = #{id}")
    int deleteReplyByPostId(@Param("id") long id);
    
    @Update("""
    		update freeboard_post
    		set content = #{p.content, jdbcType=VARCHAR}
    		where reply_id = #{replyId}
    		""")
    long updatePostById(@Param("p") FreeboardPost post, @Param("replyId") long replyId);
}
