package com.ld;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
@MapperScan(basePackages="com.ld.dao")
public class LdProvider_Job01 {
	
	public static void main(String[] args) {
		SpringApplication.run(LdProvider_Job01.class, args);
	}
}
