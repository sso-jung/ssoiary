package com.example.imple.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.imple.member.mapper.MemberMapper;
import com.example.imple.member.model.Member;

@Service
@Transactional
public class DBMemberService implements UserDetailsService {

    @Autowired
    MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Member member = memberMapper.selectByName(username);

        if (member==null) 
            throw new UsernameNotFoundException(username + "는 존재하지 않는 이름입니다.");

        return User.builder()
                   .username(member.getName())
                   .password(member.getPassword())
                   .roles(member.getRoles().split(","))
                   .build();
    }

}
