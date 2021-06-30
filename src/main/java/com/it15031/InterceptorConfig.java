package com.it15031;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.it15031.interceptors.Authenticinterceptors;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	@Autowired
	private Authenticinterceptors authenInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authenInterceptor)
			.addPathPatterns( "/user/**","/admin/**")
			.excludePathPatterns("/login", "/register");
	}
}
