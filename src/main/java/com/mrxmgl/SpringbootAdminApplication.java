package com.mrxmgl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

@EnableFeignClients//启用feign客户端
@SpringBootApplication
@EnableEurekaClient
@ComponentScan
@ConfigurationProperties(prefix="spring.datasource")
@MapperScan("com.mrxmgl.mapper")
public class SpringbootAdminApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootAdminApplication.class, args);
		System.out.println("springboot-admin：----------------------------http://localhost:8082/admin/sys/login");
	}

}
