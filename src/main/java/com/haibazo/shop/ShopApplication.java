package com.haibazo.shop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EntityScan(basePackages = {"com.haibazo.model"})
@ComponentScan(basePackages = {"com.haibazo.controller","com.haibazo.repository","com.haibazo.service","com.haibazo.excetion"})
@EnableJpaRepositories(basePackages = "com.haibazo.repository")
@SpringBootApplication
public class ShopApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShopApplication.class, args);
	}

}
