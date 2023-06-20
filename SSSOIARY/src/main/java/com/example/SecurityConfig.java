package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.example.imple.member.service.DBMemberService;
import com.example.imple.member.service.MemberService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    MemberService memberService;

    @Autowired
    DBMemberService dbMemberService;
	
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    	http.csrf(csrf -> {
    		csrf.disable();
    	});
    	
    	http.cors(cors -> {
    		cors.disable();
    	});
    	
    	http.authorizeHttpRequests(request -> {
    		request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
	    		   .requestMatchers("/img/**", "/js/**", "/webjars/**").permitAll()
	    		   .requestMatchers("/error").permitAll()
	    		   .requestMatchers("/user/create", "/user/success").permitAll()
	    		   .anyRequest().authenticated();
    	});
    	
    	http.formLogin(login -> {
    		login.loginPage("/user/login")
//    			 .defaultSuccessUrl("/",true)
    			 .successHandler((request, response, auth) -> {
	    		 	response.sendRedirect("/");
	    		 })
	    		 .failureHandler((request, response, exception) -> {
	    			request.setAttribute("exception", exception);
	    			request.getRequestDispatcher("/user/loginFail").forward(request, response);
	    		 })
	    		 .permitAll();
    	});
    	
    	http.logout(logout -> {
    		logout.logoutUrl("/logout")
	    		  .logoutSuccessHandler((request, response, auth) -> {
	    			  response.sendRedirect("/user/login");
	    	      })
	    		  .permitAll();
    	});
    	
    	http.rememberMe(remember -> {
    		remember.rememberMeParameter("remember-me")
    				.tokenValiditySeconds(7200)
    				.alwaysRemember(false)
    				.userDetailsService(dbMemberService);
    	});
    	
        http.userDetailsService(dbMemberService);

        return http.build();
    }
}
